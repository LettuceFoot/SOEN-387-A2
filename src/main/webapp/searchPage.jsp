<%@ page import="packages.businessLayer.MessageBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>
</head>
<body>
<%
    String message = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("message")) message = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    }
%>

<div class="topnav">
    <a  href="loggedIn.jsp">Home</a>
    <a href="#news">News</a>
    <a href="#contact">Contact</a>
    <a href="#about">About</a>
    <a class="active" href="#Search">Search</a>
    <form action="LogoutServlet" method="post">
        <a href=""><input type="submit" value="Logout" ></a></form>
    <input type="text" placeholder="Search..">
</div>

<%--<br><br>--%>
<%--<form action="LogoutServlet" method="post">--%>
<%--    <input type="submit" value="Logout" >--%>
<%--</form>--%>

<hr>
<section>

    <h1>Chat area</h1>
    <%! MessageBoard msgboard = new MessageBoard(); %>
    <%! int i = 10; String reverse = "";%>



    <form action="MessageBoardServlet" method="post" enctype="multipart/form-data">

        <div>
            <label for="searchUser">Search for Post by User:</label>
            <input type="text" placeholder="Search.." name="searchUsername">
        </div>
        <div>
            <br>
            <span for="updatePost">Search for Post by Date Range:</span>
            <label for="searchByDate">From:</label>
            <input placeholder="d-m-y hh:mm:ss" name="fromDate" >
            <label for="searchByDate">To:</label>
            <input placeholder="d-m-y hh:mm:ss" name="toDate" >
        </div>
        <div>
            <br>
            <label for="searchByTags">Search for Post by Tag:</label>
            <input type="text" placeholder="Search.." name="searchByTags">
            <br>
        </div>
        <div>
            <br>
            <br>
            <input type="radio" id="searchUser" name="searchOption" value="searchUser">
            <label for="searchUser">Search by User</label>
            <input type="radio" id="searchByDate" name="searchOption" value="searchByDate">
            <label for="searchByDate">Search by Date Range</label>
            <input type="radio" id="searchByTags" name="searchOption" value="searchByTags">
            <label for="searchByTags">Search by Tags</label>
            <input type="radio" id="searchAll" name="searchOption" value="searchAll">
            <label for="searchAll">Search for all at the same time</label>
            <div>
                <br>
                <br>
                <button type="button" id="Search">Search</button>
                <button type="button" id="Reset">Reset</button>
            </div>
        </div>

<%--        <%= msgboard.displaySearched("U1",i, reverse)%>--%>

<%--        <%= msgboard.displaySearchByDates("2020-11-09 00:00:00",i, reverse)%>--%>

        <%= msgboard.displaySearchByTags("re",i, reverse)%>


    </form>


    <p>Logged in</p>

    <p>Session ID = <%=sessionID %></p>



</section>

</body>
</html>