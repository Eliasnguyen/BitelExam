<%@ page import="com.example.biteltest2022.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.biteltest2022.repository.ProductRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/30/2022
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý cửa hàng chăm sóc sắc đẹp</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
    </nav>
</header>
<br>

<br>

<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <h2> Đăng nhập </h2>


            <form:form action="hi" name="dangnhap"  method="post" >

                <fieldset class="form-group">
                    <label>UserName</label> <input type="text" class="form-control" name="userName" id="userName"
                                                   required="required">
                </fieldset>


                <fieldset class="form-group">
                    <label>PassWord</label> <input type="password" class="form-control" name="passWord" id="passWord"
                                                   required="required">
                </fieldset>
                <button type="submit" class="btn btn-success">Đăng nhập</button>


            </form:form>

        </div>

    </div>
</div>
</body>
</html>