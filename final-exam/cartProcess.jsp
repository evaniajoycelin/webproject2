<%@include file="inc/connect.jsp" %>
<%
    String foodID = request.getParameter("foodID");
    String foodQty = request.getParameter("foodQty");

    if(foodQty.length() == 0){
            out.println("<script>alert('Please input quantity!');window.location.href='home.jsp'; </script>");
    }else{
        String getFood = String.format("SELECT * FROM foods WHERE foodID = '%s'", foodID);
        ResultSet resultFood = st.executeQuery(getFood);

        if(resultFood.next()){
            if(Integer.parseInt(foodQty) > resultFood.getInt("foodStock")){
                int stock = resultFood.getInt("foodStock");
                out.println("<script>alert('Stock not enough!');window.location.href='home.jsp'; </script>");
            }else{
                String foodName = resultFood.getString("foodName");
                int foodPrice = resultFood.getInt("foodPrice");
                int totalPrice = foodPrice * Integer.parseInt(foodQty);

                String insertCart = String.format("INSERT INTO carts (transID, foodID, cartName, cartPrice, cartQty, cartTotalPrice) VALUES (NULL, '%s', '%s', '%d', '%s', '%d')", foodID, foodName, foodPrice, foodQty, totalPrice);
                st.executeUpdate(insertCart);
                response.sendRedirect("cart.jsp");
            }
        }
    }
    
%>