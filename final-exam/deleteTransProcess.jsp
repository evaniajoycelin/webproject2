<%@include file="inc/connect.jsp" %>
<% 
    String transID = request.getParameter("transID");
    String queryDelete = String.format("DELETE FROM transactions WHERE transID = %s", transID);
    st.executeUpdate(queryDelete);
    out.println("<script>alert('Transactions Delete Success!');window.location.href='transactionReport.jsp'; </script>");
%>