
$(document).ready(function () {

    LoadArticles();

    $("#buttonShowCart").click(function () {
        LoadCart();
    });

    $("#loadButtonOrderHistory").click(function () {
        LoadOrderHistory();
    });

    $("#buttonConfirmOrder").click(function () {
        ConfirmOrder1();
    });
    
});

function LoadOrderHistory() {
    $.get("/services/articleLiteral.aspx?action=checkCustomerID").done(function (theCustomerID) {
        var cid = theCustomerID.trim();
        LoadOrderHistory2(cid);
    });
}

function LoadOrderHistory2(cid) {

    $.getJSON("/services/articleLiteral.aspx?action=readOrderHistory&cid=" + cid).done(function (theOrderHistory) {

        console.log(theOrderHistory);

        $("#myTbOrderHistory").empty();

        for (var i = 0; i < theOrderHistory.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theOrderHistory[i].Oid + "</td>";
            tableRow += "<td>" + theOrderHistory[i].Aid + "</td>";
            tableRow += "<td>" + theOrderHistory[i].ArticleName + "</td>";
            tableRow += "<td>" + theOrderHistory[i].Description + "</td>";
            tableRow += "<td>" + theOrderHistory[i].Price + "</td>";
            tableRow += "</tr>";

            $("#myTbOrderHistory").append(tableRow);
        }
    });
}

function LoadArticles() {
    $.get("/services/articleLiteral.aspx?action=checkUserName").done(function (theUserName) {

        //If user is admin
        if (theUserName.trim() == "admin") {
            LoadArticles2(1);
        }
        else if (theUserName.trim().length > 0) {
            LoadArticles2(2);
        }
        else {
            LoadArticles2(0);
        }
    });
}

function LoadArticles2(userType) {

    $.getJSON("/services/articleLiteral.aspx?action=loadArticles").done(function (theArticles) {
        $("#myTableBody").empty();
        // Console.Log(theContacts);

        for (var i = 0; i < theArticles.length; i++) {

            var tableRow = "<tr>";
            tableRow += "<td>" + theArticles[i].ID1 + "</td>";
            tableRow += "<td>" + theArticles[i].ArticleName + "</td>";
            tableRow += "<td>" + theArticles[i].Description + "</td>";
            tableRow += "<td>" + theArticles[i].Price + "</td>";

            if (userType == 1) {
                tableRow += "<td><input type='button' value='Ändra' onclick='UpdateArticle(" + theArticles[i].ID1 + ");'/></td>";
                tableRow += "<td><input type='button' value='Ta bort' onclick='DeleteArticle(" + theArticles[i].ID1 + ");' /></td>";
            }

            else if (userType == 2) {
                tableRow += "<td><input type='button' value='Lägg till i varukorg' onclick='addItemToCart(" + theArticles[i].ID1 + ");' /></td>";
            }
            tableRow += "</tr>";

            // onclick='addItem(" + theArticles[i].ID1 + ");' 
            $("#myTableBody").append(tableRow);
        }
        if (userType == 1) {
            var tableRowAddButton = "<tr><td></td><td></td><td></td><td><input type='button' value='Lägg till produkt' onclick='AddArticle();' /></td></tr>";
            $("#myTableBody").append(tableRowAddButton);
        }
    });
}

function AddArticle() {
    window.location = "/showArticle.aspx?action=Add";
}

function UpdateArticle(aid) {
    window.location = "/showArticle.aspx?action=Update&aid=" + aid;
}

function DeleteArticle(aid) {
    $.get("/services/articleLiteral.aspx?action=deleteAID&aid=" + aid).
        done(function (data) {
            if (data.trim() == "ok") {
                LoadArticles();
            }
        });
}

function removeItemFromCart(CartID) {
    $.get("/services/articleLiteral.aspx?action=checkCustomerID").done(function (theCustomerID) {
        var cid = theCustomerID.trim();
        removeItemFromCart2(CartID, cid);
    });
}

function removeItemFromCart2(CartID, cid) {
    $.get("/services/articleLiteral.aspx?action=removeFromCart&CartID=" + CartID + "&cid=" + cid).done(function (result) {
        if (result.trim() == "ok") {
            LoadCart();
        }
    });
}

function LoadCart() {
    $.get("/services/articleLiteral.aspx?action=checkCustomerID").done(function (theCustomerID) {
        var cid = theCustomerID.trim();
        LoadCart2(cid);
    });
}

function LoadCart2(cid) {

    $.getJSON("/services/articleLiteral.aspx?action=readCart&cid=" + cid).done(function (theCart) {

        $("#CartTableBody").empty();
        var cartSum = 0;
        for (var i = 0; i < theCart.length; i++) {

            cartSum += theCart[i].Price;

            var tableRow = "<tr>";
            tableRow += "<td>" + theCart[i].AID1 + "</td>";
            tableRow += "<td>" + theCart[i].ArticleName + "</td>";
            tableRow += "<td>" + theCart[i].Description + "</td>";
            tableRow += "<td>" + theCart[i].Price + "</td>";

            tableRow += "<td><input type='button' value='Radera' onclick='removeItemFromCart(" + theCart[i].ID1 + ");' /></td>";
            tableRow += "</tr>";

            $("#CartTableBody").append(tableRow);
        }
        $("#SumCart").empty();
        $("#SumCartInkTax").empty();
        $("#SumCart").append(cartSum);
        $("#SumCartInkTax").append(cartSum * 1.25);
    });
}

function addItemToCart(aid) {
    $.get("/services/articleLiteral.aspx?action=checkCustomerID").done(function (theCustomerID) {
        var cid = theCustomerID.trim();
        addItemToCart2(aid, cid);
    });
}

function addItemToCart2(aid, cid) {

    $.get("/services/articleLiteral.aspx?action=addToCart&cid=" + cid + "&aid=" + aid).done(function (cartItem) {

        if (cartItem.trim() == "ok")
            alert("Produkt tillagd!")
        else
            alert("Något blev fel")
    });
}

function ConfirmOrder1() {

    $.get("/services/articleLiteral.aspx?action=checkCustomerID").done(function (theCustomerID) {
        var cid = theCustomerID.trim();
        ConfirmOrder2(cid);
    });
}

function ConfirmOrder2(cid) {

    $.get("/services/articleLiteral.aspx?action=newOrder&cid=" + cid).done(function (data) {
        if (data.trim() == "Hurra!!!") {
            alert("Ditt köp har genomförts");
            LoadCart();
        }
        else {
            alert("Fel");
        }

    });

}