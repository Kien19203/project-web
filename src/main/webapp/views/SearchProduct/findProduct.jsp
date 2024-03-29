<%@ page import="model.bean.Product" %>
<%@ page import="model.service.ImageService" %>
<%@ page import="model.service.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/3/2024
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> <!--icon-->
    <link href="<%=request.getContextPath()%>/views/bootstrap-css/bootstrap.min.css">
    <link href="<%=request.getContextPath()%>/views/SearchProduct/findProduct.css" rel="stylesheet" type="text/css">
    <title>Tìm Kiếm</title>
</head>
<body>
<%List<Product> allProduct = (List<Product>) request.getAttribute("productInPage1");%>
<%String resultFind = (String) request.getAttribute("resultFind");%>
<div class="header">
    <%@include file="../MenuBar/menu.jsp" %>
</div>
<div class="find">
    <p>Nhập từ khóa tìm kiếm</p>
    <div class="box_find">
        <form action="<%=request.getContextPath()%>/findProduct" method="post" id="find">
            <%if(resultFind.isEmpty()){%>
            <input name="findProducts" type="text" placeholder="Bạn tìm gì...">
            <%}else{%>
            <input name="findProducts" type="text" placeholder="Bạn tìm gì..." value="<%=resultFind%>">
            <%}%>
            <button><i class="fa-solid fa-magnifying-glass" style="color: white;"></i></button>
        </form>
    </div>
</div>
<div>
    <%if(allProduct.isEmpty()){%>
    <p class="ms-5 fw-bold fs-5">Không có sản phẩm</p>
    <%}else{%>
    <p class="ms-5 fw-bold fs-5">Kết quả tìm thấy <%=request.getAttribute("numberProduct")%> sản phẩm từ khóa "<%=resultFind%>": </p>
    <%}%>
</div>
<div class="product">
    <ul id="allProduct" class="products m-2 me-5 ms-3 d-flex flex-wrap">
        <%for (Product p : allProduct) {%>
        <%String pathImage = ImageService.getInstance().pathImageOnly(p.getId());%>
        <li class="product_li">
            <div class="item_product  me-4">
                <a class="image" href="#"> <img src="<%=request.getContextPath()%>/<%=pathImage%>"> </a>
                <a href="#"><p class="pt-4 px-3"><%=p.getName() %>
                </p></a>
                <%!double giaBanSauCung;%>
                <% giaBanSauCung = ProductService.getInstance().productPriceIncludeDiscount(p);%>
                <%if(p.getCategoryId() >= 0 && giaBanSauCung!= p.getSellingPrice()){%>
                <del><%=p.getSellingPrice()%>đ</del>
                <%}%>
                <p><%=ProductService.getInstance().productPriceIncludeDiscount(p)%>đ</p>
                <div class="add-to-cart"><span>Thêm vào giỏ hàng</span></div>
            </div>
        </li>

        <%}%>
    </ul>
</div>
<%--    Số Trang--%>
<div class="pagination mx-5">
    <%int currentPage = (int) request.getAttribute("currentPage1");%>
    <%int totalPage = (int) request.getAttribute("totalPage1");%>
    <%
        if (currentPage > 1) {%>
    <a class="fs-5" href="<%=request.getContextPath()%>/findProduct?findProducts=<%=resultFind%>&&page=<%=(currentPage - 1)%>">Trước</a>
    <%}%>
    <%
        for (int i = 1; i <= totalPage; i++) {
            if (i == currentPage) {
    %>
    <strong><%=i%>
    </strong>
    <%} else {%>
    <a class="fs-5" href="<%=request.getContextPath()%>/findProduct?findProducts=<%=resultFind%>&&page=<%=i%>"><%=i%>
    </a>
    <%
            }
        }
    %>
    <%if (currentPage < totalPage) {%>
    <a class="fs-5" href="<%=request.getContextPath()%>/findProduct?findProducts=<%=resultFind%>&&page=<%=(currentPage+1)%>">Tiếp</a>
    <%}%>
</div>
<div class="footer">
    <%@include file="../Footer/footer.jsp" %>
</div>
</body>
</html>
