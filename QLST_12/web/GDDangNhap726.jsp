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
            .form-signin h1 {
                color: rgb(195, 0, 0); /* Màu đỏ đậm */
                font-size: 2rem;
                font-weight: bold;
            }
            .text-danger-custom {
                color: rgb(195, 0, 0) !important; /* Màu đỏ đậm */
                font-size: 1.25rem;
                font-weight: bold;
            }
            .btn-custom-red {
                background-color: rgb(195, 0, 0); /* Màu đỏ đậm */
                border-color: rgb(195, 0, 0); /* Màu đỏ đậm */
                color: #ffffff;
                font-weight: bold;
                font-size: 1rem;
            }
            .btn-custom-red:hover {
                background-color: rgb(160, 0, 0); /* Màu đỏ đậm hơn khi hover */
                border-color: rgb(140, 0, 0); /* Màu đỏ đậm hơn khi hover */
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
                <button class="btn btn-primary btn-block" type="button" onclick="window.location.href='GDDangky726.jsp'">
                                              <i class="fas fa-user-plus"></i> Đăng ký
                </button>

                <a href="Trangchu726.jsp"><i class="fas fa-angle-left"></i> Trở về trang chủ</a>
            </form>

           
            
        </div>

        <!-- Các thư viện JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
        
        
      
    </body>
</html>
