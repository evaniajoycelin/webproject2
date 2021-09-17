<%@ include file = "inc/connect.jsp" %>
<% 
    String queryDelete =  String.format("DELETE FROM carts WHERE transID IS NULL");
    st.executeUpdate(queryDelete);
    response.sendRedirect("cart.jsp");
%> 