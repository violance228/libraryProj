<%--
  Created by IntelliJ IDEA.
  User: violence
  Date: 23.01.2019
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="../fragments/header.jspf"%>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <%@include file="../fragments/navbar.jspf"%>
</nav>
<form action="/addAuthor" method="post">
    <table class="table">
        <tbody>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>Surname</td>
            <td><input type="text" name="surname"/></td>
        </tr>
        <tr>
            <td>Country</td>
            <td><input type="text" name="country"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Regs"/></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>

