<%@include file="inc/connect.jsp" %>
<%
    String foodID = request.getParameter("foodID");
    String foodQty = request.getParameter("foodQty");
    String foodPrice = request.getParameter("foodPrice");
    int total = Integer.parseInt(foodQty)*Integer.parseInt(foodPrice);

    String getFood = String.format("SELECT * FROM foods WHERE foodID = '%s'", foodID);
    ResultSet resultFood = st.executeQuery(getFood);

    if(resultFood.next()){
        if(Integer.parseInt(foodQty) > resultFood.getInt("foodStock")){
            int stock = resultFood.getInt("foodStock");
            out.println("<script>alert('Stock not enough!');window.location.href='cart.jsp'; </script>");
        }else{
            String updateQty =  String.format("UPDATE carts SET cartQty = '%s', cartTotalPrice = '%d' WHERE foodID = %s", foodQty, total, foodID);
            st.executeUpdate(updateQty);
            response.sendRedirect("cart.jsp");
        }
    }
    
%>