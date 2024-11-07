<%-- 
    Document   : Trọng, Ngọ Văn
    Created on : Nov 4, 2024, 6:55:16 PM
    Author     : Ngọ Văn Trọng
--%>


<%@page import="Entity726.HoaDonMua726"%>
<%@page import="DAO726.HoadonMua_DAO726"%>
<!DOCTYPE html>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%@ page import="Entity726.TKKH726" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thống Kê Khách Hàng</title>    
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
       .report-container {
           text-align: center;
           margin: 20px auto;
           max-width: 600px;
       }
       .report-label {
           background-color: #c50000;
           color: white;
           padding: 15px;
           border-radius: 10px;
           margin-bottom: 10px;
           font-size: 18px;
       }
       .report-title {
           font-size: 24px;
           font-weight: bold;
       }
       .date-container {
           display: flex;
           justify-content: space-between;
           gap: 20px;
       }
       .date-label {
           flex: 1;
       }
       .statistics-container {
           margin-top: 20px;
           padding: 10px;
           background-color: #ffffff;
           border-radius: 10px;
           box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
       }
       .statistics-table {
           width: 100%;
           border-collapse: collapse;
       }
       .statistics-table th, .statistics-table td {
           padding: 8px;
           text-align: left;
           border-bottom: 1px solid #ddd;
       }
       .statistics-table th {
           background-color: #c50000;
           color: white;
       }
    </style>
</head>

<body>
    <jsp:include page="Header726.jsp"></jsp:include>
    <div class="header">
        <div class="manager-label">Quản Lý ${sessionScope.user.hoTen}</div>
        <a href="GDXemBC726.jsp" class="back-button">Quay lại</a>
    </div>
    <div class="report-container">
        <%
            // Lấy danh sách hóa đơn dựa trên ID khách hàng từ sessionScope.ChonKH
            TKKH726 selectedKH = (TKKH726) session.getAttribute("ChonKH");
            HoadonMua_DAO726 hdmdao = new HoadonMua_DAO726();
            List<HoaDonMua726> dshd = hdmdao.getHDM(selectedKH.getId(), selectedKH.getNgayBatDau(), selectedKH.getNgayKetThuc());
        %>
        <!-- Tiêu đề báo cáo -->
        <div class="report-label report-title">Danh sách các hóa đơn</div>
        
        <div class="date-container">
            <div class="report-label date-label">Ngày bắt đầu: <%= selectedKH.getNgayBatDau() %></div>
            <div class="report-label date-label">Ngày kết thúc: <%= selectedKH.getNgayKetThuc() %></div>
        </div>
        <div class="report-label report-title">Khách hàng: <%= selectedKH.getHoTen() %></div>
        <div class="report-label report-title"> Mã Khách Hàng: <%= selectedKH.getMaKH() %> </div>

        <!-- Hiển thị danh sách hóa đơn -->
        <div class="statistics-container">
            <table class="statistics-table">
                <thead>
                    <tr>
                        <th>Mã Hóa Đơn</th>
                        <th>Ngày Mua</th>
                        <th>Trạng Thái</th>
                        <th>Tổng Tiền</th>
                        <th>ID Khách Hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Duyệt qua danh sách hóa đơn và hiển thị
                        if (dshd != null && !dshd.isEmpty()) {
                            for (HoaDonMua726 hdm : dshd) {
                    %>
                    <tr>
                        <td><%= hdm.getId() %></td>
                        <td><%= hdm.getNgayMua() %></td>
                        <td><%= hdm.getTrangThai() %></td>
                        <td><%= hdm.getTongTien() %></td>
                        <td><%= hdm.getMaKH() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">Không có hóa đơn cho khách hàng này trong khoảng thời gian đã chọn.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
  