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
        <title>Contact App - Accueil</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <script src="js/scripts.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
            .container {
                margin-top: 50px;
                text-align: center;
                animation: fadeIn 2s ease-in-out;
            }
            h3 {
                margin-bottom: 20px;
                animation: slideInDown 1s ease-in-out;
            }
            p {
                margin-bottom: 20px;
                animation: fadeInUp 1.5s ease-in-out;
            }
            .btn {
                transition: background-color 0.3s, transform 0.3s;
                animation: bounceIn 2s ease-in-out;
            }
            .btn:hover {
                background-color: #1976d2 !important;
                transform: scale(1.05);
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @keyframes slideInDown {
                from {
                    transform: translateY(-100%);
                }
                to {
                    transform: translateY(0);
                }
            }
            @keyframes fadeInUp {
                from {
                    transform: translateY(100%);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }
            @keyframes bounceIn {
                0%, 20%, 40%, 60%, 80%, 100% {
                    transition-timing-function: ease-in-out;
                }
                0% {
                    opacity: 0;
                    transform: scale3d(.3, .3, .3);
                }
                20% {
                    transform: scale3d(1.1, 1.1, 1.1);
                }
                40% {
                    transform: scale3d(.9, .9, .9);
                }
                60% {
                    opacity: 1;
                    transform: scale3d(1.03, 1.03, 1.03);
                }
                80% {
                    transform: scale3d(.97, .97, .97);
                }
                100% {
                    opacity: 1;
                    transform: scale3d(1, 1, 1);
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="center-align">Bienvenue dans le contact app</h3>
            <p class="center-align">Bienvenue sur la page d'accueil de notre application de gestion de la liste de contacts des apprenants.</p>
            <p class="center-align">Vous pouvez ajouter, modifier ou supprimer des contacts en utilisant les options du menu.</p>
            <div class="center-align"> 
                <a href="addresses?action=list" class="btn waves-effect waves-light blue">Voir les Contacts</a>
            </div>          
        </div>
    </body>
</html>