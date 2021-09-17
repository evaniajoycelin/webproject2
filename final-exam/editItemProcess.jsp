<%@include file="inc/connect.jsp" %>
<% 
    String foodID = request.getParameter("foodID");
    String foodName = request.getParameter("foodNameE");
    String foodStock = request.getParameter("foodStockE");
    String foodPrice = request.getParameter("foodPriceE");
    String foodImg = request.getParameter("foodImgE");

    out.println(foodStock);

    String updateFood = String.format("UPDATE foods SET foodName = '%s', foodStock = '%s', foodPrice = '%s', foodImg = '%s' WHERE foodID = '%s'", foodName, foodStock, foodPrice, foodImg, foodID);
    st.executeUpdate(updateFood);
    response.sendRedirect("editMenu.jsp");

%>