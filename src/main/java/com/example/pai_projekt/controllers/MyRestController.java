package com.example.pai_projekt.controllers;

import com.example.pai_projekt.dao.UserDao;
import com.example.pai_projekt.entities.Question;
import com.example.pai_projekt.entities.User;
import com.example.pai_projekt.services.QuestionService;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyRestController {
    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private UserDao userDao;
    
    @GetMapping("/question")
    public Question getRandomQuestion(HttpServletRequest request, Principal principal) {
        HttpSession session = request.getSession();
        //W przypadku kiedy gracz nie odpowiedział na pytanie i chce kliknac wylosuj pytanie - zwracamy to samo
        if(session.getAttribute("isUserGiveAnswer") != null && (boolean)session.getAttribute("isUserGiveAnswer") == false) {
            return (Question) session.getAttribute("question");
        }
        Question chosenQuestion = doDrawingQuestion(session, principal);
        return chosenQuestion;
    }
    
    public Question doDrawingQuestion(HttpSession session, Principal principal) {
        //Pobieramy wszystkie pytania z bazy
        List<Question> allQuestions = questionService.getAllQuestions();
        //Pobiearmy liste ID pytań które już były w rundzie
        List<Integer> usedQuestionsIDList = (List<Integer>) session.getAttribute("usedQuestionsIDList");
        if(usedQuestionsIDList == null) {
            usedQuestionsIDList = new ArrayList<>();
        }
        //Tworzymy listę z id pytań
        List<Integer> idQuestionList = new ArrayList<>();
        for (Question q : allQuestions) {
            idQuestionList.add(q.getId());
        }
        //Usuwamy z listy id wszystkich pytań te które były już w rundzie
        idQuestionList.removeAll(usedQuestionsIDList);
        //Jeśli gracz odpowiedział w jednej rundzie na wszytskie dostępne pytania
        if(idQuestionList.isEmpty()) {
            checkUserBestResult(principal, (int) session.getAttribute("currentUserResult"));
            session.setAttribute("currentUserResult", 0);
            return new Question();
        }
        Random rand = new Random();
        //losujemy id pozycji z listy
        int randomNumberFromList = rand.nextInt(idQuestionList.size());
        int drawedQuestionID = idQuestionList.get(randomNumberFromList);
        //wybieramy pytanie o wylosowanym id z listy
        Question chosenQuestion = questionService.getQuestion(drawedQuestionID);
        //Dodajemy do sesji listę z używanymi pytaniami w danej rundzie
        usedQuestionsIDList.add(chosenQuestion.getId());
        session.setAttribute("usedQuestionsIDList", usedQuestionsIDList);
        //mieszanie odpowiedzi
        List<String> answersToMix = Arrays.asList(chosenQuestion.getAnswerA(), chosenQuestion.getAnswerB(), chosenQuestion.getAnswerC(), chosenQuestion.getAnswerD());
        Collections.shuffle(answersToMix);
        chosenQuestion.setAnswerA(answersToMix.get(0));
        chosenQuestion.setAnswerB(answersToMix.get(1));
        chosenQuestion.setAnswerC(answersToMix.get(2));
        chosenQuestion.setAnswerD(answersToMix.get(3));
        //zapisanie do sesji poprawnej odp i usunięcie jej z obiektu
        session.setAttribute("correctAnswer", chosenQuestion.getCorrect());
        chosenQuestion.setCorrect("");
        //zapisanie danych pytania w sesji
        session.setAttribute("question", chosenQuestion);
        session.setAttribute("isUserGiveAnswer", false);
        return chosenQuestion;
    }
    
    @PostMapping("/checkAnswer")
    public int checkUserAnswer(@RequestBody String userAnswer, HttpServletRequest request, Principal principal) {
        HttpSession session = request.getSession();
        String correctAnswerFromSession = session.getAttribute("correctAnswer").toString();
        //Dodajemy odpowiedź gracza to statystyk w bazie
        Question currentQuestion = (Question)session.getAttribute("question");
        saveUserAnswerToStatistics(userAnswer, currentQuestion.getId());
        session.removeAttribute("correctAnswer");
        session.setAttribute("isUserGiveAnswer", true);
        boolean isCorrectAnswer = correctAnswerFromSession.equals(userAnswer);
        //Jeśli odpowiedź jest poprawna zapisujemy w sesji aktualny wynik
        int currentUserResult = 0;
        if(isCorrectAnswer) {
            if(session.getAttribute("currentUserResult") == null) {
                currentUserResult = 1;
            }
            else {
                currentUserResult = (int) session.getAttribute("currentUserResult");
                currentUserResult++;
            } 
            //Sprawdzamy czy wynik jest lepszy od dotychczasowego best result
            checkUserBestResult(principal, currentUserResult);
        }
        //Jeśli odpowiedź była błędna, czyścimy listę zadanych pytań i sprawdzamy czy wynik jest lepszy od best_result
        else {
            session.removeAttribute("usedQuestionsIDList");
            session.removeAttribute("isChangeQuestionUsed");
            session.removeAttribute("isHalfByHalfUsed");
            session.removeAttribute("isStatisticUsed");
            currentUserResult = 0;
        }
        session.setAttribute("currentUserResult", currentUserResult);
        session.removeAttribute("question");
        return currentUserResult;
    }
    
    public void checkUserBestResult(Principal principal, int currentResult) {
        User user = userDao.findByLogin(principal.getName());
        //Jeśli uzyskany wynik jest lepszy od dotychczasowego, zapisujemy nowy wynik
        if(currentResult > user.getBestresult()) {
            user.setBestresult(currentResult);
            userDao.save(user);
        }
    }
    
    public void saveUserAnswerToStatistics(String userAnswer, int questionID) {
        Question question = questionService.getQuestion(questionID);
        int newCounter;
        if(question.getAnswerA().equals(userAnswer)) {
            newCounter = question.getCounterA()+1;
            question.setCounterA(newCounter);
        }
        else if(question.getAnswerB().equals(userAnswer)) {
            newCounter = question.getCounterB()+1;
            question.setCounterB(newCounter);
        }
        else if(question.getAnswerC().equals(userAnswer)) {
            newCounter = question.getCounterC()+1;
            question.setCounterC(newCounter);
        }
        else if(question.getAnswerD().equals(userAnswer)) {
            newCounter = question.getCounterD()+1;
            question.setCounterD(newCounter);
        }
        questionService.saveQuestion(question);
    }
    
    @GetMapping("/getCurrentResult")
    public int getUserCurrentResult(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("currentUserResult") == null) return 0;
        else return (int)session.getAttribute("currentUserResult");
    }
    
    @GetMapping("/checkQuestionDrawed")
    public Question getDrawedQuestion(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("question") == null) return new Question();
        else return (Question) session.getAttribute("question");
    }
    
    @GetMapping("/changeQuestion")
    public Question changeQuestion(HttpServletRequest request, Principal principal) {
        HttpSession session = request.getSession();
        //Jeśli gracz już wykorzystał koło 
        if(session.getAttribute("isChangeQuestionUsed") != null && (boolean)session.getAttribute("isChangeQuestionUsed") == true) {
            return (Question) session.getAttribute("question");
        }
        session.setAttribute("isChangeQuestionUsed", true);
        Question newQuestion = this.doDrawingQuestion(session, principal);
        return newQuestion;
    }
    
    @GetMapping("/halfByHalf")
    public List<String> getTwoIncorrectQuestion(HttpServletRequest request) {
        HttpSession session = request.getSession();
        //Jeśli gracz już wykorzystał koło 
        if(session.getAttribute("isHalfByHalfUsed") != null && (boolean)session.getAttribute("isHalfByHalfUsed") == true) {
            return new ArrayList<>();
        }
        session.setAttribute("isHalfByHalfUsed", true);
        Question question = (Question) session.getAttribute("question");
        String correctAnswer = (String) session.getAttribute("correctAnswer");
        List<String> incorrectAnswers = new ArrayList<>();
        if(!question.getAnswerA().equals(correctAnswer)) incorrectAnswers.add(question.getAnswerA());
        if(!question.getAnswerB().equals(correctAnswer)) incorrectAnswers.add(question.getAnswerB());
        if(!question.getAnswerC().equals(correctAnswer)) incorrectAnswers.add(question.getAnswerC());
        if(!question.getAnswerD().equals(correctAnswer)) incorrectAnswers.add(question.getAnswerD());
        Collections.shuffle(incorrectAnswers);
        incorrectAnswers.remove(2);
        return incorrectAnswers;
    }
    
    @GetMapping("/checkHalfByHalfUse")
    public boolean isHalfByHalfUsed(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("isHalfByHalfUsed") == null) return false;
        else return true;
    }
    
    @GetMapping("/checkChangeQuestionUse")
    public boolean isChangeQuestionUsed(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("isChangeQuestionUsed") == null) return false;
        else return true;
    }
    
    @GetMapping("/checkStatisticUse")
    public boolean isStatisticUsed(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("isStatisticUsed") == null) return false;
        else return true;
    }
    
    @GetMapping("/getUserRanking")
    public List<User> getUserRanking() {
        List<User> users = userDao.findTop10ByOrderByBestresultDesc();
        for(User u : users) {
            u.setPassword("");
        }
        return users;
    }
    
    @GetMapping("/getQuestionStatistic")
    public Map<String, Integer> getQuestionStatistic(HttpServletRequest request) {
        HttpSession session = request.getSession();
        //Jeśli gracz już wykorzystał koło 
        /*if(session.getAttribute("isStatisticUsed") != null && (boolean)session.getAttribute("isStatisticUsed") == true) {
           return new HashMap<>();
        }*/
        session.setAttribute("isStatisticUsed", true);
        HashMap<String, Integer> hashMap = new HashMap<>();
        Question question = (Question)session.getAttribute("question");
        int counterA = question.getCounterA();
        int counterB = question.getCounterB();
        int counterC = question.getCounterC();
        int counterD = question.getCounterD();
        float sum = counterA+counterB+counterC+counterD;
        if(sum == 0) sum = 1;
        float resultA = counterA/sum * 100;
        float resultB = counterB/sum * 100;
        float resultC = counterC/sum * 100;
        float resultD = counterD/sum * 100;
        hashMap.put(question.getAnswerA(), Math.round(resultA));
        hashMap.put(question.getAnswerB(), Math.round(resultB));
        hashMap.put(question.getAnswerC(), Math.round(resultC));
        hashMap.put(question.getAnswerD(), Math.round(resultD));
        return hashMap;
    }
}
