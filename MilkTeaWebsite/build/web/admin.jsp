<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="Image/admin.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN PAGE</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                flex-direction: column;
            }
            h2 {
                color: #333;
            }
            form {
                display: inline-block;
                margin: 20px 0;
            }
            input[type="text"], input[type="password"] {
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: calc(100% - 22px);
            }
            input[type="submit"], .logout-button {
                background-color: #04AA6D;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover, .logout-button:hover {
                background-color: #028a58;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .container {
                width: 80%;
                max-width: 1000px;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .error {
                color: #D8000C;
                background-color: #FFBABA;
                padding: 10px 20px;
                margin: 10px 0;
                border: 1px solid #D8000C;
                border-radius: 5px;
                display: flex;
                align-items: center;
            }
            .error-icon {
                font-size: 20px;
                margin-right: 10px;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            
            <div class="header">
                <h2>WELCOME: ${sessionScope.LOGIN_USER.fullName}</h2>
                <form action="MainController" method="POST">
                    <c:url var="logoutLink" value="MainController">
                        <c:param name="action" value="Logout"></c:param>
                    </c:url>
                    <button type="submit" class="logout-button">Log out</button>
                </form>
            </div>
            <form action="MainController" method="POST">
                <input name="searchInfo" placeholder="Searching account here..." value="${param.searchInfo}" />
                <input type="submit" name="action" value="Search">
            </form>
            <c:if test="${requestScope.LIST_USER != null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <table>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                                <th>Password</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" varStatus="counterVar" items="${requestScope.LIST_USER}">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${counterVar.count}</td>
                                        <td>${user.userID}</td>
                                        <td><input type="text" name="Edit_fullName" value="${user.fullName}" required=""/></td>
                                        <td><input type="text" name="Edit_roleID" value="${user.roleID}" required=""/></td>
                                        <td>${user.password}</td>
                                        <td>
                                            <input type="submit" name="action" value="Update"/>
                                            <input type="hidden" name="UpdaterID" value="${user.userID}" />
                                            <input type="hidden" name="searchInfo" value="${param.searchInfo}"/>
                                        </td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"/>
                                                <c:param name="searchInfo" value="${param.searchInfo}"/>
                                                <c:param name="Deleter_ID" value="${user.userID}"/>
                                            </c:url>
                                            <a href="${deleteLink}" class="link">Delete here</a>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            <c:if test="${not empty requestScope.SEARCH_ERROR or not empty requestScope.UPDATE_ERROR or not empty requestScope.DELETE_ERROR}">
                <div class="error">
                    <span class="error-icon">&#9888;</span>
                    <span>
                        ${requestScope.SEARCH_ERROR}
                        ${requestScope.UPDATE_ERROR}
                        ${requestScope.DELETE_ERROR}
                    </span>
                </div>
            </c:if>
        </div>
    </body>
</html>
