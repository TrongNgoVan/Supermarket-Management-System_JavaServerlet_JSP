    <%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
    <%@ page import="DAO726.TKKH_DAO726" %>
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
            <!-- Tiêu đề báo cáo -->
            <div class="report-label report-title">Thống Kê Khách Hàng Theo Doanh Thu</div>

            <div class="date-container">
                <div class="report-label date-label">Ngày bắt đầu: ${param['start-date']}</div>
                <div class="report-label date-label">Ngày kết thúc: ${param['end-date']}</div>
            </div>

            <%
                // Lấy ngày bắt đầu và ngày kết thúc từ tham số
                String startDate = request.getParameter("start-date");
                String endDate = request.getParameter("end-date");

                // Khởi tạo lớp DAO và lấy thống kê khách hàng
                TKKH_DAO726 tkkhdao = new TKKH_DAO726();


                List<TKKH726> dstk = tkkhdao.getTKKH(startDate, endDate);
            %>

            <!-- Hiển thị thống kê khách hàng -->
            <div class="statistics-container">
                <table class="statistics-table">
                    <thead>
                        <tr>
                            <th> STT </th>
                            <th>ID Khách Hàng</th>
                            <th>Mã Khách Hàng</th>
                            <th>Tên Khách Hàng</th>
                            <th>Tổng Doanh Thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Kiểm tra và hiển thị thống kê
                            if (dstk != null && ! dstk.isEmpty()) {
                                for ( int i = 0 ; i<= dstk.size()-1; i++) {
                        %>
                        <tr onclick="<% 
                                session.setAttribute("ChonKH", dstk.get(i)); 
                                %>window.location.href='GDListHD726.jsp'" 
                                            style="cursor:pointer;">
                            <td><%= i + 1 %></td>
                            <td><%= dstk.get(i).getId() %></td>
                                <td><%= dstk.get(i).getMaKH() %></td>
                                <td><%= dstk.get(i).getHoTen() %></td>
                                <td><%= dstk.get(i).getTongDT() %></td>
                        </tr>

                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="3">Không có dữ liệu thống kê cho khoảng thời gian này.</td>
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
