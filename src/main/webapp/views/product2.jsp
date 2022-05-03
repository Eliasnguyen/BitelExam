<%@ page import="com.example.biteltest2022.repository.ProductRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.biteltest2022.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý cửa hàng chăm sóc sắc đẹp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/3fe0382cbc.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark d-flex justify-content-end"
         style="background-color: tomato; height: 4rem;">
        <div>
            <a href="index.jsp">
                <i class="fa-solid fa-cart-shopping" style="margin-right: 36px"></i>
            </a>

        </div>
    </nav>

    <br class="clr">
</header>

<div class="container">


    <div class="container">
        <div class="row">

            <c:forEach items="${list}" var="product">

                <%--       --%>
                <div class="card col-sm-4">
                    <a><img class="card-img-top" src=
                        <c:out value="${product.getImgUrl()}"/> alt="" width="200px" height="100%"></a>
                    <div class="card-body bg-light">
                        <div class="caption cntr">
                            <p class="text-center"><strong><c:out value="${product.getName()}"/></strong></p>
                            <p class="text-center"><strong><c:out value="${product.getPrice()}"/></strong></p>
                            <p><c:out value="${product.getShortDes()}"/></p>
                            <h4 class="text-center"><a class="shopBtn text-decoration-none btn btn-warning" href="#"
                                                       title="add to cart"> Add to cart </a></h4>
                            <br class="clr">
                        </div>
                    </div>

                </div>

            </c:forEach>
        </div>
    </div>


</div>
</body>
</html>