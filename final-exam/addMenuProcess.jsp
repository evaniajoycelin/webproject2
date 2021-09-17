<%@include file="inc/connect.jsp" %>
<% 
    String foodName = request.getParameter("foodNameA");
    String foodPrice = request.getParameter("foodPriceA");
    String foodStock = request.getParameter("foodStockA");
    String foodImg = request.getParameter("foodImgA");


    if(foodName.isEmpty()){
        out.println("<script>alert('Please input item name!');window.location.href='addMenu.jsp'; </script>"); 
    }else if(foodPrice.isEmpty()){
        out.println("<script>alert('Please input item price!');window.location.href='addMenu.jsp'; </script>");
    }else if(foodStock.isEmpty()){
        out.println("<script>alert('Please input item stock!');window.location.href='addMenu.jsp'; </script>");
    }else if(foodImg.isEmpty()){
        out.println("<script>alert('Please input image url!');window.location.href='addMenu.jsp'; </script>");
    }else{
        String queryInsert =  String.format("INSERT INTO foods (foodName, foodPrice, foodStock, foodImg) VALUES('%s',%s,'%s','%s')", foodName, foodPrice, foodStock, foodImg);
        st.executeUpdate(queryInsert);

        response.sendRedirect("editMenu.jsp");
    }
%>