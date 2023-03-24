let isDrawBTNClickedForStartGame = false;
let previousUserResult = 0;

$(document).ready(function() {
    //Pobranie aktualnego wyniku gry
    fetch("http://localhost:8080/getCurrentResult", {
        method: "get"
    })
    .then(response => response.text())
    .then((response) => {
        console.log(response);
        $("#currentResult").html(response);
        previousUserResult = response;
    });
    //Sprawdzenie czy wylosowaliśmy pytanie i jeszcze nie odpowiedzieliśmy na nie
    fetch("http://localhost:8080/checkQuestionDrawed", {
        method: "get"
    })
    .then(response => response.json())
    .then((response) => {
        console.log(response);
        displayQuestionContent(response);
    });
    //Sprawdzenie czy koła były wykorzystane
    fetch("http://localhost:8080/checkHalfByHalfUse", {
        method: "get"
    })
    .then(response => response.text())
    .then((response) => {
        let isUsed = (response === 'true');
        $("#halfByHalfBTN").prop("disabled", isUsed);
        isDrawBTNClickedForStartGame = true;
    });
    fetch("http://localhost:8080/checkChangeQuestionUse", {
        method: "get"
    })
    .then(response => response.text())
    .then((response) => {
        let isUsed = (response === 'true');
        $("#changeQuestionBTN").prop("disabled", isUsed);
        isDrawBTNClickedForStartGame = true;
    });
    fetch("http://localhost:8080/checkStatisticUse", {
        method: "get"
    })
    .then(response => response.text())
    .then((response) => {
        let isUsed = (response === 'true');
        $("#statisticBTN").prop("disabled", isUsed);
        isDrawBTNClickedForStartGame = true;
    });
});

$(document).on('click', '#drawBTN', function(){ 
    if(!isDrawBTNClickedForStartGame) {
        $("#halfByHalfBTN, #changeQuestionBTN, #statisticBTN").prop("disabled", false);
        $("#allQuestionsInfo, #falseAnswerInfo").remove();
    }
    isDrawBTNClickedForStartGame = true;
    $("#questionContent").html("");
    $("#answerA, #answerB, #answerC, #answerD").html("").removeClass("bg-success bg-danger").addClass("bg-light");
    $("#statisticA, #statisticB, #statisticC, #statisticD").html("");
    fetch("http://localhost:8080/question", {method: "get"})
        .then(response => response.json())
        .then((response) => {
            console.log(response);
            displayQuestion(response);
        });
});

function displayQuestion(response) {
    //Jeśłi user odpowiedział na wszystkie możliwe pytania - wyświetlamy komunikat
    if(response.id === 0 && response.content === null) {
        $('<div class="alert alert-warning py-2 col-10 col-xl-6 mx-auto" role="alert" id="allQuestionsInfo">Odpowiedziałeś na wszystkie dostępne pytania!</div>').insertAfter("#lifebuoys");
        isDrawBTNClickedForStartGame = false;
        $("#drawBTN").prop("disabled", false);
        return;
    }
    displayQuestionContent(response);
}

function displayQuestionContent(response) {
    if(response.content === null) return;
    if(response.link !== null) {
    $("#questionContent").html(response.content+"<br/><audio controls src='"+response.link+"'>The browser not support audio!</audio>");
    }
    else {
        $("#questionContent").html(response.content);
    }
    $("#answerA").html(response.answerA);
    $("#answerB").html(response.answerB);
    $("#answerC").html(response.answerC);
    $("#answerD").html(response.answerD);
    $("#answerA, #answerB, #answerC, #answerD").prop("disabled", false);
    $("#drawBTN").prop("disabled", true);
}

