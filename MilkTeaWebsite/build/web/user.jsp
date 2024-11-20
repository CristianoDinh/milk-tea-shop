<%-- 
    Document   : user
    Created on : May 29, 2024, 9:58:24 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/user.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER PAGE</title>
        
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .user-info {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }

            .user-info h1 {
                margin-top: 0;
                color: #333;
            }

            .user-info p {
                color: #666;
                margin: 10px 0;
            }

            .user-info p span {
                font-weight: bold;
                color: #333;
            }

            .user-info .logout-btn {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #04AA6D;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .user-info .logout-btn:hover {
                background-color: #039f5b;
            }
        </style>
    </head>
    <body>
        
         

        
        <div class="user-info" >
            <p><span>User ID:</span> ${sessionScope.LOGIN_USER.userID}</p>
            <p><span>Full Name:</span> ${sessionScope.LOGIN_USER.fullName}</p>
            <p><span>Role ID:</span> ${sessionScope.LOGIN_USER.roleID}</p>
            <p><span>Your Password:</span> ${sessionScope.LOGIN_USER.password}</p>
            
            <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url> <a href="${logoutLink}" class="logout-btn">Log out your Account here</a>
        </div>
    </body>
</html>
