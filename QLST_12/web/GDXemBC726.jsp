<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Xem Báo Cáo</title> 
    <link rel="icon" href="image/logo.png" type="image/x-icon">
    <style>
                body {
                   font-family: Arial, sans-serif;
                   background-color: #f5f5f5;
                   margin: 0;
                   padding: 0;
               }
               .back-button {
                   position: absolute;
                   top: 50%;
                   right: 20px;
                   transform: translateY(-50%);
                   background-color: #c50000;
                   color: white;
                   font-size: 16px;
                   padding: 10px 20px;
                   border: none;
                   border-radius: 15px;
                   cursor: pointer;
                   text-decoration: none;
               }
               .back-button:hover {
                   background-color: #b00000;
               }
               .header {
                   background-color: #c50000;
                   padding: 20px;
                   text-align: center;
                   color: white;
               }
               .header .manager-label {
                   font-size: 24px;
                   font-weight: bold;
                   border-radius: 15px;
                   background-color: #e74c3c;
                   padding: 10px 20px;
                   display: inline-block;
               }
               .content {
                   padding: 30px;
                   text-align: center;
               }
               .date-picker-container {
                   display: flex;
                   justify-content: center;
                   gap: 20px;
                   margin-bottom: 20px;
               }
               .date-picker-label {
                   display: block;
                   font-size: 16px;
                   font-weight: bold;
                   color: #333;
                   margin-bottom: 5px;
               }
               .date-picker {
                   width: 180px;
                   padding: 10px;
                   font-size: 16px;
                   border-radius: 5px;
                   border: 1px solid #ccc;
               }
               .btn-container {
                  margin-top: 100px; /* Thêm khoảng cách giữa các nút thống kê và chọn ngày */
                }
               .btn {
                   font-size: 16px;
                   color: white;
                   background-color: #c50000;
                   padding: 15px 30px;
                   margin: 10px;
                   border: none;
                   border-radius: 15px;
                   cursor: pointer;
                   text-decoration: none;
                   
               }
               .btn:hover {
                   background-color: #b00000;
               }
        </style>
</head>
<body>
    <jsp:include page="Header726.jsp"></jsp:include>

    <div class="header">
        <div class="manager-label">Quản Lý ${sessionScope.user.hoTen}</div>
        <a href="GDQL726.jsp" class="back-button">Quay lại</a>
    </div>

    <div class="content">
        <div class="date-picker-container">
            <div>
                <label class="date-picker-label" for="start-date">Chọn ngày bắt đầu</label>
                <input type="date" id="start-date" class="date-picker">
            </div>
            <div>
                <label class="date-picker-label" for="end-date">Chọn ngày kết thúc</label>
                <input type="date" id="end-date" class="date-picker">
            </div>
        </div>

        <div class="btn-container">
            <!-- Sử dụng form để gửi ngày bắt đầu và kết thúc -->
            <form action="GDTKKH726.jsp" method="get" onsubmit="return validateDates()">
                <input type="hidden" name="start-date" id="start-date-field">
                <input type="hidden" name="end-date" id="end-date-field">
                <button type="submit" class="btn">Thống kê khách hàng theo doanh thu</button>
            </form>
            <form action="GDTKKH726.jsp" method="get" onsubmit="return validateDates()">
                <input type="hidden" name="start-date" id="start-date-field">
                <input type="hidden" name="end-date" id="end-date-field">
                <button type="submit" class="btn">Thống kê mặt hàng theo doanh thu</button>
            </form>
            <form action="GDTKKH726.jsp" method="get" onsubmit="return validateDates()">
                <input type="hidden" name="start-date" id="start-date-field">
                <input type="hidden" name="end-date" id="end-date-field">
                <button type="submit" class="btn">Thống kê nhà cung cấp theo số lần nhập</button>
            </form>
        </div>
    </div>

    <script>
        function validateDates() {
            // Lấy giá trị ngày bắt đầu và ngày kết thúc
            const startDate = document.getElementById("start-date").value;
            const endDate = document.getElementById("end-date").value;

            // Kiểm tra nếu người dùng chưa chọn ngày
            if (!startDate || !endDate) {
                alert("Vui lòng chọn ngày bắt đầu và ngày kết thúc.");
                return false;
            }

            // Kiểm tra nếu ngày kết thúc nhỏ hơn ngày bắt đầu
            if (new Date(endDate) < new Date(startDate)) {
                alert("Ngày kết thúc không thể nhỏ hơn ngày bắt đầu.");
                return false;
            }

            // Đặt giá trị của các trường ẩn
            document.getElementById("start-date-field").value = startDate;
            document.getElementById("end-date-field").value = endDate;

            return true; // Cho phép submit form nếu các điều kiện hợp lệ
        }
    </script>
</body>
</html>
