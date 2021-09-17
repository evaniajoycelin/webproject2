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
        <h3 class="title-cart">Transaction List</h3>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">Date</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
            <%
                String getTrans = "SELECT * FROM transactions";
                PreparedStatement transStatement = con.prepareStatement(getTrans);
                ResultSet resultTrans = transStatement.executeQuery(); 
        
                while(resultTrans.next()){
            %>
                    <tr>
                        <td><%=resultTrans.getDate("transDate")%></td>
                        <td>
                            <a href="viewTransDetail.jsp?transID=<%=resultTrans.getInt("transID")%>"><img class="img-table" src="https://image.flaticon.com/icons/png/512/1/1755.png" alt="View"></a>
                            <a href="deleteTransProcess.jsp?transID=<%=resultTrans.getInt("transID")%>"><img class="img-table" src="https://image.flaticon.com/icons/png/512/1214/1214428.png" alt="Delete"></a>
                        </td>
                    </tr>
            <%  } %>
            </tbody>
        </table>
    </div>

    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>