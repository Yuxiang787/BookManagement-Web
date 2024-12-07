<%--
  Created by IntelliJ IDEA.
  User: slumber
  Date: 12/6/24
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Book Store Application</title>
    <style>
        /* Table Styling */
        table {
            margin: auto;
            border: 2px solid #333; /* Darker border for the table */
            border-collapse: collapse; /* Prevents double borders */
            width: 60%; /* Slightly larger width for better spacing */
            background-color: #f9f9f9; /* Light background for the table */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adds a subtle shadow */
        }
       td {
            border: 1px solid #ccc; /* Light gray borders between cells */
            text-align: center; /* Center align text */
            padding: 12px; /* More padding for better spacing */
            font-family: Arial, sans-serif; /* Clean font */
            font-size: 16px; /* Slightly larger text */
            background-color: #fff; /* White background for cells */
        }
        th {
            background-color: #555; /* Dark background for header */
            color: white; /* White text for header */
            text-transform: uppercase; /* Uppercase header text */
            letter-spacing: 1px; /* Adds spacing between letters */
            font-family: Arial, sans-serif; /* Clean font */
            font-size: 16px; /* Slightly larger text */
            padding: 15px; /* More padding for better spacing */
        }

        h1 {
            font-size: 2.5em; /* Larger font size for main heading */
            font-weight: bold;
            text-align: center;
            color: #444; /* Slightly darker shade for emphasis */
            margin-bottom: 20px;
        }

        h2 {
            font-size: 2em; /* Slightly smaller than h1 */
            font-weight: normal;
            text-align: center;
            color: #555; /* Subtle contrast */
            margin-bottom: 15px;
        }
        a {
            text-decoration: none; /* Remove underline for links */
            color: black; /* Use black for a clean, professional look */
            font-family: Arial, sans-serif; /* Clean and matching font */
            font-size: 18px; /* Larger font size for visibility */
            transition: color 0.3s ease; /* Smooth transition for hover effect */
        }
        a:hover {
            text-decoration: underline; /* Underline on hover */
            color: #007BFF; /* Subtle blue hover effect for contrast */
        }

            h2 a {
                text-decoration: none; /* Remove underline */
                color: inherit; /* Use the color of the parent h2 */
                font-size: inherit; /* Use the font size of the parent h2 */
                font-weight: inherit; /* Use the font weight of the parent h2 */
            }
    </style>

</head>

<body>
<div style="text-align: center">
    <h1>Book Management</h1>
        <h2>
            <a href="${pageContext.request.contextPath}/new">Add New Book</a>
            &nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/list">List All Books</a>
        </h2>
</div>

<div>
    <table>
        <caption><h2>List of Books</h2></caption>
        <tr>
            <th>ID</th>
            <th>Category</th>
            <th>Title</th>
            <th>Author</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="book" items="${listBook}" >
            <tr>
                <td><c:out value="${book.id}" /></td>
                <td><c:out value="${book.category}" /></td>
                <td><c:out value="${book.title}" /></td>
                <td><c:out value="${book.author}" /></td>
                <td>
                    <a href="${pageContext.request.contextPath}/edit?id=<c:out value='${book.id}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/delete?id=<c:out value='${book.id}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
