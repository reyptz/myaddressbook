<%-- 
    Document   : form
    Created on : 28 mai 2024, 09:54:07
    Author     : abdou.sidibe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Form</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <h1>${address == null ? "Add New Address" : "Edit Address"}</h1>
        <form action="addresses" method="post">
            <input type="hidden" name="id" value="${address != null ? address.id : 0}">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${address != null ? address.name : ''}" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${address != null ? address.email : ''}" required>
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="${address != null ? address.phone : ''}" required>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>