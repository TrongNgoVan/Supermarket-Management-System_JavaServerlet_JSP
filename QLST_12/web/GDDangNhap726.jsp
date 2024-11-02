<%@page import="Entity726.NVQL_726"%>
<%@page import="DAO726.NVQL_DAO726"%>
<%@page import="Entity726.KhachHang_726"%>
<%@page import="DAO726.KH_DAO726"%>
<%@page import="DAO726.DAO726"%>
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

<%
    String message = "";
    String error = "";

    if (request.getParameter("user") != null) {
        String userId = request.getParameter("user");
        String password = request.getParameter("pass");
        String role = request.getParameter("role");

        // Thực hiện kiểm tra đăng nhập
        try {
            if(role == "Khách hàng"){
                KH_DAO726 khDao = new KH_DAO726(); // Khởi tạo đối tượng DAO
                KhachHang_726 khachHang = khDao.checkLogin(userId, password); // Kiểm tra đăng nhập và lấy đối tượng KhachHang_726

                if (khachHang != null) {
                    // Đăng nhập thành công
                    message = "Đăng nhập thành công!";

                    session.setAttribute("user", khachHang); // Lưu đối tượng KhachHang_726 vào session

                    response.sendRedirect("Trangchu726.jsp"); // Chuyển hướng đến trang chính
                    return; // Kết thúc trang để tránh hiển thị thêm nội dung
                } else {
                    // Đăng nhập thất bại
                    error = "Mã khách hàng hoặc mật khẩu không đúng.";
                }
          }else{
                NVQL_DAO726 qldao = new NVQL_DAO726(); // Khởi tạo đối tượng DAO
                NVQL_726 ql = qldao.checkLogin(userId, password); // Kiểm tra đăng nhập và lấy đối tượng KhachHang_726

                if (ql != null) {
                    // Đăng nhập thành công
                    message = "Đăng nhập thành công!";

                    session.setAttribute("user", ql); // Lưu đối tượng KhachHang_726 vào session

                    response.sendRedirect("GDQL726.jsp"); // Chuyển hướng đến trang chính
                    return; // Kết thúc trang để tránh hiển thị thêm nội dung
                } else {
                    // Đăng nhập thất bại
                    error = "Mã khách hàng hoặc mật khẩu không đúng.";
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            error = "Đã xảy ra lỗi khi kết nối tới cơ sở dữ liệu.";
        }
    }
%>

<body>
    <div id="logreg-forms">
        <!-- Form đăng nhập -->
        <form class="form-signin" action="" method="post">
            <h1 class="h3 mb-3 font-weight-normal text-danger-custom" style="text-align: center">Đăng nhập</h1>
                     <% if (!error.isEmpty()) { %>
                     <div class="alert alert-danger" role="alert"><%= error %></div>
                     <% } else if (!message.isEmpty()) { %> <div class="alert alert-success" role="alert"><%= message %></div><%   } %>

            <input name="user" type="text" id="inputEmail" class="form-control" placeholder="Mã khách hàng hoặc Mã nhân viên" required autofocus>
            <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required>
            
            <div class="form-group form-check">
                <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Ghi nhớ đăng nhập</label>
            </div>

            <button class="btn btn-custom-red btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
            <div class="form-group">
                <label for="loginRole">Đăng nhập với tư cách:</label>
                <select name="role" id="loginRole" class="form-control">
                    <option value="khachhang">Khách hàng</option>
                    <option value="nhanvien">Nhân viên</option>
                </select>
            </div>
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
