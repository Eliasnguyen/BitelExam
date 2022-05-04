<%@ page import="com.example.biteltest2022.model.User" %>
<%@ page import="com.example.biteltest2022.model.Item" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.example.biteltest2022.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product And Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/3fe0382cbc.js" crossorigin="anonymous"></script>
    <style>
        /*            div{
                        width: 20%;
                        text-align: right;
                    }*/
        html, body {
            height: 100%;
            margin: 0px;
        }
    </style>
</head>
<body style="background-color: azure; height: 200px">
<header>
    <nav class="navbar navbar-expand-md navbar-dark d-flex justify-content-end"
         style="background-color: tomato; height: 4rem;">

    </nav>

    <br class="clr">
</header>

<%
   List<Cart> carts = (List<Cart>) session.getAttribute("cartUser");
%>
<div class="container">
    <table class="table table-bordered table-condensed">
        <thead>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%--        <c:forEach var="country" items="${itemCart}">--%>
        <%--            Country: ${country.key}  - Capital: ${country.value}--%>
        <%--            --%>
        <%--            --%>
        <%--            --%>

        <%

            for (Cart cart :carts) {
                List<Item> items = cart.getItems();
                for(Item item:items){


        %>
        <tr>
            <td><%=item.getProduct().getName()%></td>
            <%--            <%System.out.println(item.getProduct().getImgUrl());%>--%>
            <td>$<%=item.getProduct().getPrice()%>
            </td>
            <td><%=item.getQuantity()%>
            </td>



                <%}}%>

        </tbody>
    </table>
    <br/>

</div>
</body>
</html>
