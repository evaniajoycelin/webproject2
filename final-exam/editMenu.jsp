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
    <div class="container-item">
        <h3 class="title-cart">Item List</h3>
        <table class="table table-sm">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Price</th>
                <th scope="col">Stock</th>
                <th scope="col">Image Url</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
            <% 
              try{
                  String getFood = "SELECT * FROM foods";
                  PreparedStatement foodStatement = con.prepareStatement(getFood);
                  ResultSet resultFood = foodStatement.executeQuery();

                  while(resultFood.next()){
            %>
                <tr>
                    <td><%=resultFood.getString("foodName")%></td>
                    <td><%=resultFood.getInt("foodPrice")%></td>
                    <td><%=resultFood.getInt("foodStock")%></td>
                    <td><%=resultFood.getString("foodImg")%></td>
                    <td>
                      <a href="editItemDetail.jsp?foodID=<%=resultFood.getString("foodID")%>"><img class="img-table" src="https://image.flaticon.com/icons/png/512/1159/1159633.png" alt="Edit"></a>
                      <a href="deleteItemProcess.jsp?foodID=<%=resultFood.getString("foodID")%>"><img class="img-table" src="https://image.flaticon.com/icons/png/512/1214/1214428.png" alt="Delete"></a>
                    </td>
                </tr>
            <%    
                  }
              }catch (Exception e){

              }
            %> 
            </tbody>
        </table>
        <a class="btn btn-add" href="addMenu.jsp">Add Item</a>
    </div>

    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>