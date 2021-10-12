<%--
  Created by IntelliJ IDEA.
  User: veres
  Date: 12.10.2021
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, tr, td {
            border: 2px solid black;
            padding: 3px;
        }
    </style>
</head>
<body>
    <h3> <a href="index.html">Home</a> </h3>
    <hr>
    <H2>Meals</H2>
    <table>
        <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Calories</th>
        </tr>
    <c:forEach var="mealTo" items="${mealsToList}">
        <c:if test="${mealTo.excess eq true}">
            <tr style="color: red">
                <td>${mealTo.date} ${mealTo.time}</td>
                <td>${mealTo.description}</td>
                <td>${mealTo.calories}</td>
            </tr>
        </c:if>
        <c:if test="${mealTo.excess eq false}">
        <tr>
            <td>${mealTo.date} ${mealTo.time}</td>
            <td>${mealTo.description}</td>
            <td>${mealTo.calories}</td>
        </tr>
        </c:if>
    </c:forEach>
</body>
</html>
