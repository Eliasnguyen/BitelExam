<%@ page import="com.example.biteltest2022.repository.ProductRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.biteltest2022.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.biteltest2022.model.User" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý cửa hàng chăm sóc sắc đẹp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/3fe0382cbc.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark d-flex justify-content-end"
         style="background-color: tomato; height: 4rem;">
        <div>
            <a href="/web/table">
                <i class="fa-solid fa-cart-shopping" style="margin-right: 36px"></i>
            </a>

        </div>
    </nav>

    <br class="clr">
</header>
<% User user = (User) session.getAttribute("user");
%>

<div class="container-fluid">
    <div class="row">

    <div class="col-md-4">

                    <a href="#"> <img src="https://th.bing.com/th/id/OIP.fKYI5BvW4miKT4LjVtY68wHaEp?pid=ImgDet&rs=1"
                                      alt=""  width=" 100%"
                                      height= "100%"
                                      object-fit="cover"></a>

    </div>
    <div class="col-md-6">
        <h3>${product.getName()}</h3>
        <hr class="soft"/>

        <form class="form-horizontal qtyFrm">
            <div class="control-group">
                <label class="control-label"><span>$ ${product.getPrice()}</span></label>

            </div>

            <h4>${product.getDetailDes()}</h4>

<%--                <button action ="cart" method = "post"  class="shopBtn"><span class=" icon-shopping-cart"></span> Add to cart</button>--%>


        </form>
    </div>
    </div>

</div>
</body>
</html>