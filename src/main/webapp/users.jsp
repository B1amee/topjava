<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html lang="ru">
    <head>
        <title>Users</title>
    </head>
    <body>
        <h3><a href="index.html">Home</a></h3>
        <hr>
        <h2>Users</h2>
        <a href="users?action=create">Add User</a>
        <br><br>
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
            <tr>
                <th>Name</th>
                <th>Mail</th>
                <th>Roles</th>
                <th>Enabled</th>
                <th>Register</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${users}" var="user">
                <jsp:useBean id="user" type="ru.javawebinar.topjava.model.User"/>
                <tr>
                    <td>
                            <%--${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}--%>
                            <%--<%=TimeUtil.toString(meal.getDateTime())%>--%>
                            <%--${fn:replace(meal.dateTime, 'T', ' ')}--%>
                            ${fn:formatDateTime(user.name)}
                    </td>
                    <td>${user.email}</td>
                    <td>${user.roles}</td>
                    <td>${user.enabled}</td>
                    <td>${user.registered}</td>
                    <td><a href="users?action=update&id=${user.id}">Update</a></td>
                    <td><a href="users?action=delete&id=${user.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>