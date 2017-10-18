
$(document).ready(function () {

    $("#loadButton").click(function () {
        CheckUserName();
    });

    $("#buttonShowCart").click(function () {
        LoadCart();
    });
});

function CheckUserName() {
    $.get("/services/articleLiteral.aspx?action=checkUserName").done(function (theUserName) {

        //If user is admin
        if (theUserName.trim() == "admin") {
            LoadArticles(1);
        }
        else if (theUserName.trim().length > 0) {
            LoadArticles(2);
        }
        else {
            LoadArticles(0);
        }
    });
}

function LoadArticles(userType) {

    $.getJSON("/services/articleLiteral.aspx?action=loadArticles").done(function (theArticles) {
        alert("Test");
        $("#myTableBody").empty();
        // Console.Log(theContacts);

        for (var i = 0; i < theArticles.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theArticles[i].ID1 + "</td>";
            tableRow += "<td>" + theArticles[i].ArticleName + "</td>";
            tableRow += "<td>" + theArticles[i].Description + "</td>";
            tableRow += "<td>" + theArticles[i].Price + "</td>";

            if (userType == 1) {
                tableRow += "<td><input type='button' value='Ändra' /></td>";
                tableRow += "<td><input type='button' value='Ta bort' /></td>";
            }

            if (userType == 2) {
                tableRow += "<td><input type='button' value='Köp' onclick='addItem(" + theArticles[i].ID1 + ");' /></td>";
            }
            tableRow += "</tr>";

            // onclick='addItem(" + theArticles[i].ID1 + ");' 
            $("#myTableBody").append(tableRow);
        }
    });

}

function removeItemFromCart(CartID) {
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

function DeleteArticle(aid) {
    $.get("/services/articleLiteral.aspx?action=deleteAID&aid=" + aid).
        done(function (data) {
            if (data.trim() == "ok") {
                LoadArticles();
            }

        });
}

function addItem(aid) {
    //Kundnr hårdkodat!
    $.get("/services/articleLiteral.aspx?action=addToCart&cid=1&aid=" + aid).done(function (cartItem) {
        console.log(cartItem);

        if (cartItem.trim() == "ok")
            alert("Produkt tillagd!")
        else
            alert("Något blev fel")
    });
}

