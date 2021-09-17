<%@ include file = "inc/connect.jsp" %>
<%@page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<% 
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    java.util.Date date = new java.util.Date();

    String _date_ = formatter.format(date);
    String _tableNumber_ = request.getParameter("tableNumber");
    int tableNumber = 0;

    if (_tableNumber_.isEmpty()){
        out.println("<script>alert('Please input table number!');window.location.href='cart.jsp'; </script>");
    }else{
        String getTrans = String.format("SELECT * FROM transactions WHERE tableNumber = '%s'", _tableNumber_);
        ResultSet resultTrans = st.executeQuery(getTrans);
        if(resultTrans.next()){
            out.println("<script>alert('Table full!');window.location.href='cart.jsp'; </script>");
        }else{
            tableNumber = Integer.parseInt(_tableNumber_);
            if(tableNumber < 0 || tableNumber > 10){
                out.println("<script>alert('Please input a valid table number!');window.location.href='cart.jsp'; </script>");
            }else{
                String queryTrans = String.format("INSERT INTO transactions (transDate, tableNumber) VALUES ('%s', '%s')", _date_, tableNumber);
                st.executeUpdate(queryTrans);

                getTrans = String.format("SELECT * FROM transactions ORDER BY transID DESC LIMIT 1");
                resultTrans = st.executeQuery(getTrans);

                if(resultTrans.next()){
                    out.println(resultTrans.getInt("transID"));
                    String queryCart = String.format("UPDATE carts SET transID='%d' WHERE transID IS NULL", resultTrans.getInt("transID"));
                    st.executeUpdate(queryCart);
                }

                try{
                    String getCart = "SELECT * FROM carts";
                    PreparedStatement cartStatement = con.prepareStatement(getCart);
                    ResultSet resultCart = cartStatement.executeQuery();
                    int foodID, stock = 0;
  
                    while(resultCart.next()){
                        foodID = resultCart.getInt("foodID");
                        String getFood = String.format("SELECT * FROM foods WHERE foodID = '%s'", foodID);
                        ResultSet rs = st.executeQuery(getFood);
                        if(rs.next()){
                            stock = rs.getInt("foodStock") - resultCart.getInt("cartQty");
                            out.println(stock);
                            String updateQty =  String.format("UPDATE foods SET foodStock = '%d' WHERE foodID = %d", stock, foodID);
                            st.executeUpdate(updateQty);
                        }
                        
                    }
                }catch(Exception e){

                }
            }
        }
    }
    
    out.println("<script>alert('Order processing...');window.location.href='cart.jsp'; </script>");
     

%>