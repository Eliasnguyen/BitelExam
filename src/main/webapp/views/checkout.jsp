<%@ page import="com.example.biteltest2022.model.User" %>
<%@ page import="com.example.biteltest2022.model.Item" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
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
        <div>
            <a>
                <i class="fa-solid fa-cart-shopping" style="margin-right: 36px"></i>
            </a>

        </div>
    </nav>

    <br class="clr">
</header>
<% User user = (User) session.getAttribute("user");
    Map<Integer, Item> itemCart = (Map<Integer, Item>) session.getAttribute("cart");
%>

<div class="container">
    <table class="table table-bordered table-condensed">
        <thead>
        <tr>
            <th>Product</th>
            <th>Name</th>
            <th>Short Des</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <%--        <c:forEach var="country" items="${itemCart}">--%>
        <%--            Country: ${country.key}  - Capital: ${country.value}--%>
        <%--            --%>
        <%--            --%>
        <%--            --%>

        <%
            float total = 0;
            Set<Integer> keys = itemCart.keySet();
            for (Integer id : keys) {
                Item item = itemCart.get(id);
                total = total + item.getQuantity() * item.getProduct().getPrice();

        %>
        <tr>
            <td><img src="<%=item.getProduct().getImgUrl()%>"
                     alt="" width="80px" height="56px"></td>
            <%--            <%System.out.println(item.getProduct().getImgUrl());%>--%>
            <td><%=item.getProduct().getName()%>
            </td>
            <td><%=item.getProduct().getShortDes()%>
            </td>
            <td>$<%=item.getProduct().getPrice()%>
            </td>
            <td><%=item.getQuantity()%>
            </td>

            <td>$<%=item.getQuantity() * item.getProduct().getPrice()%></td>
        <%}%>

        <tr>
            <td colspan="6" class="alignR">Total products:</td>
            <td class="label label-primary"> <%=total%></td>
        </tr>
        </tbody>
    </table>
    <br/>
    <form action="insert" method="POST">
        <input type="submit" value="Order" style="float: right;margin-right: 50px">
    </form>

</div>
</body>
</html>
