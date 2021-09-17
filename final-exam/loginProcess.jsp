<%@include file="inc/connect.jsp" %>
<%
    String username = request.getParameter("userName");
    String password = request.getParameter("userPassword"); 

    String getQuery = String.format("SELECT * FROM users WHERE userName = '%s' AND userPassword = '%s'", username, password);
    ResultSet resultGet = st.executeQuery(getQuery);

    if(resultGet.next()){  
        response.sendRedirect("home.jsp");
    }else{
        out.println("<script>alert('Data not found, please contact system administrator.');window.location.href='index.jsp'; </script>");
    }
%>