$(document).on('click', '#answerA, #answerB, #answerC, #answerD', function(){
    $("#answerA, #answerB, #answerC, #answerD").prop("disabled", true);
    let selectedID = $(this).attr("id");
    let userAnswer = $(this).text();
    let URL = "http://localhost:8080/checkAnswer";
    fetch(URL, {
        method: "post",
        body: userAnswer
    })
    .then(response => response.text())
    .then((response) => {
        console.log(response);
        markUserAnswer(response, selectedID);
    });
});

function markUserAnswer(response, selectedID) {
    //Kiedy gracz nie odpowiedział na pytanie i kliknal wylosuj pytanie
    if(response === -1) return;
    let buttonID = "#"+selectedID;
    $(buttonID).addClass("bg-warning").removeClass("bg-light");
    //czekamy 3 sekundy
    setTimeout(function() {
        let currentUserResult = response;
        //Jeśli odpowiedź była poprawna, czyli obecny wynik jest rózny od 0
        if(currentUserResult != 0) {
            $(buttonID).addClass("bg-success").removeClass("bg-light bg-warning");
            previousUserResult = currentUserResult;
        }
        else {
            $(buttonID).addClass("bg-danger").removeClass("bg-light bg-warning");
            isDrawBTNClickedForStartGame = false;
            $("#halfByHalfBTN, #changeQuestionBTN, #statisticBTN").prop("disabled", true);
            //Wyświetlamy komunikat o końcu rundy
            $('<div class="alert alert-danger alert-dismissible fade show py-2 col-10 col-xl-6 mx-auto" role="alert" id="falseAnswerInfo">Twoja odpowiedź jest niepoprawna.<br/> Uzyskany wynik: <b>'+previousUserResult+'</b><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>').insertAfter("#lifebuoys");
            previousUserResult = 0;
        }
        $("#currentResult").html(currentUserResult);
        $("#drawBTN").prop("disabled", false);
    }, 3000);
}

$(document).on('click', '#changeQuestionBTN', function(){
    fetch("http://localhost:8080/changeQuestion", {
        method: "get"
    })
    .then(response => response.json())
    .then((response) => {
        $('#changeQuestionBTN').prop("disabled", true);
        $("#statisticA, #statisticB, #statisticC, #statisticD").html("");
        displayQuestion(response);
    });
});

$(document).on('click', '#halfByHalfBTN', function(){
    fetch("http://localhost:8080/halfByHalf", {
        method: "get"
    })
    .then(response => response.json())
    .then((response) => {
        $('#halfByHalfBTN').prop("disabled", true);
        console.log(response);
        removeTwoIncorrectAnswers(response);
    });
});

function removeTwoIncorrectAnswers(response) {
    if(response.length === 0) return;
    for(let i=0; i<response.length; i++) {
        if($("#answerA").html() === response[i]) {
            $("#answerA").html("");
            $("#answerA").prop("disabled", true);
        }
        if($("#answerB").html() === response[i]) {
            $("#answerB").html("");
            $("#answerB").prop("disabled", true);
        }
        if($("#answerC").html() === response[i]) {
            $("#answerC").html("");
            $("#answerC").prop("disabled", true);
        }
        if($("#answerD").html() === response[i]) {
            $("#answerD").html("");
            $("#answerD").prop("disabled", true);
        }
    }
}

$(document).on('click', '#statisticBTN', function(){
    fetch("http://localhost:8080/getQuestionStatistic", {
        method: "get"
    })
    .then(response => response.json())
    .then((response) => {
        $('#statisticBTN').prop("disabled", true);
        console.log(response);
        displayStatistics(response);
    });
});

function displayStatistics(response) {
    for(let r in response) {
        console.log(r);
        if($("#answerA").html() === r) {
            $("#statisticA").html(response[r]+"%");
        }
        if($("#answerB").html() === r) {
            $("#statisticB").html(response[r]+"%");
        }
        if($("#answerC").html() === r) {
            $("#statisticC").html(response[r]+"%");
        }
        if($("#answerD").html() === r) {
            $("#statisticD").html(response[r]+"%");
        }
    }
}