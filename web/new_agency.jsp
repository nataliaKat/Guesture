<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Home</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />


</head>
<body id="new_agency">
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-light  custom-nav">
        <a class="navbar-brand"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!-- Page Content -->
<main class="container">

    <div class="row">
        <!-- Form -->
        <div id="new-agency" class="col-sm-12 col-lg-8 col-ml-5" style="padding: 20px;">
            <h1 class="text-center">New Agency</h1>

            <form action="registerControllerAgency.jsp" class="form-horizontal" method="post">
                <div class="form-agency">
                    <label for="name" class="col-sm-4 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control" placeholder="name"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-10 control-label">Password </label>
                    <div class="col-sm-10">
                        <input type="password" id="password" name="password" class="form-control"
                            placeholder="Enter Password" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="repeat_password" class="col-sm-12 control-label">Repeat Password </label>
                    <div class="col-sm-10">
                        <input type="password" id="repeat_password" name="repeat_password" class="form-control"
                            placeholder="Repeat Password" required>
                    </div>
                </div>

                <div class="form-agency">
                    <label for="tel" class="col-sm-4 control-label" style="padding-top: 2%;">Telephone</label>
                    <div class="col-sm-10">
                        <input type="tel" id="telephone" name="phone" class="form-control" placeholder="number" required>
                    </div>
                </div>
                <div class="form-agency">
                    <label for="mail" class="col-sm-4 control-label" style="padding-top: 2%;">E-mail</label>
                    <div class="col-sm-10">
                        <input type="mail" id="mail" name="mail" class="form-control" placeholder="mail" required>
                    </div>
                </div>
                <div class="form-agency">
                    <label for="vat" class="col-sm-4 control-label" style="padding-top: 2%;">VAT Number</label>
                    <div class="col-sm-10">
                        <input type="text" id="vat" name="vat" class="form-control" placeholder="number" required>
                    </div>
                </div>
                

                <div class="form-agency">
                    <div class="col-sm-10 col-sm-offset-2" style="padding-top: 5%;">
                        <button type="submit" class="brownButton">Submit</button>
                        <button type="reset" class="blueButton">Clear</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</main>

<footer class="footer">
    <div class="container">
        <span class="text-muted">Made with &hearts; by Guesture - Group Management</span>
    </div>
</footer>
<!-- Bootstrap core JavaScript -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="js/res_form.js"></script>
</body>

</html>
