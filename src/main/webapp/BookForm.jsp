<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book Management Application</title>
    <style>
        /* Table Styling */
        table {
            margin: auto;
            border: 2px solid #333; /* Consistent darker border */
            border-collapse: collapse; /* Prevents double borders */
            width: 60%; /* Uniform width */
            background-color: #f9f9f9; /* Light background for tables */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
        td {
            border: 1px solid #ccc; /* Light gray borders between cells */
            text-align: center; /* Centered content for readability */
            padding: 12px; /* Consistent padding for spacing */
            font-family: Arial, sans-serif; /* Clean and uniform font */
            font-size: 16px; /* Easy-to-read font size */
            background-color: #fff; /* White background for table cells */
        }
        th {
            background-color: #555; /* Dark background for header */
            color: white; /* White text for header */
            text-transform: uppercase; /* Uppercase header text */
            letter-spacing: 1px; /* Adds spacing between letters */
            font-family: Arial, sans-serif; /* Clean font */
            font-size: 16px; /* Slightly larger text */
            padding: 5px; /* More padding for better spacing */
        }

        /* Input Field Styling */
        input[type="text"] {
            width: 95%; /* Make the input field span most of the table cell */
            padding: 10px; /* Add padding for better spacing */
            font-size: 18px; /* Larger font size for readability */
            font-family: Arial, sans-serif; /* Match font with the table */
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            background-color: #fff; /* White background */
            transition: border-color 0.3s ease, box-shadow 0.3s ease; /* Smooth hover/focus transition */
        }
        input[type="text"]:focus {
            border-color: #007BFF; /* Blue border on focus */
            box-shadow: 0 2px 8px rgba(0, 123, 255, 0.3); /* Enhance shadow on focus */
            outline: none; /* Remove the default outline */
        }

        /* Button Styling */
        input[type="submit"] {
            background-color: #555; /* Blue background */
            color: white; /* White text */
            font-size: 18px; /* Larger font size */
            font-family: Arial, sans-serif; /* Consistent font */
            padding: 10px 20px; /* Add padding for spacing */
            border: none; /* Remove default border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor for interactivity */
            transition: background-color 0.3s ease; /* Smooth hover effect */
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Heading Styling */
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

        h2 a {
            text-decoration: none; /* Remove underline */
            color: inherit; /* Use the color of the parent h2 */
            font-size: inherit; /* Use the font size of the parent h2 */
            font-weight: inherit; /* Use the font weight of the parent h2 */
        }

        /* Link Styling */
        a {
            text-decoration: none; /* No underline for links */
            color: black; /* Subtle blue for links */
            font-family: Arial, sans-serif; /* Matching font */
            font-size: 18px; /* Slightly larger font size */
            transition: color 0.3s ease; /* Smooth hover transition */
        }
        a:hover {
            text-decoration: underline; /* Underline on hover for clarity */
            color: #007BFF; /* Darker blue on hover */
        }
    </style>
</head>
<body>
<h1>Book Management</h1>
<h2>
    <a href="${pageContext.request.contextPath}/new">Add New Book</a>
    &nbsp;&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/list">List All Books</a>
</h2>
<div>
    <form action="${pageContext.request.contextPath}/${book != null ? 'update' : 'insert'}" method="post">
        <table>
            <caption>
                <h2>
                    ${book != null ? 'Edit Book' : 'Add New Book'}
                </h2>
            </caption>
            <c:if test="${book != null}">
                <input type="hidden" name="id" value="<c:out value='${book.id}'/>"/>
            </c:if>
            <tr>
                <th>Category:</th>
                <td>
                    <input type="text" name="category" value="<c:out value='${book.category}'/>"/>
                </td>
            </tr>
            <tr>
                <th>Title:</th>
                <td>
                    <input type="text" name="title" value="<c:out value='${book.title}' />"/>
                </td>
            </tr>
            <tr>
                <th>Author:</th>
                <td>
                    <input type="text" name="author" value="<c:out value='${book.author}'/>"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"> <!-- Center the Save button -->
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
