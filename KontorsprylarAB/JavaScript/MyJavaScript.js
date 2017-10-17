
$(document).ready(function () {
    $("#loadButton").click(function () {
        LoadArticles();
    });
});

function LoadArticles() {

    $.getJSON("/services/articleLiteral.aspx?action=loadArticles").done(function (theArticles) {

        $("#myTableBody").empty();
        //console.log(theContacts);

        for (var i = 0; i < theArticles.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theArticles[i].ID1 + "</td>";
            tableRow += "<td>" + theArticles[i].ArticleName + "</td>";
            tableRow += "<td>" + theArticles[i].Description + "</td>";
            tableRow += "<td>" + theArticles[i].Price + "</td>";

            tableRow += "<td><input type='button' value='Köp' onclick='addItem(" + theArticles[i].ID1 + ");' /></td>";
            tableRow += "</tr>";

            $("#myTableBody").append(tableRow);
        }
    });

}

function addItem(aid) {
    window.location.href = "index.aspx?action=addToCart&aid=" + aid;

    LoadArticles();
}

//function addItem(aid) {
//    $.get("/services/articleLiteral.aspx?action=addToCart&aid=" + aid).done(function (data) {
//        if (data.trim() == "Hurra!!!") {
//            alert("Artikel tillagd");
//        }
//        else {
//            alert("Fel");
//        }

//    });
//}