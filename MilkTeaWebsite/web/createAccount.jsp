<%-- 
    Document   : createAccount.jsp
    Created on : Jul 3, 2024, 10:03:34 PM
    Author     : BaoDinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Your New Account Page</title>
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

            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }

            h4 {
                margin-top: 0;
                color: #04AA6D;
            }

            input[type=text], input[type=password], input[type=email] {
                width: calc(100% - 24px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            input[type=submit], input[type=reset] {
                background-color: #04AA6D;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: calc(50% - 10px);
                margin: 5px;
            }

            input[type=submit]:hover, input[type=reset]:hover {
                opacity: 0.8;
            }

            a {
                color: #04AA6D;
                text-decoration: none;
                display: inline-block;
                margin-top: 15px;
            }

            a:hover {
                text-decoration: underline;
            }

            .required-label {
                color: red;
                margin-left: 5px;
            }

            .required-field {
                border: 1px solid red;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h4>Create New User</h4>
            <form action="MainController" method="POST">
                <input type="text" name="newUserID" placeholder="User ID" required>
                <div class="error">${requestScope.CREATE_ERROR.userIDError}</div>

                <input type="text" name="newFullName" placeholder="Full Name" required>
                <div class="error">${requestScope.CREATE_ERROR.fullNameError}</div>

                <input type="text" name="roleID" value="US" readonly>

                <input type="password" name="newPassword" placeholder="Password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                <div class="error">${requestScope.CREATE_ERROR.confirmError}</div>
                
                <input type="email" name="emailAddress" placeholder="Email Address *" class="required-field" required /><br>
                <div>${sessionScope.SendEmailResult}</div>
                
                <div class="">${requestScope.CREATE_ERROR.error} ${requestScope.CREATE_SUCCESS}</div>

                <input type="submit" name="action" value="Create Account">
                <input type="reset" value="RESET">
            </form>
            <a href="login.jsp">Return to login</a>
        </div>
    </body>
</html>
