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
        <title>Home</title>
        <%@include file="../component/javascript.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/themify-icons/themify-icons.css">

        <style>

            .related-products-slider .card {
                width: 1000px; /* Thay đổi kích thước chiều rộng của card ở đây */
                margin: 0 15px; /* Khoảng cách giữa các card */
            }

            .related-products-slider {
                display: flex;
                overflow-x: auto; /* Cho phép cuộn ngang nếu có nhiều sản phẩm hơn chiều rộng khung */
            }

        </style>

    </head>
    <body>
        <div id="main">
            <%@include file="../component/header.jsp" %>
            <div class="product-slider" style="margin-top: 50px;">
                <!-- Related product section-->
                <hr class="marketing_feedback_margin">
                <section class="py-5 bg-light">
                    <div class="container px-4 px-lg-5 mt-5">
                        <h2>Sản Phẩm Nổi Bật</h2>
                        <hr class="marketing_feedback_margin">

                        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:set var="active" value="active" />
                                <c:forEach items="${relatedProducts}" var="p" varStatus="status">
                                    <!-- Tạo slide mới cho mỗi 3 sản phẩm -->
                                    <c:if test="${status.index % 3 == 0}">
                                        <div class="carousel-item ${active}">
                                            <div class="row justify-content-center">
                                            </c:if>

                                            <div class="col-md-4 mb-4">
                                                <div class="card" style="background-color: white; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); height: 400px">                            

                                                    <c:choose>
                                                        <c:when test="${not empty p.images and not empty p.images[0].url}">
                                                            <img class="card-img-top mt-1" style="height: 200px; width: 100%; object-fit: cover;"
                                                                 src="${p.images[0].url}" alt="..." />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="card-img-top mt-1" style="height: 200px; width: 100%; object-fit: cover;"
                                                                 src="default-image-url.jpg" alt="No Image Available" />
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <div class="card-body">
                                                        <div class="text-center">
                                                            <!-- Product name-->
                                                            <h5 class="fw-bolder">${p.name}</h5>
                                                            <!-- Product price-->
                                                            <div>
                                                                Unit Price:
                                                                <span style="color: red">${p.unitprice}đ</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Product actions-->
                                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                        <div class="text-center">
                                                            <a class="btn btn-outline-success mt-auto" href="product-details?id=${p.id}&cid=${p.category_id}">Xem chi tiết</a>
                                                        </div>
                                                    </div>                        
                                                </div>
                                            </div>

                                            <c:if test="${status.index % 3 == 2 || status.last}">
                                            </div> <!-- Đóng row -->
                                        </div> <!-- Đóng carousel-item -->
                                        <c:set var="active" value="" /> <!-- Đặt lại active cho các slide tiếp theo -->
                                    </c:if>
                                </c:forEach>
                            </div>

                            <!-- Controls -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </section>
            </div>

            <div class="why_us_section" >
                <section class="why_us_section layout_padding">
                    <div class="container">
                        <div class="heading_container heading_center">
                            <h2>
                                
                            </h2>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="box ">
                                    <div class="img-box">
                                        <img src="images/w1.png" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            Fast Delivery
                                        </h5>                                      
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box ">
                                    <div class="img-box">
                                        <img src="images/w2.png" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            Free Shiping
                                        </h5>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box ">
                                    <div class="img-box">
                                        <img src="images/w3.png" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            Best Quality 
                                        </h5>                                   
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box ">
                                    <div class="img-box">
                                        <img src="images/w3.png" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            Free Service
                                        </h5>                                   
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script type="text/javascript"> $(document).ready(function () {
                $('.related-products-slider').slick({
                    dots: true, // Hiển thị điểm chỉ số
                    infinite: true, // Vô hạn slide
                    speed: 3000, // Tốc độ chuyển đổi slide (ms)
                    slidesToShow: 3, // Hiển thị 3 sản phẩm liên quan trên mỗi slide
                    slidesToScroll: 3, // Chuyển đổi 3 sản phẩm liên quan trên mỗi lần cuộn
                    autoplay: true, // Tự động phát slide
                    autoplaySpeed: 3000 // Tốc độ chuyển đổi slide (ms)
                });
            });
        </script>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>


