<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Log In</title>
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../web/css/login-style.css">
    <link rel="stylesheet" type="text/css" href="../web/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../web/images/favicon.png" />
</head>

<body id="login">
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand"><img class="logo" src="../web/images/logo_blue_nav.png" alt="logo"></a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    
                </ul>
            </div>
        </nav>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex justify-content-center animated fadeInRight">
                <div id="login-form">
                    <form>
                        <h4>Sign in</h4>
                        <label class="sr-only" for="username">Username</label>
                        <div class="input-group my-input">
                            <div class="input-group-text"><i class="fa fa-user"></i></div>
                            <input name="username" type="text" class="form-control" id="username" placeholder="Username">
                        </div>
                        <label class="sr-only" for="password">Password</label>
                        <div class="input-group my-input">
                            <div class="input-group-text"><i class="fa fa-lock"></i></div>
                            <input name="password" type="text" class="form-control" id="password" placeholder="Password">
                        </div>
                        <input type="checkbox" checked> Remember me</input>
                        <button class="brownButton" id="submit-button" type="submit">Login</button>
                        <hr style="color: gray;">
                        <div>New User? <a href="hotel_registration.html"><u>Sign Up Now!</u></a></div>    
                    </form>
                </div>
            </div>
            <div id="quote"> "Group reservations<br>             made easier than ever..."</div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            <span class="text-muted">Made with &hearts; by Guesture - Group Management</span>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
</body>

</html>