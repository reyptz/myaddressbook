package com.myaddressbook;  // Déclare que cette classe fait partie du package com.myaddressbook.

import javax.servlet.*;  // Importe les classes nécessaires pour travailler avec les servlets.
import javax.servlet.http.*;  // Importe les classes nécessaires pour travailler avec les requêtes et réponses HTTP.
import javax.servlet.annotation.WebServlet;  // Importe l'annotation @WebServlet pour la configuration du servlet.
import java.io.IOException;  // Importe la classe IOException pour la gestion des exceptions d'entrée/sortie.
import java.util.ArrayList;  // Importe la classe ArrayList pour utiliser une liste dynamique.
import java.util.Iterator;  // Importe la classe Iterator pour parcourir les éléments d'une collection.
import java.util.List;  // Importe la classe List pour déclarer une interface de liste.

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author abdou.sidibe
 */
@WebServlet("/addresses")  // Annotation pour déclarer le servlet et mapper les requêtes vers /addresses
public class AddressServlet extends HttpServlet {  // Déclare la classe qui étend HttpServlet
    private List<Address> addressBook = new ArrayList<>();  // Initialise une liste pour stocker les adresses
    private int idCounter = 1;  // Initialise un compteur pour générer des identifiants uniques

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  // Méthode pour traiter les requêtes GET
        String action = request.getParameter("action");  // Récupère le paramètre 'action' de la requête
        if (action == null) action = "home";  // Si aucun paramètre 'action' n'est fourni, utilise 'home' par défaut
        
        switch (action) {  // Switch pour déterminer quelle action exécuter
            case "new":  // Si l'action est 'new'
                showForm(request, response, null);  // Affiche le formulaire pour créer une nouvelle adresse
                break;
            case "edit":  // Si l'action est 'edit'
                showForm(request, response, getAddressById(Integer.parseInt(request.getParameter("id"))));  // Affiche le formulaire pour éditer une adresse existante
                break;
            case "delete":  // Si l'action est 'delete'
                deleteAddress(request, response);  // Supprime une adresse
                break;
            case "list":  // Si l'action est 'list'
                listAddresses(request, response);  // Affiche la liste des adresses
                break;
            case "home":  // Si l'action est 'home' (ou par défaut)
            default:
                showHome(request, response);  // Affiche la page d'accueil
                break;
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  // Méthode pour afficher la page d'accueil
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");  // Crée un dispatcher pour rediriger vers index.jsp
        dispatcher.forward(request, response);  // Redirige vers index.jsp avec les données de la requête
    }

    private void listAddresses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  // Méthode pour afficher la liste des adresses
        request.setAttribute("addresses", addressBook);  // Ajoute la liste des adresses à la requête
        RequestDispatcher dispatcher = request.getRequestDispatcher("addresses.jsp");  // Crée un dispatcher pour rediriger vers addresses.jsp
        dispatcher.forward(request, response);  // Redirige vers addresses.jsp avec les données de la requête
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response, Address address) throws ServletException, IOException {  // Méthode pour afficher le formulaire
        request.setAttribute("address", address);  // Ajoute une adresse (ou null) à la requête
        RequestDispatcher dispatcher = request.getRequestDispatcher("form.jsp");  // Crée un dispatcher pour rediriger vers form.jsp
        dispatcher.forward(request, response);  // Redirige vers form.jsp avec les données de la requête
    }

    private void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {  // Méthode pour supprimer une adresse
        int id = Integer.parseInt(request.getParameter("id"));  // Récupère l'identifiant de l'adresse à supprimer
        Iterator<Address> iterator = addressBook.iterator();  // Crée un itérateur pour parcourir la liste des adresses
        while (iterator.hasNext()) {  // Parcourt les adresses de la liste
            Address address = iterator.next();  // Récupère l'adresse courante
            if (address.getId() == id) {  // Si l'identifiant de l'adresse correspond à celui à supprimer
                iterator.remove();  // Supprime l'adresse de la liste
                break;  // Sort de la boucle
            }
        }
        response.sendRedirect("addresses?action=list");  // Redirige vers la liste des adresses
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  // Méthode pour traiter les requêtes POST
        int id = Integer.parseInt(request.getParameter("id"));  // Récupère l'identifiant de l'adresse à partir du formulaire
        String name = request.getParameter("name");  // Récupère le nom à partir du formulaire
        String email = request.getParameter("email");  // Récupère l'email à partir du formulaire
        String phone = request.getParameter("phone");  // Récupère le numéro de téléphone à partir du formulaire

        if (id == 0) {  // Si l'identifiant est 0, cela signifie que c'est une nouvelle adresse
            addressBook.add(new Address(idCounter++, name, email, phone));  // Ajoute une nouvelle adresse à la liste avec un identifiant unique
        } else {  // Sinon, c'est une mise à jour d'une adresse existante
            Address address = getAddressById(id);  // Récupère l'adresse par son identifiant
            if (address != null) {  // Si l'adresse existe
                address.setName(name);  // Met à jour le nom de l'adresse
                address.setEmail(email);  // Met à jour l'email de l'adresse
                address.setPhone(phone);  // Met à jour le numéro de téléphone de l'adresse
            }
        }

        response.sendRedirect("addresses?action=list");  // Redirige vers la liste des adresses
    }

    private Address getAddressById(int id) {  // Méthode pour récupérer une adresse par son identifiant
        for (Address address : addressBook) {  // Parcourt la liste des adresses
            if (address.getId() == id) {  // Si l'identifiant de l'adresse correspond
                return address;  // Retourne l'adresse trouvée
            }
        }
        return null;  // Retourne null si aucune adresse ne correspond
    }
}