<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="Image/shop_logo.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Shopping Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 1000px;
                margin: 20px auto;
                padding: 20px;
                position: relative;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header h1 {
                margin-left: 150px;
                font-size: 3em;
                color: lightslategrey;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            }
            .cart-button {
                background-color: #04AA6D;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s;
                display: flex;
                align-items: center;
            }
            .cart-button img {
                margin-right: 10px;
            }
            .cart-button:hover {
                background-color: #028a58;
            }
            .product {
                display: flex;
                flex-direction: column;
                background-color: #ffffff;
                margin: 20px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: calc(25% - 40px);
            }
            .product-image {
                width: 100%;
                height: 200px; /* Chiều cao cố định cho ảnh */
                overflow: hidden;
                border-bottom: 1px solid #ddd;
                margin-bottom: 15px;
            }
            .product-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .product input[type="text"], 
            .product input[type="number"], 
            .product input[type="price"] {
                width: 100%;
                margin-bottom: 10px;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .product input[type="submit"] {
                background-color: #04AA6D;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .product input[type="submit"]:hover {
                background-color: #028a58;
            }
            .products-grid {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .footer {
                background-color: #f0f0f0;
                padding: 10px;
                text-align: center;
                font-size: 12px;
                border-top: 1px solid #ddd;
                margin-top: 20px;
            }
            .footer p {
                margin: 5px 0;
            }
            .announcement {
                border: 1px solid #04AA6D;
                background-color: #e7f7ef;
                color: #333;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .announcement span {
                font-weight: bold;
                color: #04AA6D;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>WELCOME TO MY STORE</h1>
                <a href="MainController?action=View Cart" class="cart-button">
                    <img src="Image/cart_icon.png" alt="Cart" width="20" height="20">
                    View your Cart
                </a>
            </div>
            <c:if test="${not empty sessionScope.ADD_MESSAGE}">
                <div class="announcement">
                    <p>You have just picked Product name <span>${requestScope.nameTea}</span> 
                        with Quantity of <span>${requestScope.quantityTea}</span>
                    </p>
                </div>
            </c:if>
            ${sessionScope.LoadDB_ERROR}

            <c:if test="${sessionScope.DRINKS_LIST != null}">
                <c:if test="${not empty sessionScope.DRINKS_LIST}">
                    <div class="products-grid">
                        <c:forEach var="drinksItem" items="${sessionScope.DRINKS_LIST}" varStatus="counter">
                            <div class="product">
                                <form action="MainController" method="POST">
                                    <div class="product-image">
                                        <img src="Image/Product_Image/${drinksItem.name}.png" alt="${drinksItem.name}">
                                    </div>
                                    <input type="text" name="teaID" value="${drinksItem.id}" readonly />
                                    <input type="text" name="teaName" value="${drinksItem.name}" readonly/>
                                    <input type="number" name="quantity" value="0" required=""/>
                                    <input type="price" name="price" value="${drinksItem.price}" readonly />
                                    <input type="submit" name="action" value="Add to Cart">
                                </form>                              
                            </div>                               
                        </c:forEach>                      
                    </div>
                </c:if>
            </c:if>

            <!-- Hidden input to store success flag -->
            <input type="hidden" id="successFlag" value="${requestScope.successFlag}" />

        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var successFlag = document.getElementById("successFlag").value;
                if (successFlag === "true") {
                    alert("Add to Cart successfully");
                }
            });
        </script>
    </body>
</html>
