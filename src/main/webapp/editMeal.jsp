<!--
  Created by IntelliJ IDEA.
  User: veres
  Date: 13.10.2021
  Time: 19:35
  To change this template use File | Settings | File Templates.
-->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ru">
<head>
    <title>Add or edit meal</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Edit meal</h2>

<form method="POST" action='meals' name="frmAddUser">

  <input type="text" readonly="readonly" name="mealId" value="<c:out value="${meal.id}" />" hidden /> <br />

  DateTime : <input type="datetime-local" name="dateTime" value="${meal.dateTime}" /> <br />

  Description : <input type="text" name="description" value=<c:out value="${meal.description}" /> /> <br />

  Calories : <input type="text" name="calories" value=<c:out value="${meal.calories}" /> /> <br />

  <input type="submit" value="Save" /> <input class="button" type="button" onclick="window.location.replace('/topjava/meals')" value="Cancel" />
</form>
</body>
</html>
