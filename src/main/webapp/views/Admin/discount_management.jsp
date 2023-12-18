<%@ page import="java.util.List" %>
<%@ page import="model.bean.Discount" %>
<%@ page import="model.service.DiscountService" %>
<%@ page import="model.bean.Product" %>
<%@ page import="model.service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Discount> discounts = DiscountService.getInstance().getAll();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> <!--icon-->
    <title>Thêm sản phẩm</title>
    <style>
        li {
            list-style-type: none;
        }

        p, ul, li {
            margin: 0;
            padding: 0;
        }

        nav ul.menu {
            overflow: auto;
        }

        nav ul.menu li.item {
            float: left;
            cursor: pointer;
            font-size: 20px;
        }

        nav ul.menu li.item ul.sub_menu {
            position: absolute;
            overflow: auto;
            display: none;
        }

        nav ul.menu li.item:hover ul.sub_menu {
            width: auto;
            display: block;
            border-radius: 3px;
            margin-top: -15px;
        }

        nav ul.menu li.item ul.sub_menu p {
            font-weight: bold;
            background-color: #afe2ea;
        }

        nav ul.menu li.item ul.sub_menu li {
            display: block;
            background-color: #afe2ea;
            padding: 5px 10px;
        }

        /*nav ul.menu li.item ul.sub_menu li a {*/
        /*    color: white;*/
        /*    text-decoration: none;*/
        /*}*/

        /*nav ul.menu li.item ul.sub_menu li a:hover {*/
        /*    color: black;*/
        /*}*/
        .product-list {
            max-height: 400px; /* Đặt giá trị tối đa cho chiều cao */
            overflow-y: auto; /* Thêm thanh trượt khi chiều cao vượt quá max-height */
        }

        .sticky-title {
            position: sticky;
            top: 0;
            background-color: #afe2ea; /* Màu nền của phần tiêu đề cố định */
            font-weight: bold;
        }

        #add_discount {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            overflow: auto;
            display: none;
            z-index: 9;
            background-color: #2c3e50; /* Adjust the background color as needed */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Optional: Add a box shadow for a subtle effect */
        }


    </style>
