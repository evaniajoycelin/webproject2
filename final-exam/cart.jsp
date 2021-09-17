<%@ include file = "inc/connect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4.6.v -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- CSS Link -->
    <link rel="stylesheet" href="style.css">

    <title>Japan Forest</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="container-cart">
        <h3 class="title-cart">Your Order Summary</h3>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total Price</th>
              </tr>
            </thead>
            <tbody>
        <% 
            try{
                String getCart = "SELECT * FROM carts WHERE transID IS NULL";
                PreparedStatement cartStatement = con.prepareStatement(getCart);
                ResultSet resultCart = cartStatement.executeQuery();

                while(resultCart.next()){
        %> 
                <form action="cartEditProcess.jsp" method="POST">
                    <tr>
                        <th><%=resultCart.getString("cartName")%></th>
                        <td><%=resultCart.getInt("cartPrice")%></td>
                        <td><%=resultCart.getInt("cartQty")%>
                            <button type="button" class="btn-edit-qty" data-toggle="modal" data-target="#qtyModal<%=resultCart.getInt("foodID")%>">
                                <img class="img-table" src="https://image.flaticon.com/icons/png/512/1159/1159633.png" alt="">
                            </button>

                            <div class="modal fade" id="qtyModal<%=resultCart.getInt("foodID")%>" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Quantity of <%=resultCart.getString("cartName")%> </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="foodID" value="<%=resultCart.getInt("foodID")%>">
                                            <input type="hidden" name="foodPrice" value="<%=resultCart.getInt("cartPrice")%>">
                                            <label for="foodQty<%=resultCart.getInt("foodID")%></label>">Quantity: </label>
                                            <input id="foodQty<%=resultCart.getInt("foodID")%>" name="foodQty" type="number">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn cont-cart">Edit Quantity</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td><%=resultCart.getInt("cartTotalPrice")%></td>
                    </tr>
                </form>
                 
        <%
                }

            }catch (Exception e) {
                    
            }

            String getGrandTotal = "SELECT SUM(cartTotalPrice) FROM carts WHERE transID IS NULL";
            PreparedStatement totalStatement = con.prepareStatement(getGrandTotal);
            ResultSet resultTotal = totalStatement.executeQuery();

            while(resultTotal.next()){ 
        %>
            <tr>
                <th colspan="3">Grand Total</th>
                <td><%=resultTotal.getInt(1)%></td>
            </tr> 

        <%  }  %>

            </tbody>
        </table>

        <form action="checkout.jsp" method="POST">
            <a class="btn btn-empty-cart" href="emptyCart.jsp">Empty Cart</a>
            <label class="table-number" for="">Table Number: </label>
            <input class="table-number" name="tableNumber" type="number"> 
            <button type="submit" class="btn btn-checkout" href="checkout.jsp">Process Order</i>
        </form>
        

    </div>

    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>