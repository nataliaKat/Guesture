<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="header.jsp"%>
    <title>Log In</title>
    <link rel="stylesheet" type="text/css" href="css/login-style.css">

</head>

<body id="login">
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    
                </ul>
            </div>
        </nav>
    </header>
    <form action="loginController.jsp" method="POST">
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
                                <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            
                            <button class="brownButton" id="submit-button" type="submit">Login</button>
                            <hr style="color: gray;">
                            <div>New User?<br> <a href="hotel_registration.jsp"><u>Sign Up As a Hotel!</u></a> <br>
                                <a href="new_agency.jsp"><u>Sign Up As an Agency!</u></a></div>     
                        </form>
                    </div>
                </div>
                <div id="quote"> "Group reservations<br>             made easier than ever..."</div>
            </div>
        </div>
    </form>
<%@include file="footer.jsp"%>
</body>

</html>