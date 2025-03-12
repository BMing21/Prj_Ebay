<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Login</title>
        <link rel="shortcut icon" href="./images/lg.jpg">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;0,700;1,400&amp;display=swap">
        <link rel="stylesheet" href="./assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="./assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
    </head>
    <body>
        <!-- Notification User -->
        <c:if test="${sessionScope.notification !=null}">
            <div class="alert ${sessionScope.typeNoti} alert-dismissible fade show " role="alert" style=" position: fixed; z-index: 15 ; margin-left: 80%; margin-top: 5%;">
                <strong>${sessionScope.notification}</strong>
            </div>
            <% 
             session.removeAttribute("notification");
             session.removeAttribute("typeNoti");
            %>
        </c:if>

        <div class="main-wrapper login-body">
            <div class="login-wrapper">
                <div class="container">
                    <div class="loginbox">
                        <div class="login-left">
                            <!--<img class="img-fluid" src="assets/img/login.jpg" alt="Logo">-->
                        </div>
                        <div class="login-right">
                            <div class="login-right-wrap">
                                <h1>Login</h1>
                                <p class="account-subtitle">Access to PRJ_Ebay system</p>
                                <form action="login" method="post">
                                    <div class="form-group">
                                        <input name="email" class="form-control" type="text" placeholder="email">
                                    </div>
                                    <div class="form-group">
                                        <input name="password" class="form-control" type="password" placeholder="password">
                                    </div>                                    
                                    <div class="form-group">
                                        <button class="btn btn-primary btn-block" type="submit">Login</button>
                                    </div>
                                </form>
                                <!--                                <div class="text-center forgotpass"><a href="forgot-password.html">Forgot Password?</a></div>
                                                                <a class="edit-link" data-toggle="modal" href="#register_personal_">
                                                                                            <i class="far fa-edit mr-1"></i>Register</a>-->
                                <div class="text-center forgotpass">
                                    <a href="#register_personal_" data-toggle="modal">Register</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="register_personal_" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Register New User</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="registerPersonalDetailsForm" enctype="multipart/form-data" action="signup" method="post" onsubmit="return validateForm();">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5" width="100px" height="100px" src="~/../images/user.png">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="avatar">Change Avatar</label>
                                        <input type="file" class="form-control" accept="image/*" id="avatar" name="avatar">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fullName">Full Name</label>
                                        <input required type="text" class="form-control" id="fullName" name="fullName">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input required type="email" class="form-control" id="email" name="email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input required type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input required type="text" class="form-control" id="address" name="address">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Password</label>
                                        <input required type="password" class="form-control" id="password" name="password">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address">Re Password</label>
                                        <input required type="password" class="form-control" id="rePassword" name="rePassword">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Signup</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>

        <script>
            if (document.querySelector('.alert')) {
                document.querySelectorAll('.alert').forEach(function ($el) {
                    setTimeout(() => {
                        $el.classList.remove('show');
                    }, 3000);
                });
            }
            function validateForm() {
                var newPassword = document.getElementById("password").value;
                var confirmPassword = document.getElementById("rePassword").value;
                if (newPassword !== confirmPassword) {
                    alert("password and re password do not match");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>