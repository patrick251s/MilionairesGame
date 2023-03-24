$(document).ready(function() {
    fetch("http://localhost:8080/getUserRanking", {
        method: "get"
    })
    .then(response => response.json())
    .then((response) => {
        console.log(response);
        displayUsersRanking(response);
    });
});

function displayUsersRanking(response) {
    let HTML = '<table class="table table-striped table-bordered table-light"><thead><tr><th scope="col">Ranking<th scope="col">Login</th><th scope="col">Najlepszy wynik</th></tr></thead><tbody>';
    for(let i=0; i<response.length; i++) {
        HTML += '<tr><th scope="row">'+(i+1)+'</th><td>'+response[i].login+'</td><td>'+response[i].bestresult+'</td></tr>';
    }
    HTML += '</tbody></table>';
    $("#ranking").html(HTML);
}


