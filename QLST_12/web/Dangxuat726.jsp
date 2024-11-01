<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>




<%
    // Kiểm tra xem có hành động đăng xuất không
  
        session.removeAttribute("user");
        response.sendRedirect("Trangchu726.jsp"); // Chuyển hướng đến trang chính
     
  
%>