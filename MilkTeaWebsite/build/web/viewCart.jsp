<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Image/shop_logo.png" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .container h3 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            padding: 10px;
            background-color: darkseagreen;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h3 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #04AA6D;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e2e2e2;
        }
        .total {
            text-align: right;
            font-size: 1.5em;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #04AA6D;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #028a58;
        }
        .btn a {
            color: white;
            text-decoration: none;
        }
        .empty-cart {
            text-align: center;
            color: red;
        }
        .empty-cart a {
            color: #04AA6D;
            text-decoration: none;
            font-weight: bold;
        }
        .empty-cart a:hover {
            text-decoration: underline;
        }
        .actions {
            text-align: right;
            margin-top: 10px;
        }
        .actions .btn:first-child {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>Your selected products here:</h3>
    <c:choose>
        <c:when test="${not empty sessionScope.CART}">
            <table>
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Drinks ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>EDIT</th>
                    <th>REMOVE</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" />
                <c:set var="cartTotal" value="0" />
                <c:set var="quantityTotal" value="0" />
                <c:forEach var="tea" items="${sessionScope.CART.cart.values()}" varStatus="counter">
                    <c:set var="itemTotal" value="${tea.price * tea.quantity}" />
                    <c:set var="cartTotal" value="${cartTotal + itemTotal}" />
                    <c:set var="quantityTotal" value="${quantityTotal + tea.quantity}" />
                    <tr>
                        <form action="MainController" method="POST">
                            <td>${counter.count}</td>
                            <td><input type="text" name="id" value="${tea.id}" readonly=""/></td>
                            <td>${tea.name}</td>
                            <td><input type="number" name="quantity" value="${tea.quantity}" required=""/></td>
                            <td>${tea.price} $</td>
                            <td><input type="submit" name="action" value="Edit" class="btn"/></td>
                            <td><input type="submit" name="action" value="Remove" class="btn"/></td>
                            <td>${itemTotal}$</td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="total">
                <h4>TOTAL(${quantityTotal} products) : ${cartTotal} $</h4>
            </div>
        </c:when>
        <c:otherwise>
            <h4 class="empty-cart">EMPTY CART... PLEASE
                <a href="shopping.jsp">ADDING MORE</a>
                TO ADD SOMETHING TO THIS CART.
            </h4>
        </c:otherwise>
    </c:choose>
    <div class="actions">
        <a href="shopping.jsp" class="btn">ADDING MORE</a>
        
    </div>
    <a href="checkOut.jsp" class="btn">CHECK OUT</a>
</div>
</body>
</html>
