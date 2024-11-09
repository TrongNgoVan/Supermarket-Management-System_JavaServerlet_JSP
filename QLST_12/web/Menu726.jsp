<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!--begin of menu-->

<nav class="navbar navbar-expand-md navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="Trangchu726.jsp"><i class="fa fa-home mr-2"></i>Siêu Thị PTIT</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                
                <c:if test="${sessionScope.user != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.user.hoTen}</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link" href="Dangxuat726.jsp">Đăng xuất</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="GDDangNhap726.jsp">Đăng nhập</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GDDangky726.jsp">Đăng ký</a>
                    </li>
                </c:if>

            </ul>
        </div>  
    </div>
</nav>



<style>
    .navbar-brand {
        font-size: 24px; /* Kích thước chữ cho "Siêu Thị PTIT" */
        font-weight: bold; /* Làm chữ đậm */
    }

    .navbar-brand i {
        font-size: 28px; /* Kích thước cho biểu tượng */
        margin-right: 5px; /* Khoảng cách giữa biểu tượng và văn bản */
    }

    /* Tùy chỉnh màu đỏ đậm cho menu */
    .navbar-custom {
        background-color: rgb(175, 0, 0); /* Màu đỏ đậm */
    }

    .navbar-nav .nav-link {
        font-size: 18px; /* Kích thước chữ */
        color: white !important; /* Màu chữ trắng */
        font-weight: bold; /* Làm chữ đậm */
    }

    .navbar-nav .nav-link:hover {
        color: blue !important; /* Màu chữ khi di chuột là màu xanh dương */
    }
</style>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">HỆ THỐNG QUẢN LÝ SIÊU THỊ</h1>
        <h3 class="jumbotron-heading">TẬP ĐOÀN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - PTIT</h3>
        <h2 class="jumbotron-heading red-text">Posts and Telecommunications Institute of Technology</h2>
    </div>
    <div class="map-container">
        <div class="logo-container">
            <img src="image/logo.png" alt="Logo" width="180" height="180"> <!-- Giảm kích thước hình ảnh -->
        </div>
        <div class="map-description">
            <p>Hệ thống quản lý Siêu thị được xây dựng trên ý tưởng Bài tập lớn môn Phân tích thiết kế hệ thống thông tin do Giảng viên, TS. Đỗ Thị Bích Ngọc giảng dạy!</p>
        </div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.3016784838646!2d105.78789859999999!3d20.980540899999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acce762c2bb9%3A0xbb64e14683ccd786!2zSOG7jWMgVmnhu4duIENOIELGsHUgQ2jDrW5oIFZp4buFbiBUaMO0bmcgLSBIw6AgxJDDtG5n!5e0!3m2!1svi!2s!4v1701147969190!5m2!1svi!2s" width="700" height="400" style="border:10;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> <!-- Giảm kích thước iframe -->
    </div>
</section>

<style>
    .jumbotron {
        background-image: url('image/ptitnen.jpg');
        background-size: cover;
        background-position: center;
        color: #000000;  
    }

    .map-container {
        position: relative;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin: 20px 0;  
    }

    .logo-container {
        margin-right: 20px;
    }

    .logo-container img {
        max-width: 100%;
        height: auto;
        border-radius: 5px; /* Optional: Add border-radius for rounded corners */
    }

    .map-description {
        max-width: 400px; /* Adjust the width as needed */
        padding: 30px;
        background-color: #fff; /* Set the background color */
        border: 10px solid #ddd; /* Set the border color */
        border-radius: 20px; /* Optional: Add border-radius for rounded corners */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Optional: Add a box shadow */
    }

    iframe {
        border: 5px solid #ddd; /* Giảm độ dày của viền iframe */
    }

    .red-text {
        color: rgb(195, 0, 0); /* Màu đỏ đậm */
        /* Đặt màu chữ thành đỏ */
        font-weight: bold; /* Đặt chữ thành đậm */
    }
</style>

<!--end of menu-->
