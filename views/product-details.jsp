<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="./images/lg.jpg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/style_1.css">
        <link rel="stylesheet" href="./assets/css/styles.css">

        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Product Details</title>     
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./do/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-LzKjzgkrgJXfXHzSeT+TJFt47+eCn7AaZvyoVRhSTYk1aALp9N9fB0GCH1JZYhF/5gQxj0JZ8uQGGkz5M5em5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                position: absolute;
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

            .image-zoom {
                position: relative;
                /*display: inline-block;*/
                width: 450px;
                height: 450px;
            }
            .image-zoom img{
                width: 450px;
                height: 450px;
                transition: transform 0.5s ease;
            }
            .image-zoom img:hover, .image-zoom img:focus {
                transform: scale(2);
                z-index: 1;
            }




        </style>
        <style>
            .related-products-slider .product-card {
                max-width: 250px; /* Set max width for each card */
            }
            .related-products-slider {
                max-width: 800px; /* Limit container width to prevent stretching */
            }
        </style>
        <%@include file="../component/javascript.jsp" %>
    </head>
    <body>
        <%@include file="../component/header.jsp" %>       
        <%@include file="../component/account.jsp" %>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div style="width: 450px; height: 450px; background-color: white; " id="carouselExampleControls" class="carousel slide col-md-5" data-ride="carousel">
                        <div class="carousel-inner" style="width: 100%; height: 100%;">
                            <div class="image-zoom carousel-item active">
                                <img id="imgProduct" class="d-block w-100"  src="${product.images[0].url}" alt="First slide">
                            </div>
                            <c:forEach items="${product.images}" var="i" begin="1">
                                <div class="image-zoom carousel-item" style="width: 100%; height: 100%;">                              
                                    <img id="imgProduct" class=" d-block w-100" style="width: 100%; height: 100%;" src="${i.getUrl()}" alt="...">
                                </div>
                            </c:forEach>
                        </div>
                        <a style="background-color: #F0F0F0; height: 50px; width: 50px; " class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a style="background-color: #F0F0F0; height: 50px; width: 50px;" class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="col-md-7">
                        <form action="carts" id="addcart" method="Post">
                            <h1>${requestScope.product.getName()}</h1>
                            <div class="group-status">
                                <span class="first_status">
                                    <span class="a_name">Status:</span> 
                                    <span class="status_name availabel"><i style="color:blue;">${requestScope.product.getQuantity() > 0 ? "Available":"Not Available"} </i></span> 
                                </span>
                            </div>
                            <div class="fs-5 mb-4">
                                <div style="margin-bottom: 1.7%">
                                    Unit Price: 
                                    <span >${product.getUnitprice()} USD</span>
                                </div>
                            </div>
                            <h6 class="mt-5">Description: </h6>
                            <div class="mb-5">${requestScope.product.getDescription()}</div>

                            <div class="row">
                                <c:if test="${product.quantity > 0}">
                                    <div class="countProduct col-lg-3" style="margin-left: 3%">
                                        <div id="decrement" onclick="stepper(this)"><b>-</b></div>
                                        <input type="number" name="quantity" min="1" max="100" step="1" value="1" id="my-input" readonly>
                                        <input type="hidden" name="product_id" value="${requestScope.product.id}" />
                                        <div id="increment" onclick="stepper(this)"><b>+</b></div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.user != null and sessionScope.user.getRole() eq 'user' and product.quantity > 0}" >
                                    <div class="col-lg-6">
                                        <input class="btn btn-outline-danger" type="submit" style="font-size: 20px" value="Add to cart">                                     
                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.user == null}" >
                                    <div class="col-lg-6">
                                        <a class="btn btn-outline-danger" href="/Prj_Ebay/login" style="font-size: 20px" >Add to cart</a>                                     
                                    </div>
                                </c:if>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section> 

        <!-- Feedback List -->
        <c:if test="${productFeedbacks.size() == 0}">
            <h3 style="text-align: center; font-style: oblique;">No reviews </h3>
        </c:if>   
        <c:if test="${sessionScope.user.getRole() eq 'user'}">
            <a data-toggle="modal" data-dismiss="modal" data-target="#review_modal">
                <button type="button" class="btn btn-info float-right marketing_feedback_margin marketing_feedbac_displayinline">Đánh giá của bạn</button>
            </a>
        </c:if>
        <c:if test="${productFeedbacks.size() > 0}">
            <div style="background-color:#F8F8FF;">
                <hr class="marketing_feedback_margin">
                <span><h2 class="marketing_feedback_margin marketing_feedbac_displayinline">${totalFeedback} feedback</h2></span>



                <hr class="marketing_feedback_margin">

                <div class="mt-5 mb-5" id="review_content">
                    <div class="row mb-3">
                        <c:forEach items="${productFeedbacks}" var="f">
                            <div class="col-sm-2">
                                <div style="width: 100px; height: 180px; border-radius: 50%; float: right;">
                                    <img  style="width: 100%; height: 100%;border-radius: 50%;  border: 1px solid #28a745;"src="${(f.avatar_user != null and f.avatar_user.length() > 0) ? f.avatar_user : "./images/user.png"}" alt="alt"/>
                                </div>
                            </div>

                            <div class="col-sm-10">

                                <div class="card marketing_feedback_margin marketing_feedbac_displayinline" style="margin-bottom: 20px;">
                                    <div class="card-header">
                                        <b style="color:#8B008B;">${f.fullName}</b>
                                    </div>
                                    <div class="card-body">
                                        <c:forEach var="i" begin="0" end="4">
                                            <c:if test="${(f.rated_star - i) >= 1}">
                                                <div class="reviews-rating__star is-active"></div>                                               
                                            </c:if>
                                            <c:if test="${(f.rated_star - i) < 1 && (f.rated_star - i) > 0}">
                                                <div class="reviews-rating__star is-active is-half"></div> 
                                            </c:if>
                                            <c:if test="${(f.rated_star - i) <= 0}">
                                                <div class="reviews-rating__star"></div> 
                                            </c:if>
                                        </c:forEach>
                                        <br>
                                        <h6 class="marketing_feedback_margin ">${f.feedback_content}
                                            <c:if test="${f.user_id == sessionScope.user.userId}">
                                                <a href="delete-feedback?fback_id=${f.fback_id}" class="float-right btn btn-outline-danger">Xóa</a>
                                            </c:if>
                                        </h6>
                                        <c:if test="${f.feedback_image != null and f.feedback_image.length() != 0}">
                                            <h6 class="marketing_feedback_margin">
                                                <img style="height: 100px; width: 100px" src="${f.feedback_image}">
                                            </h6>
                                        </c:if>
                                    </div>
                                    <div class="card-footer text-center" >
                                        <div  style="color:rgba(0,0,0,.54);
                                              font-size: .99rem;">
                                            ${f.date}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                        <!-- pagination -->
                        <nav aria-label="..." class="pagination float-right">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a <c:if test="${pageIndex!=1}">                         
                                            href="product-details?id=${product.id}&cid=${product.category_id}&index=${pageIndex-1}"
                                        </c:if> class="page-link" aria-label="Previous">
                                        <span  aria-hidden="true">«</span>
                                    </a>
                                </li>

                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${i==pageIndex ?"active" : ""}">
                                        <a class="page-link" href="product-details?id=${product.id}&cid=${product.category_id}&index=${i}">${i}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item">
                                    <a <c:if test="${pageIndex!=endPage}">
                                            href="product-details?id=${product.id}&cid=${product.category_id}&index=${pageIndex+1}"
                                        </c:if> class="page-link" aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>
        </c:if>




        <!-- feedback form -->
        <div id="review_modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Send Feedback</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form method="post" action="addfeedback" enctype="multipart/form-data" name="feedbackForm" onsubmit="return validateFeedbackContent()">
                            <input type="hidden" name="product_id" value="${product.id}"/>
                            <b>Viết bình luận:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <textarea name="feedback_content" placeholder="Viết bình luận.." style="height:200px ; width: 460px"></textarea>
                            </div>
                            <b>Ảnh phản hồi:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <input name="image" type="file" accept="image/*" class="form-control" style="border-radius: 100px;" >
                            </div>
                            <b>Số sao:</b>&nbsp;&nbsp;

                            <div class="rating">
                                <i class="fa fa-star-o" data-rating="1"></i>
                                <i class="fa fa-star-o" data-rating="2"></i>
                                <i class="fa fa-star-o" data-rating="3"></i>
                                <i class="fa fa-star-o" data-rating="4"></i>
                                <i class="fa fa-star-o" data-rating="5"></i>
                            </div>

                            <input type="hidden" name="rating" id="selected-rating">

                            <br>
                            <center>
                                <button id="submit-rating" type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">
                                    Gửi
                                </button>
                            </center>
                        </form>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>


        <!-- Related product section-->
        <hr class="marketing_feedback_margin">
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="ms-2 mb-4">Related Products</h2>
                <div  class="related-products-slider row  justify-content-center ">
                    <c:forEach items="${relatedProducts}" var="p">                     
                        <div class="card col ms-2 mb-4 " style="background-color: white;  border-radius: 10px;  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);">                            
                            <!-- Product image-->
                            <img class="card-img-top mt-1"  style="height: 200px;"src="${p.images[0].getUrl()}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body ">
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
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent ">
                                <div class="text-center"><a class="btn btn-outline-success mt-auto" href="product-details?id=${p.id}&cid=${p.category_id}">Xem chi tiết</a></div>
                            </div>                        
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>


        <!-- Footer-->
        <%@include file="../component/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->

        <script>
                            const myInput = document.getElementById("my-input");
                            function stepper(btn) {
                                let id = btn.getAttribute("id");
                                let min = myInput.getAttribute("min");
                                let max = myInput.getAttribute("max");
                                let step = myInput.getAttribute("step");
                                let val = myInput.getAttribute("value");
                                let calcStep = (id === "increment") ? (step * 1) : (step * -1);
                                let newValue = parseInt(val) + calcStep;
                                if (newValue >= min && newValue <= max) {
                                    myInput.setAttribute("value", newValue);
                                }
                            }
        </script>

        <!--        <script>
                    var img = document.getElementById("imgProduct");
        
        // Bắt sự kiện hover của chuột trên ảnh
                    img.addEventListener("mousemove", function (event) {
                        // Lấy tọa độ của chuột trên ảnh
                        var x = event.offsetX;
                        var y = event.offsetY;
        
                        // Gán tọa độ vào thuộc tính transform-origin của ảnh
                        img.style.transformOrigin = x + "px " + y + "px";
                    });
                </script>-->


        <script>
            var sliderImages = document.querySelectorAll(".carousel-item img");
            // Lặp qua từng ảnh và bắt sự kiện hover
            sliderImages.forEach(function (img) {
                img.addEventListener("mousemove", function (event) {
                    // Lấy tọa độ của chuột trên ảnh
                    var x = event.offsetX;
                    var y = event.offsetY;
                    // Gán tọa độ vào thuộc tính transform-origin của ảnh
                    img.style.transformOrigin = x + "px " + y + "px";
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.related-products-slider').slick({
                    dots: true, // Hiển thị điểm chỉ số
                    infinite: true, // Vô hạn slide
                    speed: 300, // Tốc độ chuyển đổi slide (ms)
                    slidesToShow: 3, // Hiển thị 3 sản phẩm liên quan trên mỗi slide
                    slidesToScroll: 3, // Chuyển đổi 3 sản phẩm liên quan trên mỗi lần cuộn
                    autoplay: true, // Tự động phát slide
                    autoplaySpeed: 3000 // Tốc độ chuyển đổi slide (ms)
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                // When a star is clicked
                $('.rating i').click(function () {
                    // Remove active class from all stars
                    $('.rating i').removeClass('active');
                    // Add active class to the clicked star and all previous stars
                    $(this).addClass('active');
                    $(this).prevAll().addClass('active');
                    // Update the selected rating in the UI
                    $('#selected-rating').val($(this).attr('data-rating'));
                });
            });

        </script>

        <script>
            function validateFeedbackContent() {
                const fb_content = document.forms["feedbackForm"]["feedback_content"].value.trim();
                if (fb_content.length === 0) {
                    alert("Nội dung đánh giá của bạn không được rỗng. Hãy nhập lại!");
                    return false;
                }
                return true;
            }
        </script>


        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    </body>
</html>
