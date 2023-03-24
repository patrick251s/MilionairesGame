package com.example.pai_projekt.services;

import com.example.pai_projekt.dao.QuestionDao;
import com.example.pai_projekt.entities.Question;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {
    @Autowired
    private QuestionDao questionRepository;
    
    public Question getQuestion(int id) {
        return questionRepository.findById(id);
    }
    
    public List<Question> getAllQuestions() {
        return (List<Question>) questionRepository.findAll();
    }
    
    public void saveQuestion(Question q) {
        questionRepository.save(q);
    }
}
