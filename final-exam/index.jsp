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
    <form action="loginProcess.jsp" method="POST" class="form-signin">
        <div class="text-center mb-4">
          <img class="mb-4" src="https://image.flaticon.com/icons/png/512/948/948036.png" alt="" width="72" height="72">
          <h1 class="h3 mb-3 font-weight-normal">Japan Forest Dining</h1>
        </div>
      
        <div class="form-label-group">
          <input name="userName" type="text" id="inputUserType" class="form-control" placeholder="Username" required autofocus>
          <label for="inputEmail"></label>
        </div>
      
        <div class="form-label-group">
          <input name="userPassword" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
          <label for="inputPassword"></label>
        </div>
      
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>
</body>
</html>