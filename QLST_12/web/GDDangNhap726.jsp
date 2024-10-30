<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="image/logo.png" type="image/x-icon">
        <title>Form Đăng nhập</title>
        
        <style>
            /* Đổi màu tiêu đề và các nút */
            .form-signin h1, .form-signup h1 {
                color: #dc3545; /* Màu đỏ */
                font-size: 2rem;
                font-weight: bold;
            }
            .text-danger-custom {
                color: #dc3545 !important;
                font-size: 1.25rem;
                font-weight: bold;
            }
            .btn-custom-red {
                background-color: #dc3545;
                border-color: #dc3545;
                color: #ffffff;
                font-weight: bold;
                font-size: 1rem;
            }
            .btn-custom-red:hover {
                background-color: #c82333;
                border-color: #bd2130;
            }
            /* Căn giữa nội dung */
            #logreg-forms {
                max-width: 500px;
                margin: auto;
            }
        </style>
    </head>

    <body>
        <div id="logreg-forms">
            <!-- Form đăng nhập -->
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal text-danger-custom" style="text-align: center">Đăng nhập</h1>
                <p class="text-danger">${mess}</p>
                <input name="user" type="text" id="inputEmail" class="form-control" placeholder="Tên đăng nhập" required autofocus>
                <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required>
                
                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Ghi nhớ đăng nhập</label>
                </div>

                <button class="btn btn-custom-red btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                <hr>
                <button class="btn btn-primary  btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng ký</button>
                <a class="navbar-brand" href="Trangchu726.jsp">Trở về trang chủ</a>
            </form>

            <!-- Form đăng ký -->
            <form action="signup" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal text-danger-custom" style="text-align: center">Đăng ký</h1>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="Tên đăng nhập" required autofocus>
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" required autofocus>
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhập lại mật khẩu" required autofocus>
                
                <button class="btn btn-custom-red btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Quay lại</a>
            </form>
        </div>

        <!-- Các thư viện JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
        
        <!-- Script để chuyển đổi form -->
        <script>
            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block hoặc none
                $('#logreg-forms .form-signup').toggle(); // display:block hoặc none
            }
            $(document).ready(() => {
                $('#btn-signup').click(toggleSignUp);
                $('#cancel_signup').click(toggleSignUp);
            });
        </script>
    </body>
</html>
