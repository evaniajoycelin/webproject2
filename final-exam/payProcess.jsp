<%@include file="inc/connect.jsp" %>
<% 
    String transID = request.getParameter("transID");

    String updateTable =  String.format("UPDATE transactions SET tableNumber = NULL WHERE transID = %s", transID);
    st.executeUpdate(updateTable);

    out.println("<script>alert('Transaction Paid!');window.location.href='home.jsp'; </script>");

%>