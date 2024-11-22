<%-- 
    Document   : Trọng, Ngọ Văn
    Created on : Nov 22, 2024, 5:29:36 PM
    Author     : Ngọ Văn Trọng
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page import="java.util.List" %>
<%@ page import="Entity726.TKKH726" %>
<%
    // Lấy ID Khách Hàng từ form
    int  id = Integer.parseInt(request.getParameter("id"));

    // Lấy danh sách từ session
    List<TKKH726> dstk = (List<TKKH726>) session.getAttribute("dstk");

    // Kiểm tra danh sách và ID
    if (dstk != null ) {
        TKKH726 selectedKH = null;

        // Tìm khách hàng có ID khớp
        for (TKKH726 kh : dstk) {
            if (kh.getId() == id) {
                selectedKH = kh;
                break;
            }
        }

        // Lưu khách hàng được chọn vào session
        if (selectedKH != null) {
            session.setAttribute("selectedKH", selectedKH);

            // Chuyển hướng tới GDListHD726.jsp
            response.sendRedirect("GDListHD726.jsp");
        } else {
            out.println("Không tìm thấy khách hàng có ID tương ứng.");
        }
    } else {
        out.println("Danh sách khách hàng hoặc ID không hợp lệ.");
    }
%>


