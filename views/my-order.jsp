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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">

    <title>My Order</title>
    <%@include file="../component/javascript.jsp" %>

    <style>
        li.nav-item a.active {
            color: red;
            font-weight: bold;
        }
        li.nav-item a {
            color: black;
        }
        .product-item {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(0 0 0);
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="main">
        <%@include file="../component/header.jsp" %>

        <div class="container-fluid" style="margin-top: 100px;">
            <div class="row">
                <h1 style="text-align: center;">Danh Sách Đơn Hàng Của bạn</h1>

                <div class="col-md-12">
                    <c:if test="${listOfPage.size() eq 0}">
                        <div style="text-align: center;"><h3 style="color:red;">Không tìm thấy kết quả</h3></div>
                    </c:if>
                    <br><br><br>
                    <div class="row" style="margin-top:40px;">
                        <div class="container mtop" style="width:100%">
                            <table class="table table-striped table-bordered" id="orderTable">
                                <thead>
                                    <tr>
                                        <th>OrderID</th>
                                        <th>Ngày mua hàng</th>
                                        <th>Tổng chi phí ($)</th>
                                        <th>Tình trạng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listOfPage}" var="c">
                                        <tr>
                                            <td>
                                                <a href="order-details?order_id=${c.id}&type=owner">${c.id}</a>
                                            </td>
                                            <td>${c.order_datetime}</td>
                                            <td>${c.total_cost}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${c.status == 'processing'}">
                                                        <span style="color: blue;">Đang xử lý</span>
                                                    </c:when>
                                                    <c:when test="${c.status == 'pending'}">
                                                        <span>Chờ xác nhận</span>
                                                    </c:when>
                                                    <c:when test="${c.status == 'completed'}">
                                                        <span style="color: green;">Đã giao</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <a href="products"><button class="btn btn-primary">Trở về</button></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- DataTables and jQuery JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

        <!-- Initialize DataTable -->
        <script>
            $(document).ready(function() {
                $('#orderTable').DataTable({
                    "paging": true,
                    "searching": true,
                    "info": true,
                    "lengthChange": false,
                    "pageLength": 5,
                    "language": {
                        "search": "Tìm kiếm:",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        },
                        "info": "Hiển thị _START_ đến _END_ của _TOTAL_ đơn hàng",
                        "infoEmpty": "Hiển thị 0 đến 0 của 0 đơn hàng",
                        "emptyTable": "Không có dữ liệu trong bảng",
                    }
                });
            });
        </script>
    </div>
</body>
</html>
