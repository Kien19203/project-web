<%@ page import="model.service.ImageService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đặt hàng - Thanh Toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> <!--icon-->
    <link rel="stylesheet" href="../PaymentPage/css/paymentpage.css">
    <link rel="stylesheet" href="../bootstrap-css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alumni+Sans+Inline+One&display=swap" rel="stylesheet">
</head>
<body>
<div class="row">
    <div class="col-lg-8 col-sm-12 p-0">
        <div class="h1 border-bottom alert ps-0" style="height: 10%">
            <a href="<%=request.getContextPath()%>/views/MainPage/view_mainpage/mainpage.jsp" class="text-decoration-none mx-3" style="color: #f4c994"><img src="<%=request.getContextPath()+"/"+ImageService.getLogoImagePath()%>" width="8%">HEADQUARTERS</a>
        </div>
        <div class="d-flex mx-5 pb-5">
            <div class="col-lg-7 col-sm-6 me-3">
                <div class="h6 text-black fw-bold text-center">
                    Thông tin nhận hàng
                </div>
                <div class="mt-4">
                    <div class="input-group mb-3 justify-content-center">
                        <div class="input-group-prepend w-100">
<%--                            email--%>
<%--                            <div class="form-floating mb-3">--%>
<%--                                <input id="email" type="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"--%>
<%--                                       class="form-control" placeholder="Email(tùy chọn)">--%>
<%--                                <label for="email" class="floatingInput">Email(Tùy Chọn)</label>--%>
<%--                            </div>--%>

                            <div class="form-floating mb-3">
                                <input id="name" type="text" class="form-control" placeholder="Họ và tên">
                                <label for="name" class="floatingInput">Họ Và  Tên</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input id="phone_number" type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                       class="form-control" placeholder="Số điện thoại">
                                <label for="phone_number" class="floatingInput">Số Điện Thoại</label>
                            </div>
                            <!--
                            -->
                            <div class="form-floating mb-3">
                                <select name="province" id="province" class="form-select">
                                    <option value=""></option>
                                </select>
                                <label for="province">Tỉnh Thành</label>
                            </div>
                            <div class="form-floating mb-3">
                                <select name="district" id="district" class="form-select">
                                    <option value=""></option>
                                </select>
                                <label for="district">Quận Huyện</label>
                            </div>
                            <div class="form-floating mb-3">
                                <select name="ward" id="ward" class="form-select">
                                    <option value=""></option>
                                </select>
                                <label for="ward">Phường Xã</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input id="address" type="text" class="form-control" placeholder="Địa chỉ">
                                <label for="address" class="floatingInput">Địa Chỉ: Số Nhà, Tên Đường,...</label>
                            </div>

                            <div class="form-floating mb-3">
                                <textarea id="note" class="form-control" style="height: 150%"></textarea>
                                <label for="address" class="floatingInput">Ghi Chú(Tùy Chọn)</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-sm-6">
                <div class="h6 text-black fw-bold">
                    Thanh toán
                </div>
                <div class="mt-4">

                    <div class="border alert alert-dismissible d-flex align-items-center">
                        <input class="form-check-input fs-5 me-3" style="cursor: pointer" type="radio"
                               name="flexRadioDefault"
                               id="thanhtoankhigiaohang"
                               onclick="hideBankaccount_infor()">
                        <label class="form-check-label" style="cursor: pointer" for="thanhtoankhigiaohang">
                            Thanh toán khi giao hàng (COD)
                        </label>
                        <i class="fa-regular fa-money-bill-1 fa-xl ms-auto" style="color: #357ebd;"></i>
                    </div>
                    <img src="" alt="">
                </div>
            </div>
        </div>
        <hr>
        <div class="row ms-auto float-end me-4">
            <ul class="list-group list-group-horizontal list-unstyled">
                <li class="list-group-item border-0">
                    <a onclick="showPoliciesAndTerms(1)" class="link-underline-light color-for-text" href="#">Chính
                        sách
                        hoàn trả</a>
                </li>
                <li class="list-group-item border-0">
                    <a onclick="showPoliciesAndTerms(2)" class="link-underline-light color-for-text" href="#">Chính
                        sách
                        bảo mật</a>
                </li>
                <li class="list-group-item border-0">
                    <a onclick="showPoliciesAndTerms(3)" class="link-underline-light color-for-text" href="#">Điều
                        khoản
                        sử dụng</a>
                </li>
            </ul>
        </div>
        <div class="row ms-auto float-end me-4">
            <p class="text-end">
                Cảm ơn bạn đã đặt hàng tại HandMadeStore. Chúng tôi sẽ liên lạc bạn sớm
                nhất để vận chuyển hàng hóa đến bạn. Có bất kỳ thắc mắc, vui lòng gọi ngay số tại HCM 0336677141,
                Hà Nội 0973 628 417, Đà Nẵng 0973 628 418 hoặc bất kỳ kênh online chính thức khác của
                HandMadeStore.
            </p>
        </div>

    </div>

    <div class="col-lg-4 col-sm-12  border-start  p-0" style="background-color: #FAFAFA">
        <div class="h6 text-black fw-bold p-3 border">
            Đơn hàng
            <span>(2 sản phẩm)</span>
        </div>
        <div style="
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;">
            <div style="width: 90%;">
                <table class="table table-striped table-borderless table-hover text-start">
                    <tr>
                        <td>
                            <div>
                                <img class="product-img" src="../../views/images/anh1.webp" alt="sanpham">
                                <span class="product-quantity">1</span>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h6>Thiệp sinh nhật</h6>
                                <p>Nhỏ - vàng</p>
                            </div>
                        </td>
                        <td>98.000₫</td>
                    </tr>
                    <tr>
                        <td>
                            <img class="product-img" src="../../views/images/anh2.webp" alt="sanpham">
                            <span class="product-quantity">2</span>
                        </td>
                        <td>
                            <div>
                                <h6>Thiệp sinh nhật</h6>
                                <p>Nhỏ - hồng</p>
                            </div>
                        </td>
                        <td>202.000₫</td>
                </table>
                <div class="row border-top py-3">
                    <div class="input-group-prepend col-9  d-flex align-items-center">
                        <div class="form-floating w-100">
                            <input id="discount_code" type="text" class="form-control"
                                   placeholder="Nhập mã giảm giá">
                            <label for="discount_code" class="floatingInput">Nhập mã giảm giá</label>
                        </div>
                    </div>
                    <div class="col-3 d-flex align-items-center">
                        <button type="button" class="btn btn-primary h-100 w-100 color-for-bg">Áp dụng</button>
                    </div>
                </div>
                <div class="row border-top py-3">
                    <table class="table-borderless">
                        <thead>
                        <tr>
                            <td><span class="visually-hidden">Mô tả</span></td>
                            <td><span class="visually-hidden">Giá tiền</span></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-start fw-medium">
                                Tạm tính
                            </th>
                            <td class="text-end pe-3">300.000₫</td>
                        </tr>
                        <tr>
                            <th class="text-start fw-medium">
                                Phí vận chuyển
                            </th>
                            <td class="text-end pe-3">35.000₫</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th class="text-start fs-5 fw-medium">
                                <span>
                                    Tổng cộng
                                </span>
                            </th>
                            <td class="text-end pe-3 fs-4 text-primary">
                                <span>
                                    335.000₫
                                </span>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="row py-3 ">
                    <div class="col-4 d-flex align-items-center">
                        <span><a href="../CartPage/cart.jsp" class="text-decoration-none color-for-text"><strong><</strong> Quay lại giỏ hàng</a></span>
                    </div>
                    <div class="col-8 text-end">
                        <button type="button" class="btn btn-primary fs-1 color-for-bg">Đặt Hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="infor_center">
    <div class="modal-wrapper">
        <div class="alert alert-primary alert-dismissible">
            <button type="button" class="btn-close" onclick="hidePoliciesAndTerms()"></button>
            <h5 id="infor_center_title"></h5>
        </div>
        <pre id="infor_center_content"></pre>
    </div>
</div>
<script src="../PaymentPage/js/paymentpage.js"></script>
<!--Bộ select tỉnh thành-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"
        integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../PaymentPage/js/provinces-api.js"></script>
</body>
</html>
