

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="./images/lg.jpg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file="../component/javascript.jsp" %>
        <title>Thank you</title>
    </head>
    <style>
        body {
            background: #FFFFE0;
            min-height: 100vh;
            vertical-align: middle;
            font-size: 15px;
        }
        .container{
            display: flex;
            margin-top: 50px;
            padding: 10px;
        }
        .title {
            margin-bottom: 5vh;
        }
        .card {
            margin: auto;
            max-width: 100%;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border: transparent;
            min-width: 95%;
            font-weight: bold;
        }

        .information{
            outline: 2px solid gray;
            padding: 10px;
        }
        @media(max-width:767px) {
            .card {
                margin: 3vh auto;
            }
        }

        .cart {
            background-color: white	;
            padding: 4vh 5vh;
            float: right;
        }

        @media(max-width:767px) {
            .cart {
                padding: 4vh;

            }
        }

        .row {
            margin: 0;
        }

        .title b {
            font-size: 1.5rem;
        }

        .main {
            margin: 0;
            padding: 2vh 0;
            width: 100%;
        }

        .col-2,
        .col {
            padding: 0 1vh;
        }

        a {
            padding: 0 1vh;
        }

        .close {
            margin-left: auto;
            font-size: 0.7rem;
        }


        .back-to-shop {
            margin-top: 4.5rem;
        }

        table {
            border-collapse: collapse;
        }


        tr{
            height: 90px;
            margin: 10px;
            padding: 10px;
        }
        .product_quantity{
            width: 15px;
            height: 18px;
            text-align: center;
            line-height: 20px;
            position: absolute;
            background: #0089ff;
            color: #fff;
            font-size: 12px;
            border-radius: 50%;
        }
        .col-md-5{
            height: 400px;

            overflow-y: scroll;

        }
    </style>
    <body>
        <div class="container">
            <div class=" col-md-7">
                <section class="heading" style="display: flex;">
                    <div class="done_icon" style="padding: 10px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="100px" height="100px">
                        <g fill="none" stroke="#8EC343" stroke-width="2">
                        <circle cx="36" cy="36" r="35" ></circle>
                        <path d="M17.417,37.778l9.93,9.909l25.444-25.393" ></path>
                        </g>
                        </svg>
                    </div>
                    <div class="thankyou-message">
                        <h2 class="section__title">Cảm ơn bạn đã đặt hàng</h2>
                    </div>
                </section>

                <div class="information" >
                    <div class="row">
                        <div class="col col--md-two">
                            <h4>Thông tin mua hàng</h4>
                            <p>${requestScope.fullName}</p>
                            <p>${requestScope.email}</p>
                            <p>${requestScope.phone}</p>
                        </div>
                        <div class="col col--md-two">
                            <h4>Địa chỉ nhận hàng</h4>
                            <p>${requestScope.fullName}</p>
                            <p>${requestScope.address}</p>
                            <p>${requestScope.note}</p>
                            <p>${requestScope.phone}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col--md-two">
                            <h4>Phương thức thanh toán</h4>
                            <p>COD</p>
                        </div>
                        <div class="col col--md-two">
                            <h4>Phương thức vận chuyển</h4>
                            <p>Giao hàng tận nơi</p>
                        </div>
                    </div>
                </div>
                <div class="action_field" style="margin: 10px;">
                    <a onclick="removeSession()" href="products" class="btn btn-primary">Tiếp tục mua hàng</a>
                    <span class="text-icon-group" onclick="window.print()">
                        <button type="button" class="btn btn-outline-primary"> <i class="fa fa-print"></i>
                            <span>In </span></button>
                    </span>
                </div>
            </div>
            <div class="col-md-5 cart">
                <div class="title">
                    <div class="row">
                        <div class="col">
                            <h4><b>Đơn hàng #${order_id}</b></h4>
                        </div>
                        <!-- <div class="col align-self-center text-right text-muted">3 items</div> -->
                    </div>
                </div>

                <table class="table table-hover">
                    <tbody>
                        <c:forEach items="${sessionScope.copyListCart}" var="c">
                            <tr>
                                <th scope="row">
                                    <div>
                                        <img style="height: 80px; width: 80px; background-color: white;" class="img-fluid" src="${c.product_image}" alt="alt"> 
                                        <span class="product_quantity">${c.quantity}</span>
                                    </div>
                                </th>
                                <td><div class="col">${c.product_name}</div></td>
                                <td><div class="col" style="text-align: center;">${c.product_price}₫</div>     </td>                               
                            </tr>

                        </c:forEach>  



                    </tbody>

                    <tfoot>
                        <tr>
                            <th scope="row">Tạm tính</th>
                            <td></td>
                            <td >${sum}₫</td>
                        </tr>
                        <tr>
                            <th scope="row">Phí vận chuyển</th>
                            <td></td>
                            <td >0₫</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                Tổng cộng
                            </th>
                            <td></td>
                            <td  style="color: #D2691E;">
                                ${sum}₫
                            </td>
                        </tr>
                    </tfoot>
                </table>

            </div>

        </div>
        <script>
            function removeSession() {
                sessionStorage.removeItem('copyListCart');
                sessionStorage.removeItem('sum');
            }</script>

    </body>
</html>
