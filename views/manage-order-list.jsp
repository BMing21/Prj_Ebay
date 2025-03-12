<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="./images/lg.jpg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style_1.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Manage Order</title>
        <%@include file="../component/javascript.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-xxxxxxx" crossorigin="anonymous" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            li.nav-item a.active{
                color: red;
                font-weight: bold;
            }
            li.nav-item a{
                color: black;
            }
            .form-select option{
                background-color: transparent;
            }

            .input-container {
                position: relative;
                display: inline-block;
            }

            .input-container input[type="text"] {
                padding-right: 30px;
            }

            .clear-icon {
                position: absolute;
                top: 50%;
                color: red;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                display: none;
            }

            .input-container:hover .clear-icon {
                display: block;
            }

            .product-item {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 10px rgb(0 0 0);
                text-align: center;
            }

            .product-thumb {
                width: 180px;
                height: 250px;
            }

            .product-name {
                /* You can adjust the font size as needed */
                font-size: 14px;
                /* You can add additional styles if needed */
            }
        </style>

    </head>
    <body>
        <div id="main">

            <%@include file="../component/header.jsp" %>

            <div class="container-fluid" style="margin-top: 100px ">
                <div class="row">
                    <h1 style="text-align: center;">Danh Sách Đơn Hàng</h1>

                    <!--leftboard-->
                    <%@include file="../views/left.jsp" %>

                    <div class="col-md-10">
                        <div class="row justify-content-between"">

                            <div class="col-md-4">
                                <form class="search-bar" action="manage-order">
                                    <div class="input-container">

                                        <input id="myInput1" class="form-control"  type="text" name="key" value="${key}" placeholder="Tìm kiếm món" >
                                        <span class="clear-icon" onclick="clearInput()">X</span>
                                    </div>
                                    <input type="hidden" name="status" value="${status}"/>
                                    <button type="submit" class="btn btn-dark">Search</button>
                                </form>
                            </div>

                            <div class="col-md-2 " style="margin-right: -530px; font-size: 20px;"> <b>Sắp xếp: </b> </div>

                            <div class="col-md-3">
                                <select class="form-select" aria-label="Default select example" onchange="location = this.value;">                                                                     
                                    <option class=" text-center" value="manage-order?${historyKey}&status=null" ${status eq 'null' ? "Selected" : ""}>
                                        Tất cả
                                    </option> 
                                    <option class=" text-center" value="manage-order?${historyKey}&status=pending" ${status eq 'pending' ? "Selected" : ""}>
                                        Chờ xác nhận
                                    </option> 
                                    <option class=" text-center" value="manage-order?${historyKey}&status=processing" ${status eq 'processing' ? "Selected" : ""}>
                                        Đang thực hiện
                                    </option> 

                                </select>
                            </div>
                        </div>
                        <c:if test="${listOfPage.size() eq 0}">
                            <div style="text-align: center; ">  <h3 style="color:red;">Không tìm thấy kết quả </h3></div>
                        </c:if>
                        <br> <br> <br>
                        <div class="row" style="margin-top:40px;">
                            <div class="container mtop" style="width:100%">
                                <table class="table table-striped table-bordered" id="sortTable">
                                    <thead>
                                        <tr>
                                            <th>OrderID</th>
                                            <th>Ngày mua hàng</th>
                                            <th>Tổng chi phí</th>
                                            <th> Người đặt hàng</th>
                                            <th> Số Điện Thoại</th>
                                            <th> Note</th>
                                            <th>Tình trạng</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listOfPage}" var="c" >
                                            <tr>
                                                <td>
                                                    <a href="order-details?order_id=${c.id}">
                                                        ${c.id}</a>
                                                </td>
                                                <td>${c.order_datetime}</td>
                                                <td>${c.total_cost}</td>
                                                <td>${c.customer_name}</td>
                                                <td>${c.phone}</td>
                                                <td>${c.note}</td>
                                                <c:if test="${c.status == 'processing'}">
                                                    <td style="color: blue;">
                                                        Đang xử lý
                                                    </td>
                                                </c:if>
                                                <c:if test="${c.status == 'pending'}">
                                                    <td>
                                                        Chờ xác nhận
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <c:if test="${c.status == 'pending'}">
                                                        <div class="row">
                                                            <a onclick="return confirm('Xác nhận đơn hàng?')" href="update-order?order_id=${c.id}&status=processing" class="btn btn-success btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Xác nhận</a>
                                                        </div>
                                                        <div class="row">
                                                            <a onclick="return confirm('Từ chối đơn hàng?')" href="update-order?order_id=${c.id}&status=completed" class="btn btn-danger btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Từ chối</a>
                                                        </div>
                                                    </c:if>

                                                    <c:if test="${c.status == 'processing'}">
                                                        <div class="row">
                                                            <a onclick="return confirm('Xác nhận giao hàng thành công?')" href="update-order?order_id=${c.id}&status=completed" class="btn btn-success btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Đã Xử lý</a>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>


            </div>

        </div>

        <script>
            function clearInput() {
                document.getElementById("myInput1").value = "";
            }

        </script>
    </body>
</html>


