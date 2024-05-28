package com.myaddressbook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author abdou.sidibe
 */
@WebServlet("/addresses")
public class AddressServlet extends HttpServlet {
private List<Address> addressBook = new ArrayList<>();
    private int idCounter = 1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        
        switch (action) {
            case "new":
                showForm(request, response, null);
                break;
            case "edit":
                showForm(request, response, getAddressById(Integer.parseInt(request.getParameter("id"))));
                break;
            case "delete":
                deleteAddress(request, response);
                break;
            default:
                listAddresses(request, response);
                break;
        }
    }

    private void listAddresses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("addresses", addressBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response, Address address) throws ServletException, IOException {
        request.setAttribute("address", address);
        RequestDispatcher dispatcher = request.getRequestDispatcher("form.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Iterator<Address> iterator = addressBook.iterator();
        while (iterator.hasNext()) {
            Address address = iterator.next();
            if (address.getId() == id) {
                iterator.remove();
                break;
            }
        }
        response.sendRedirect("addresses");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (id == 0) {
            addressBook.add(new Address(idCounter++, name, email, phone));
        } else {
            Address address = getAddressById(id);
            if (address != null) {
                address.setName(name);
                address.setEmail(email);
                address.setPhone(phone);
            }
        }

        response.sendRedirect("addresses");
    }

    private Address getAddressById(int id) {
        for (Address address : addressBook) {
            if (address.getId() == id) {
                return address;
            }
        }
        return null;
    }
}
