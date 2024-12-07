package org.xample.demo;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private String jdbcURL;
    private String username;
    private String password;
    private Connection connection;

    public BookDAO(String jdbcURL, String username, String password) {
        this.jdbcURL = jdbcURL;
        this.username = username;
        this.password = password;
    }

    public void connect() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Explicitly load the driver
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }

            connection = DriverManager.getConnection(jdbcURL, username, password);
        }
    }

    public void close() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    public boolean insertBook(Book book) throws SQLException {
        String sql = "INSERT INTO Book(Category, Title, Author) VALUES (?, ?, ?)";
        connect();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, book.getCategory());
        preparedStatement.setString(2, book.getTitle());
        preparedStatement.setString(3, book.getAuthor());

        boolean rowInserted = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
        connection.close();
        return rowInserted;
    }

    public List<Book> selectAll() throws SQLException {
        String sql = "SELECT * FROM Book";
        connect();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Book> books = new ArrayList<>();
        while (resultSet.next()) {
            String category = resultSet.getString("Category");
            String title = resultSet.getString("Title");
            String author = resultSet.getString("Author");
            int id = resultSet.getInt("BookID");
            books.add(new Book(id, category, title, author));
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return books;
    }

    public boolean deleteBook(Book book) throws SQLException {
        String sql = "DELETE FROM Book WHERE BookID = ?";
        connect();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, book.getId());
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return rowDeleted;
    }

    public boolean updateBook(Book book) throws SQLException {
        String sql = "UPDATE Book SET Category = ?, Title = ?, Author = ? WHERE BookID = ?";
        connect();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, book.getCategory());
        statement.setString(2, book.getTitle());
        statement.setString(3, book.getAuthor());
        statement.setInt(4, book.getId());
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return rowUpdated;
    }

    public Book getBook (int id) throws SQLException {
        String sql = "SELECT * FROM Book WHERE BookID = ?";
        connect();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        Book book = null;
        if (resultSet.next()) {
            String category = resultSet.getString("Category");
            String title = resultSet.getString("Title");
            String author = resultSet.getString("Author");
            book = new  Book(id, category, title, author);
        }
        resultSet.close();
        statement.close();
        connection.close();
        return book;
    }


    public static void main(String[] args)  {
        String dbURL = "jdbc:mysql://localhost:3306/bookstore";
        String user = "root";
        String password = "Zxc6806789";
        BookDAO test = new BookDAO(dbURL, user, password);
        Book testBook = new Book(5, "HAHAH", "AHHAH", "dhha");


        try  {
            test.updateBook(testBook);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
