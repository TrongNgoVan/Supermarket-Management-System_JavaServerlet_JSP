<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Phần header đặt trên menu -->
<div class="container" id="header">
    <div class="pull-left">
        <a href="Trangchu726.jsp">
            <img src="image/l/logo1.png" alt="Logo" id="logo">
        </a>
    </div>
    <div class="pull-right user-info">
        <img src="image/l/avatar.jpg" id="icon_acount" alt="Account Icon" style="border-radius: 50%; width: 50px; height: 50px; object-fit: cover;">
        <div class="account-details">
            <b><a class="my_acount_button link" href="https://www.facebook.com/ngovantrong1308?locale=vi_VN">Ngọ Văn Trọng</a></b>
            <br>
            <a class="my_acount_button link" id="logOut_button" href="https://github.com/TrongNgoVan">B21DCCN726</a>
        </div>
    </div>
</div>

<style>
    * {
        
        margin: 0;
        padding: 0;
    }

    .link {
        color: black;
    }
    .link:hover {
        text-decoration: none;
        color: blue;
    }

    #header {
        display: flex;                /* Sử dụng flexbox để bố trí */
        justify-content: space-between; /* Đưa logo và thông tin người dùng về hai bên */
        align-items: center;         /* Căn giữa theo chiều dọc */
        padding: 10px 20px;         /* Thêm padding cho phần header */
        background-color: #fff;     /* Nền trắng cho header */
/*        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);  Thêm bóng đổ cho header */
    }

    #logo {
        height: 50px;               /* Kích thước logo */
    }

    #icon_acount {
        height: 50px;
        width: 50px; 
        margin-right: 10px; /* Khoảng cách giữa avatar và tên */
    }

    .user-info {
        display: flex;             /* Bố trí thông tin người dùng bên cạnh nhau */
        align-items: center;      /* Căn giữa theo chiều dọc */
    }

    .account-details {
        text-align: right;        /* Để thông tin nằm bên phải của avatar */
    }

    .logIn_signIn_button:hover {
        cursor: pointer;
        color: blue;
    }

    /* Nếu có cần thiết, có thể thêm kiểu dáng cho phần menu */


</style>
