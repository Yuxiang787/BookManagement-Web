package org.xample.demo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class ControllerServlet extends HttpServlet {
    private BookDAO bookDAO;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUser = getServletContext().getInitParameter("jdbcUser");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        bookDAO = new BookDAO(jdbcURL, jdbcUser, jdbcPassword);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new": showNewForm(request, response); break;
                case "/insert": insertBook(request, response); break;
                case "/delete": deleteBook(request, response); break;
                case "/edit": showEditForm(request, response); break;
                case "/update": updateBook(request, response); break;
                default: listBook(request, response); break;
            }

        } catch (SQLException exception) {
            throw new ServletException(exception);
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Book> listBook = bookDAO.selectAll();
        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book newBook = new Book(category, title, author);
        bookDAO.insertBook(newBook);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.getBook(id);
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = new Book(id);
        bookDAO.deleteBook(book);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book book = new Book(id, category, title, author);
        System.out.println(book);

        bookDAO.updateBook(book);
        response.sendRedirect(request.getContextPath() + "/list");
    }



}
