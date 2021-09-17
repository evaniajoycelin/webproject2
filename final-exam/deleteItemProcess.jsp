<%@include file="inc/connect.jsp" %>
<% 
    String foodID = request.getParameter("foodID");

    String queryDelete = String.format("DELETE FROM foods WHERE foodID = %s", foodID);
    st.executeUpdate(queryDelete);
    out.println("<script>alert('Item Delete Success!');window.location.href='editMenu.jsp'; </script>");
%>