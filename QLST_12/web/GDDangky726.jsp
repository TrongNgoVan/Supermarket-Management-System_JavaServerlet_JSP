<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="DAO726.KH_DAO726"%>
<%@page import="Entity726.KhachHang_726"%>
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
            color: rgb(195, 0, 0);
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .text-danger-custom {
            color: rgb(195, 0, 0) !important;
            font-size: 1.25rem;
            font-weight: bold;
        }
        .btn-custom-red {
            background-color: rgb(195, 0, 0);
            border-color: rgb(195, 0, 0);
            color: #ffffff;
            font-weight: bold;
            font-size: 1rem;
            margin-top: 20px;
        }
        .btn-custom-red:hover {
            background-color: rgb(160, 0, 0);
            border-color: rgb(140, 0, 0);
        }
        #register-form {
            max-width: 450px;
            margin: auto;
            background-color:#e9ecef;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .message {
            text-align: center;
            font-size: 1.1rem;
            margin-top: 15px;
            color: green;
        }
        .error {
            color: red;
            text-align: center;
            font-size: 1.1rem;
            margin-top: 10px;
        }
    </style>
</head>

<%
    String message = "";
    String error = "";

    if (request.getParameter("username") != null) {
        String username = request.getParameter("username");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String password = request.getParameter("pass");
        String repass = request.getParameter("repass");

        System.out.println("Username: " + username);
        System.out.println("Số điện thoại: " + sdt);
        System.out.println("Email: " + email);
        System.out.println("Ngày sinh: " + dob);
        System.out.println("Mật khẩu: " + password);
        System.out.println("Nhập lại mật khẩu: " + repass);

        if (username.isEmpty() || sdt.isEmpty() || email.isEmpty() || dob.isEmpty() || password.isEmpty() || repass.isEmpty()) {
            error = "Vui lòng điền đầy đủ tất cả các trường.";
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            error = "Email không hợp lệ!";
        } else if (!sdt.matches("^\\d{10,11}$")) {
            error = "Số điện thoại không hợp lệ! Vui lòng nhập từ 10 đến 11 chữ số.";
        } else if (!password.equals(repass)) {
            error = "Mật khẩu nhập lại không khớp!";
        } else {
            KhachHang_726 khachHang = new KhachHang_726();
            khachHang.setHoTen(username);
            khachHang.setSdt(sdt);
            khachHang.setEmail(email);
            try {
                SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
                java.util.Date parsedDate = inputFormat.parse(dob);
                Date sqlDate = new Date(parsedDate.getTime());
                khachHang.setNgaySinh(sqlDate);
            } catch (ParseException e) {
                e.printStackTrace();
                error = "Ngày sinh không hợp lệ!";
                return;
            }
            khachHang.setPassword(password);

            KH_DAO726 khDao = new KH_DAO726();
            boolean isRegistered = khDao.addKH(khachHang);
            System.out.println("Đăng ký thành công: " + isRegistered);
            message = isRegistered ? "Đăng ký thành công!" : "Đăng ký thất bại. Vui lòng thử lại!";
        }
    }
%>

<body>
<div id="register-form">
    <form action="" method="post" class="form-signup">
        <h1 class="h3 mb-3 font-weight-normal text-danger-custom" style="text-align: center">Đăng ký</h1>
        
        <% if (!error.isEmpty()) { %>
            <div class="error"><%= error %></div>
        <% } else if (!message.isEmpty()) { %>
            <div class="message"><%= message %></div>
        <% } %>
        
        <input name="username" type="text" class="form-control" placeholder="Họ tên" required autofocus>
        <input name="sdt" type="text" class="form-control" placeholder="Số điện thoại" required>
        <input name="email" type="text" class="form-control" placeholder="Email" required>
        <input name="dob" type="text" class="form-control" placeholder="Ngày sinh" required>
        <input name="pass" type="password" class="form-control" placeholder="Mật khẩu" required>
        <input name="repass" type="password" class="form-control" placeholder="Nhập lại mật khẩu" required>

        <button class="btn btn-custom-red btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>

        <a href="GDDangNhap726.jsp"><i class="fas fa-angle-left"></i> Quay lại đăng nhập</a>
    </form>
    <a href="Trangchu726.jsp"><i class="fas fa-angle-left"></i> Trở về trang chủ</a>
</div>
</body>
</html>
