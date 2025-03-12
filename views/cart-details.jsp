
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="./images/lg.jpg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <title> Cart Information </title>
        <!-- Css Styles -->
        <link rel="stylesheet" href="./do/css/style1.css" type="text/css">
        <link rel="stylesheet" href="./do/css/style.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style_1.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="../component/javascript.jsp" %>
    </head>
    <style>
        [type="checkbox"]:checked,
        [type="checkbox"]:not(:checked),
        [type="radio"]:checked,
        [type="radio"]:not(:checked){
            position: absolute;
            left: -9999px;
            width: 0;
            height: 0;
            visibility: hidden;
        }

        .checkbox-size:checked + label,
        .checkbox-size:not(:checked) + label{
            position: relative;
            display: inline-block;
            padding: 1%;
            width: 10%;
            font-size: 14px;
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 10px;
            text-align: center;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            -webkit-transition: all 300ms linear;
            transition: all 300ms linear;
        }
        .checkbox-size:not(:checked) + label{
            background-color: white;
            border: 1px solid black;
            color: black;
        }

        .checkbox-size:not(:checked) + label:hover{
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .checkbox-size:checked + label::before,
        .checkbox-size:not(:checked) + label::before{
            position: absolute;
            content: '';
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 4px;
            background-color: black;
            z-index: -1;
        }

        [type="checkbox"]:checked,
        [type="checkbox"]:not(:checked),
        [type="radio"]:checked,
        [type="radio"]:not(:checked){
            position: absolute;
            left: -9999px;
            width: 0;
            height: 0;
            visibility: hidden;
        }
        .checkbox-color:checked + label,
        .checkbox-color:not(:checked) + label{
            position: relative;
            display: inline-block;
            padding: 4%;
            width: 4%;
            font-size: 14px;
            text-align: center;
            border-radius: 50%;
            cursor: pointer;
            color: black;
            border: 3px solid black;
            -webkit-transition: all 300ms linear;
            transition: all 300ms linear;
        }
        .checkbox-color:not(:checked) + label{
            border: 3px solid white;
            border-radius: 50%;
        }

        .checkbox-color:not(:checked) + label:hover{
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .checkbox-color:checked + label::before,
        .checkbox-color:not(:checked) + label::before{
            position: absolute;
            content: '';
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: black;
            z-index: -1;
        }

        .marketing_feedback_margin{
            margin-left: 3%;
            margin-right: 3%
        }
        .marketing_feedbac_displayinline{
            display: inline;
        }
        textarea{
            width: 90%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }


        .countProduct{

            display: flex;
            border: 1px solid black;
            border-radius: 45px;
        }

        input[type="number"]{
            text-align: center;
            font-size: 20px;
            border: none;
            color: #202030;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button{
            -webkit-appearance: none;
            margin: 0;
        }
        button{
            color: black;
            background-color: #ffffff;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }
        #decrement{
            padding: 5px 0px 5px 15px;
            border-radius: 45px 0 0 45px;
            cursor: pointer;
            font-size: 20px;
        }
        #increment{
            padding: 5px 15px 5px 0px;
            border-radius: 0 45px 45px 0;
            cursor: pointer;
            font-size: 20px;
        }
        .cart-table{
            height: 400px;
            overflow: scroll;
        }
    </style>
    <body id="main">
        <%@include file="../component/header.jsp" %>
        <section class="shopping-cart spad mt-10">
            <div class="container" style="max-width: 90%; margin-top: 40px">
                <h2><b>Giỏ hàng của bạn</b></h2>
                <c:if test="${(listCart ne null) and (listCart.size() > 0)}">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="cart-table">
                                <table>
                                    <thead style="position: sticky; top: 0;
                                           background-color: #FFFFE0;">
                                        <tr>
                                            <th> Ảnh sản phẩm</th>
                                            <th class="p-name">Tên sản phẩm</th>
                                            <th>Giá tiền (USD)</th>
                                            <th>Số lượng</th>
                                            <th>Tổng (USD)</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCart}" var="c">
                                            <tr>
                                                <td class="p-price first-row"><img style="width: 100px; height: 150px;" src="${c.getProduct().getImages().get(0).getUrl()}" alt="alt"/></td>
                                                <td class="cart-title first-row">
                                                    <h5>${c.getProduct().getName()}</h5>
                                                </td>
                                                <td id="price" class="p-price first-row">${c.getProduct().getUnitprice()}</td>
                                                <td class="qua-col first-row">
                                                    <div   class="quantity" id="formQuantity" >                                                
                                                        <div class="countProduct">
                                                            <div id="decrement" class="decrement"  ><a href="carts?action=edit&product_id=${c.product_id}&quantity=${(c.quantity-1) eq 0 ? 1 : (c.quantity-1)}"><b>-</b></a></div>
                                                            <input type="number" min="1" max="100" step="1" value="${c.quantity}" id="my-input${c.product_id}" readonly>
                                                            <div id="increment" class="increment"  ><a href="carts?action=edit&product_id=${c.product_id}&quantity=${(c.quantity+1) eq 101 ? 100 : (c.quantity+1)}"><b>+</b></a></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td id="totalPriceOfProduct" class="total-price first-row">${c.getTotal_cost()}</td>
                                                <td class="close-td first-row">
                                                    <form action="carts" name="deleteCart" onsubmit="return confirmDeleteProduct()">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="product_id" value="${c.product_id}">
                                                        <button type="submit" class="btn-outline-danger border-5 text-decoration-none "> <i class="ti-close"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="back-to-shop text-muted"><a href="products"><b>&leftarrow; Quay lại</b></a></div>
                                </div>
                                <div class="col-lg-4 offset-lg-4">
                                    <div class="proceed-checkout">
                                        <ul>
                                            <li class="cart-total">Tổng tiền thanh toán <span>${sum} USD</span></li>
                                        </ul>
                                        <div  class="proceed-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                            <a   id="checkoutLink" href="carts?action=order" style="color: white">Tiến hành đặt</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${listCart eq null or listCart.size() == 0}">
                    <p style="color: red"> Không có sản phẩm </p>
                    <div class="back-to-shop text-muted"><a href="products"><b>&leftarrow; Quay lại mua hàng</b></a></div>
                </c:if>
            </div>
        </section>

        <!-- Js Plugins -->
        <script src="./do/js/jquery-3.3.1.min.js"></script>
        <script src="./do/js/bootstrap.min.js"></script>
        <script src="./do/js/jquery-ui.min.js"></script>
        <script src="./do/js/jquery.countdown.min.js"></script>
        <script src="./do/js/jquery.nice-select.min.js"></script>
        <script src="./do/js/jquery.zoom.min.js"></script>
        <script src="./do/js/jquery.dd.min.js"></script>
        <script src="./do/js/jquery.slicknav.js"></script>
        <script src="./do/js/owl.carousel.min.js"></script>
        <script src="./do/js/main.js"></script>
        <script>
                                                        function confirmDeleteProduct() {
                                                            if (confirm("Bạn có chắc chắn muốn xóa?")) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        }
        </script>


    </body>
</html>
