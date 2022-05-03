<%@ page import="com.example.biteltest2022.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.biteltest2022.repository.ProductRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.biteltest2022.model.Item" %>
<%! @Autowired ProductRepository productRepository; %>



<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All product</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
<%--    <link rel="stylesheet" href="css/items.css">--%>
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
<div id="header" style="background-color: #e8e8e8; box-sizing: border-box; height: 150px">
    <div style="float: left; margin-left: 20px">
        <a href="/book-store/index.jsp"><img src="resources/logo.png" ></a>
    </div>
    <div style="float: left; margin-left: 100px; margin-top: 50px; background-color: white; border: 3px solid coral;">
        <form action="items.jsp" method="GET">
            <input type="text" name="item_name" placeholder="Search everything you need..." style="width: 600px; height: 40px; float: left; border: none">
            <input type="image" style="width: 30px; height: 40px; float: left" src="https://cdn.onlinewebfonts.com/svg/img_135466.png">
        </form>
    </div>

<%--        <% String mainPage = "bookstore.jsp?customerID=" + session.getAttribute("customerID") + "&name=" + session.getAttribute("name");%>--%>
<%--        <a href="<%= mainPage%>">Go to main page</a>--%>
<%--    <% }%>--%>
</div>
<div id="items">
    <%
//        String itemName = request.getParameter("item_name");
//        ItemDAOImpl itemDAOImpl = new ItemDAOImpl();


        List<Product> items =  productRepository.findAll();
//        if (items.get == null || itemName.equals("")) {
//            items = itemDAOImpl.findAll();
//        } else {
//            items = itemDAOImpl.getItemByName(itemName);
//        }
//        Locale localeVN = new Locale("vi", "VN");
//        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        for (int i = 0; i < items.size(); i++) {
            int stt = i + 1;
            Product item = items.get(i);
    %>
    <div class="item">
        <div class="itemImg">
            <img src="<%= "img?ImgUrl=" + item.getImgUrl()%>" alt="" width="200px" height="100%">
        </div>
        <div class="itemInfo">
            <div style="width: 5%; height: 100%; float: left">&nbsp;</div>
            <div style="width: 90%; height: 100%; float: left">
                <p class="itemName" style="font-weight: bold;  height: 36px">
                    <%= item.getName()%>
                    item name
                </p>
                <p class="itemAuthor">
                    <%= item.getShortDes()%>
                    gioi thieu
                </p>
                <form action="cart" method="POST" >
                    <label class="itemPrice" style="text-decoration: underline">
<%--                        <%= currencyVN.format(item.getSalePrice())%>--%>
                        <%=item.getPrice()%>
                        gia tien
                    </label>
                    <input name="ItemID" hidden="true" value="
<%--<%= item.getId()%>--%>
thanh tien
">
                    <input name="CustomerID" hidden="true" value="
<%--<%= session.getAttribute("customerID")%>--%>
id khach
">
                    <input type="submit" value="Add to Cart" style="float: right;">
                </form>
            </div>
            <div style="width: 50%; height: 100%; float: left">&nbsp;</div>
        </div>
    </div>
    <%}
    %>
</div>
<div style="clear: both">
    <br>
</div>
</body>
</html>
