<%-- 
    Document   : addresses
    Created on : 28 mai 2024, 15:18:19
    Author     : abdou.sidibe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact App</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <script src="js/scripts.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <style>
            .container {
                margin-top: 50px;
            }
            .form-container {
                max-width: 600px;
                margin: 0 auto;
            }
            .btn {
                transition: background-color 0.3s, transform 0.3s;
            }
            .btn:hover {
                background-color: #1976d2 !important;
                transform: scale(1.05);
            }
            .input-field input[type=text]:focus, 
            .input-field input[type=email]:focus, 
            .input-field input[type=tel]:focus {
                border-bottom: 2px solid #1976d2;
                box-shadow: none;
            }
            table.highlight > tbody > tr {
                transition: background-color 0.3s;
            }
            table.highlight > tbody > tr:hover {
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="center-align">Contact liste</h3>
            <div class="right-align">
                <a class="btn waves-effect waves-light" href="addresses?action=new">
                    Ajouter un contact
                    <i class="material-icons right">add</i>
                </a>
            </div>
            <table class="highlight responsive-table">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Téléphone</th>
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
                                <a class="btn-small waves-effect waves-light" href="addresses?action=edit&id=${address.id}">
                                    <i class="material-icons">Modifier</i>
                                </a>
                                <a class="btn-small red waves-effect waves-light" href="addresses?action=delete&id=${address.id}" onclick="return confirmDelete()">
                                    <i class="material-icons">Supprimer</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a class="btn-small red waves-effect waves-light" href="addresses?action=home">Retour à l'Accueil</a>
        </div>
    </body>
</html>
