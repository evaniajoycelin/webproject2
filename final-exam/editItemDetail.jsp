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
    <div class="container-edit">
      <%
        String foodID = request.getParameter("foodID");
        String getFood = String.format("SELECT * FROM foods WHERE foodID = '%s'", foodID);
        ResultSet resultFood = st.executeQuery(getFood);

        if(resultFood.next()){
          String foodName = resultFood.getString("foodName");
          int foodPrice = resultFood.getInt("foodPrice");
          int foodStock = resultFood.getInt("foodStock");
          String foodImg = resultFood.getString("foodImg"); 
      %>
          <form action="editItemProcess.jsp" method="POST">
            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Item's Name</label>
              <div class="col-sm-10">
                <input name="foodNameE" type="text" class="form-control" value="<%=foodName%>">
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Item's Price</label>
              <div class="col-sm-10">
                <input name="foodPriceE" type="text" class="form-control" value="<%=foodPrice%>">
              </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Item's Stock</label>
                <div class="col-sm-10">
                  <input name="foodStockE" type="text" class="form-control" value="<%=foodStock%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Image Url</label>
                <div class="col-sm-10">
                  <input name="foodImgE" type="text" class="form-control" value="<%=foodImg%>">
                </div>
            </div>
            <input type="hidden" name="foodID" value="<%=foodID%>">
            <button type="submit" class="btn btn-edit-detail">Edit Item</button>
            <a type="button" class="btn btn-cancel-edit" href="editMenu.jsp">Cancel</a>
          </form>
      <%
        }
      %>
    
    </div>

    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>