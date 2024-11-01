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
        <title>Form Đăng ký</title>
        <style>
            .form-signup h1 {
                color: rgb(195, 0, 0); /* Màu đỏ đậm */
                font-size: 2rem;
                font-weight: bold;
                 margin-bottom: 15px; 
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
                margin-top: 20px; /* Khoảng cách phía trên nút Đăng ký */
            }
            .btn-custom-red:hover {
                background-color: rgb(160, 0, 0); /* Màu đỏ đậm hơn khi hover */
                border-color: rgb(140, 0, 0); /* Màu đỏ đậm hơn khi hover */
            }
            #register-form {
                max-width: 450px;
                margin: auto;
                background-color:#e9ecef;  /* màu nền sáng */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <div id="register-form">
            <form action="signup" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal text-danger-custom" style="text-align: center">Đăng ký</h1>
                <input name="user" type="text" class="form-control" placeholder="Tên đăng nhập" required autofocus>
                <input name="pass" type="password" class="form-control" placeholder="Mật khẩu" required autofocus>
                <input name="repass" type="password" class="form-control" placeholder="Nhập lại mật khẩu" required autofocus>
                
                <button class="btn btn-custom-red btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                <a href="GDDangNhap726.jsp"><i class="fas fa-angle-left"></i> Quay lại đăng nhập</a>
              
            </form>
               <a href="Trangchu726.jsp"><i class="fas fa-angle-left"></i> Trở về trang chủ</a>
        </div>
    </body>
</html>

