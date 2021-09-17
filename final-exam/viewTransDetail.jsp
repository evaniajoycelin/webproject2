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
    <%@include file="navbar.jsp"%>
    <div class="container-cart" id="pdfContainer">
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
            String transID = request.getParameter("transID");
            try{
                String getCart = String.format("SELECT * FROM carts WHERE transID = '%s'", transID);
                PreparedStatement cartStatement = con.prepareStatement(getCart);
                ResultSet resultCart = cartStatement.executeQuery();

                while(resultCart.next()){
        %> 
                <tr>
                    <td><%=resultCart.getString("cartName")%></td>
                    <td><%=resultCart.getInt("cartPrice")%></td>
                    <td><%=resultCart.getInt("cartQty")%>
                    <td><%=resultCart.getInt("cartTotalPrice")%></td>
                </tr>  
        <%
                }

            }catch (Exception e) {
                    
            }

            String getGrandTotal = String.format("SELECT SUM(cartTotalPrice) FROM carts WHERE transID = '%s'", transID);
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

        <a id="generatePDF" class="btn btn-pdf">Generate PDF</a>
        <a id="generatePDF" class="btn btn-pay" href="payProcess.jsp?transID=<%=transID%>">Pay Bill</a>

    </div>
    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- PDF PLUGIN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>

    <script src="tools.js"></script>
</body>