<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="./images/lg.jpg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file="../component/javascript.jsp" %>
        <title>Cart Contact</title>

    </head>

    <style>
        body {
            background: #FFFFE0;
            min-height: 100vh;
            vertical-align: middle;
            font-size: 15px;

        }

        .title {
            margin-bottom: 5vh;
        }

        .card {
            margin: auto;
            max-width: 100%;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent;
            min-width: 95%;
            font-weight: bold;
        }

        @media(max-width:767px) {
            .card {
                margin: 3vh auto;
            }
        }

        .cart {
            background-color: #E6E6FA	;
            padding: 4vh 5vh;
            border-top-left-radius: 1rem;
            border-bottom-left-radius:  1rem;
            float: right;

        }

        @media(max-width:767px) {
            .cart {
                padding: 4vh;
                border-top-left-radius: 1rem;
                border-bottom-left-radius:  1rem;
            }
        }

        .summary {
            background-color: #ddd;
            border-bottom-right-radius: 1rem;
            border-top-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65);
        }

        @media(max-width:767px) {
            .summary {
                border-bottom-right-radius: 1rem;
                border-top-right-radius: 1rem;
            }
        }

        .summary .col-2 {
            padding: 0;
        }

        .summary .col-10 {
            padding: 0;
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

        h5 {
            margin-top: 4vh;
        }

        hr {
            margin-top: 1.25rem;
        }

        form {
            padding: 2vh 0;
        }

        select {
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1.5vh 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        .input-name input {
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        input:focus::-webkit-input-placeholder {
            color: transparent;
        }


        .style-btn .btn {
            background-color: #000;
            border-color: #000;
            color: white;
            width: 100%;
            font-size: 0.7rem;
            margin-top: 4vh;
            padding: 1vh;
            border-radius: 0;
        }

        .btn:focus {
            box-shadow: none;
            outline: none;
            box-shadow: none;
            color: white;
            -webkit-box-shadow: none;
            -webkit-user-select: none;
            transition: none;
        }

        .btn:hover {
            color: white;
        }

        a {
            color: black;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }

        #code {
            background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
            background-repeat: no-repeat;
            background-position-x: 95%;
            background-position-y: center;
        }


        .payment-method__item-name {
            font-size: 15px;
            padding-left: 20px;
        }

        .payment-method__item {
            display: flex;
            align-items: center;
            border: 1px solid #D9D9D9;
            border-radius: 16px;
            padding: 15px 20px;
            margin-bottom: 1rem;
        }



        .payment-method__item-icon-wrapper img {
            min-width: 100px;
            max-height: 100px;
            max-width: 100px;
            padding-left: 40px;
            image-rendering: -webkit-optimize-contrast;
        }

        .payment-choosing{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .scBar{
            height: 600px;
            overflow: scroll;
        }
    </style>
    <%@include file="../component/header.jsp" %>
    <body>

        <div class="card" style="margin-top: 10%;
             margin-bottom: 5%">
            <div class="row">
                <div class="col-md-4 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col">
                                <h4><b>Sản phẩm</b></h4>
                            </div>
                            <!-- <div class="col align-self-center text-right text-muted">3 items</div> -->
                        </div>
                    </div>
                    <div class="scBar">
                        <c:forEach items="${sessionScope.listCart}" var="c">
                            <div class="row border-top border-bottom">
                                <div class="row main align-items-center">
                                    <div class="col-2"><img class="img-fluid" src="${c.getProduct().getImages().get(0).getUrl()}"></div>
                                    <div class="col">
                                        <div class="row">${c.getProduct().getName()}</div>
                                    </div>
                                    <div class="col" style="text-align: center;">
                                        <div class="text-muted">Số lượng: ${c.quantity}</div>
                                    </div>
                                    <div class="col" style="text-align: center;">${c.getProduct().unitprice}$</div>
                                </div>
                            </div>
                        </c:forEach>       
                    </div>

                    <div class="back-to-shop text-muted"><a href="products">&leftarrow; Trở lại</a></div>
                </div>

                <div class="style-btn col-md-4 payment-choosing ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3 " style="margin-top: -17px;" >
                            <h4 class="text-right"><b>Hình thức thanh toán</b></h4> 
                        </div>
                        <hr>
                        <div class="radio-buttons">
                            <div>
                                <label class="payment-method__item">
                                    <span class="payment-method__item-custom-checkbox custom-radio">
                                        <!--                                        <input type="radio" id="payment-COD" name="payment-method" value="COD" onchange="setRadioValueToInput()" checked>-->
                                        <input type="radio" id="payment-COD" name="payment-method" value="COD" checked="" required>
                                        <span class="checkmark">
                                        </span>
                                    </span>
                                    <span class="payment-method__item-icon-wrapper"><img
                                            src="https://www.coolmate.me/images/COD.svg"></span>
                                    <span class="payment-method__item-name">COD <br>Thanh toán khi nhận hàng
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="style-btn col-md-4 summary ">
                    <div class="row">
                        <h4 class="cal"><b>Thông tin nhận hàng</b></h4>
                        <div class="col align-self-center text-right text-danger">Hãy kiểm tra kỹ thông tin trước khi đặt hàng</div>
                    </div>
                    <hr>
                    <form class="input-name" action="orders" method="post" name="formInformationCustomer" onsubmit="return validateFormInformationCustomer()">
                        <label for="fullname">Họ Tên</label>
                        <input id="fullname" type="text" name="fullName" value="${sessionScope.user.fullName}" required>

                        <label for="phone">EMAIL</label>
                        <input id="phone" type="text" name="email" value="${sessionScope.user.email}" required>

                        <label for="phone">SỐ ĐIỆN THOẠI</label>
                        <input id="phone" type="text" name="phone" value="${sessionScope.user.phone}" required>

                        <label for="address">ĐỊA CHỈ</label>
                        <input id="address" type="text" name="address" value="${sessionScope.user.address}" required>

                        <label for="note">GHI CHÚ</label>
                        <textarea  id="note" class="form-control" name="note" style="background-color: rgb(247, 247, 247);"
                                   id="exampleFormControlTextarea1" rows="3" placeholder="Nhập thông tin liên hệ khác, địa chỉ khác ..."></textarea>
                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1);
                             padding: 2vh 0;">
                            <div class="col">TỔNG TIỀN</div>
                            <div class="col text-right text-danger">${sessionScope.sum}₫</div>
<!--                            <input type="hidden" name="sum" value="${sessionScope.sum}">-->
                        </div>
                        <input type="hidden" id="paym-method" name="paym-method">
                        <button type="submit" class="btn" style="font-size: 20px;" onclick="submitForm()">Đặt hàng</button>
<!--                        <a href="checkout?amount=${sessionScope.sum}" type="submit" class="btn" style="font-size: 20px;">Đặt hàng</a>-->
                    </form>
                </div>
            </div>
        </div>


        <%@include file="../component/footer.jsp" %>
        <script>
            function validateFormInformationCustomer() {
                const name = document.forms["formInformationCustomer"]["fullName"].value.trim();
                const email = document.forms["formInformationCustomer"]["email"].value.trim();
                const phone = document.forms["formInformationCustomer"]["phone"].value.trim();
                const address = document.forms["formInformationCustomer"]["address"].value.trim();


                // Kiểm tra tên có rỗng không
                if (name.length === 0) {
                    alert("Vui lòng nhập tên của bạn");
                    return false;
                }

                // Kiểm tra định dạng email
                const emailRegex = /^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z]+\.[a-zA-Z]{2,}$/;
                if (!emailRegex.test(email)) {
                    alert("Vui lòng nhập email hợp lệ");
                    return false;
                }

                Kiểm tra định dạng số điện thoại
                        const phoneRegex = /^0\d{9}$/;
                if (!phoneRegex.test(phone)) {
                    alert("Vui lòng nhập số điện thoại hợp lệ!a");
                    return false;
                }

                if (address.length < 1) {
                    alert("Độ dài address ít nhất 10 ký tự");
                    return false;
                }



                return true;
            }
        </script>
        <script>
//            function setRadioValueToInput() {
//                var selectedValue = document.querySelector('input[name="payment-method"]:checked').value;
//                document.getElementById('paym-method').value = selectedValue;
//            }

            document.getElementById("payment-COD").addEventListener("click", function () {
                document.getElementById("paym-method").value = this.value;
            });

            document.getElementById("payment-vnpay").addEventListener("click", function () {
                document.getElementById("paym-method").value = this.value;
            });


            function submitForm() {
                const genderInputs = document.getElementsByName('payment-method');
                let selectedGender = null;
                for (let i = 0; i < genderInputs.length; i++) {
                    if (genderInputs[i].checked) {
                        selectedGender = genderInputs[i].value;
                        break;
                    }
                }
                if (!selectedGender) {
                    alert('Hãy chọn một phương thức thanh toán');
                    event.preventDefault();
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
