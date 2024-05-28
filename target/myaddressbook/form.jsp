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
        <title>Contact App</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
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
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="center-align">${address == null ? "Ajouter un contact" : "Modifier un contact"}</h3>
            <div class="form-container">
                <form action="addresses" method="post">
                    <input type="hidden" name="id" value="${address != null ? address.id : 0}">
                    <div class="input-field">
                        <input type="text" id="name" name="name" value="${address != null ? address.name : ''}" required>
                        <label for="name">Nom</label>
                    </div>
                    <div class="input-field">
                        <input type="email" id="email" name="email" value="${address != null ? address.email : ''}" required>
                        <label for="email">Email</label>
                    </div>
                    <div class="input-field">
                        <input type="tel" id="phone" name="phone" value="${address != null ? address.phone : ''}" required>
                        <label for="phone">Téléphone</label>
                    </div>
                    <div class="right-align">
                        <button class="btn waves-effect waves-light" type="submit">Soumettre
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>