</head>
<%
    boolean isAdmin = ((request.getSession().getAttribute("isAdmin") == null) ? false : ((boolean) request.getSession().getAttribute("isAdmin")));
    if (isAdmin) {
%>
<body>
<form action="<%=request.getContextPath()%>/admin/discount" method="post">
    <div class="container">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button type="button" onclick="showAddDiscount()"><i class="fa-regular fa-square-plus"
                                                                     style="font-size: 50px; color: #0dcaf0"></i>
                </button>
            </div>
        </div>
        <div class="row mb-5 mt-2">
            <div class="col-md-12">
                <div class="card px-3 py-1">
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-1 d-flex justify-content-center">
                                <strong>STT</strong>
                            </div>
                            <div class="col-md-2 d-flex justify-content-center">
                                <strong>Tên khuyến mãi</strong>
                            </div>
                            <div class="col-md-2 d-flex justify-content-center">
                                <strong>Ngày bắt đầu</strong>
                            </div>
                            <div class="col-md-2 d-flex justify-content-center ">
                                <strong>Ngày kết thúc</strong>
                            </div>
                            <div class="col-md-1 d-flex justify-content-center">
                                <strong>Tỉ lệ giảm giá(%)</strong>
                            </div>
                            <div class="col-md-2 d-flex justify-content-center">
                                <strong>Danh sách sản phẩm đang áp dụng</strong>
                            </div>
                            <div class="col-md-2 d-flex justify-content-center">
                                <strong>Thao tác</strong>
                            </div>
                        </div>
                        <%int stt = 0;%>
                        <%for (Discount d : discounts) {%>
                        <%stt++;%>
                        <div class="row border my-2 rounded">
                            <div class="col-1 text-center"><%=stt%>
                            </div>
                            <div class="col-md-2 text-center"><%=d.getName()%>
                            </div>
                            <div class="col-md-2 text-center"><%=d.getStartDate()%>
                            </div>
                            <div class="col-md-2 text-center"><%=d.getEndDate()%>
                            </div>
                            <div class="col-md-1 text-center"><%=d.getPercentageOff() * 100%>
                            </div>
                            <div class="col-md-2 text-center d-flex justify-content-center text-center">
                                <nav>
                                    <ul class="menu">
                                        <li class="item">
                                            <i class="fa-solid fa-list-check"></i>
                                            <ul class="sub_menu border border-primary product-list">
                                                <div class="sticky-title">
                                                    <p><%=d.getName()%>
                                                    </p>
                                                    <div>
                                                        <input type="button" class="btn btn-info"
                                                               onclick="selectAllProductForDiscount()"
                                                               value="Chọn tất cả"
                                                        >
                                                        <input type="button" class="btn btn-info"
                                                               onclick="deSelectAllProductForDiscount()"
                                                               value="Bỏ tất cả"
                                                        >
                                                        <button type="submit"
                                                                name="submit_1_discountId"
                                                                value="<%=d.getId()%>"
                                                                class="btn btn-success"
                                                        >Hoàn tất
                                                        </button>
                                                    </div>
                                                </div>
                                                <%for (Product p : ProductService.getInstance().getAll()) {%>
                                                <li>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input chk" type="checkbox"
                                                               id="<%=p.getId()%>"
                                                               name="<%=d.getId()%>" value="<%=p.getId()%>"
                                                            <%if(p.getDiscountId()!=null && p.getDiscountId().equals(d.getId())) {%>
                                                               checked
                                                            <%}%>
                                                        >
                                                        <label class="form-check-label" for="<%=p.getId()%>">
                                                            <%=p.getId()%>-<%=p.getName()%>
                                                        </label>
                                                    </div>
                                                </li>
                                                <%}%>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-2 text-center d-flex justify-content-center text-center mt-1">
                                <a href="#" class="px-2"><i class="fa-solid fa-pen fs-4"
                                                            style="color: #5c7093;"></i></a>
                                <a href="#" class="px-2"><i class="fa-solid fa-trash-can fs-4"
                                                            style="color: #5c7093;"></i></a>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div id="add_discount" class="w-50 bg-secondary p-3 rounded">
            <div class="text-center fw-bold p-3" style="font-size: 30px; color: #0dcaf0">Thêm khuyến mãi giảm giá</div>
            <div class="input-group mb-3">
                <div class="input-group-prepend me-3">
                    <span class="input-group-text fw-bold">Tên khuyến mãi</span>
                </div>
                <input type="text" class="form-control" placeholder="Sinh nhật HandmadeStore">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend me-3">
                    <span class="input-group-text fw-bold">Giảm giá(%)</span>
                </div>
                <input type="text" class="form-control w-25" placeholder="15">
            </div>
            <div class="input-group">
                <div class="input-group-prepend me-3">
                    <span class="input-group-text fw-bold">Ngày bắt bắt đầu và ngày kết thúc</span>
                </div>
                <input type="date" class="form-control">
                <input type="date" class="form-control">
            </div>
            <div class="d-flex justify-content-end m-0">
                <button type="button" onclick="hideAddDiscount()" class="btn btn-outline-warning m-3 fs-5 fw-bold"
                        style="color: #eeeeee">Hủy bỏ
                </button>
                <button type="submit" value="adddiscount" class="btn btn-outline-success m-3 fs-5 fw-bold"
                        style="color: #eeeeee">Hoàn tất
                </button>
            </div>
        </div>
    </div>
</form>
<script>
    function showAddDiscount() {
        document.getElementById("add_discount").style.display = "block";
    }

    function hideAddDiscount() {
        document.getElementById("add_discount").style.display = "none";
    }

    function selectAllProductForDiscount() {
        var checkboxes = document.querySelectorAll('.chk');
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox')
                checkboxes[i].checked = true;
        }
    }

    function deSelectAllProductForDiscount() {
        var checkboxes = document.querySelectorAll('.chk');
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox')
                checkboxes[i].checked = false;

        }
    }
</script>
</body>
<%
    } else {
        response.sendRedirect(request.getContextPath()+"/login");
    }%>
</html>
