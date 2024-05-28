<%-- 
    Document   : index
    Created on : 28 mai 2024, 09:56:13
    Author     : abdou.sidibe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Book</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <script src="js/scripts.js"></script>
    </head>
    <body>
        <h1>Address Book</h1>
        <a href="addresses?action=new">Add New Address</a>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="address" items="${addresses}">
                    <tr>
                        <td>${address.name}</td>
                        <td>${address.email}</td>
                        <td>${address.phone}</td>
                        <td>
                            <a href="addresses?action=edit&id=${address.id}">Edit</a>
                            <a href="addresses?action=delete&id=${address.id}" onclick="return confirmDelete()">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>