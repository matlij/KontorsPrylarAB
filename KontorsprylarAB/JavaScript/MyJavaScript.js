
$(document).ready(function () {

    $("#loadButton").click(function () {
       LoadArticlesLoggedIn();
    });

    $("#buttonShowCart").click(function () {
        LoadCart();
    });
});

function removeItemFromCart(CartID)
{
    $.get("/services/articleLiteral.aspx?action=removeFromCart&CartID=" + CartID).done(function (result) {

    });
}

function LoadCart() {
    //Kundnr hårdkodat!
    $.getJSON("/services/articleLiteral.aspx?action=readCart&cid=1").done(function (theCart) {

        console.log(theCart);

        for (var i = 0; i < theCart.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theCart[i].AID1 + "</td>";
            tableRow += "<td>" + theCart[i].ArticleName + "</td>";
            tableRow += "<td>" + theCart[i].Description + "</td>";
            tableRow += "<td>" + theCart[i].Price + "</td>";

            tableRow += "<td><input type='button' value='Radera' onclick='removeItemFromCart(" + theCart[i].ID1 + ");' /></td>";
            tableRow += "</tr>";

            $("#CartTableBody").append(tableRow);
        }

    });
}

function LoadArticlesLoggedIn() {

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

function LoadArticlesNotLoggedIn() {

    $.getJSON("/services/articleLiteral.aspx?action=loadArticles").done(function (theArticles) {

        $("#myTableBody").empty();
        //console.log(theContacts);

        for (var i = 0; i < theArticles.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theArticles[i].ID1 + "</td>";
            tableRow += "<td>" + theArticles[i].ArticleName + "</td>";
            tableRow += "<td>" + theArticles[i].Description + "</td>";
            tableRow += "<td>" + theArticles[i].Price + "</td></tr >";

            $("#myTableBody").append(tableRow);
        }
    });
}

function addItem(aid) {
    //Kundnr hårdkodat!
    $.get("/services/articleLiteral.aspx?action=addToCart&cid=1&aid="+aid).done(function (cartItem) {
        console.log(cartItem);

        if (cartItem.trim() == "ok")
            alert("Produkt tillagd!")
        else
            alert("Något blev fel")
    });
}

