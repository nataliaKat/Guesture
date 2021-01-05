<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<!doctype html>
<html lang="en">

<head>
    <title>Guesture | Hotel Registration</title>
    <!-- Bootstrap 4 -->
    <%@include file="header.jsp"%>
</head>

<body id="hotelRegistration">
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.html">Back</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Begin page content -->
    <main class="container">
        <div id="registration_form" class="col-xs-12 col-md-6">
            <h1 class="text-center">Sign Up</h1>
            <div class="row d-flex justify-content-center">
                <!-- Form -->
                <div class="col-xs-12 col-md-10 col-lg-8">
                    <!-- Form method should be "POST" and action should be included at the real system, removed it for demo purposes -->
                    <form class="form-horizontal" action="registerControllerHotel.jsp" method="post">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">Username </label>
                            <div>
                                <input type="text" id="username" name="username" class="form-control"
                                    placeholder="Enter a valid e-mail address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password </label>
                            <div>
                                <input type="password" id="password" name="password" class="form-control"
                                    placeholder="Enter Password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="repeat_password" class="col-sm-12 control-label">Repeat Password </label>
                            <div>
                                <input type="password" id="repeat_password" name="repeat_password" class="form-control"
                                    placeholder="Repeat Password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Name </label>
                            <div>
                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter a name"
                                    required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="col-sm-4 control-label">Address</label>
                            <div>
                                <input type="text" id="address" name="address" class="form-control"
                                    placeholder="Enter an address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phonenumber" class="col-sm-4 control-label">Phonenumber</label>
                            <div>
                                <input type="text" id="phonenumber" name="phonenumber" class="form-control"
                                    placeholder="Enter a phonenumber" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="head" class="col-sm-4 control-label">Head</label>
                            <div>
                                <input type="text" id="head" name="head" class="form-control"
                                    placeholder="Enter a head" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-sm-4 control-label">Description</label>
                            <div>
                                <input type="text" id="description" name="description" class="form-control"
                                    placeholder="Enter a description" required>
                            </div>
                        </div>
                         
                        <div class=" form-group">
                            <div class="col-xs-12 col-lg-8">
                                <div class="row">
                                    <div class="table-responsive table-striped" style="overflow-x: visible;">
                                        <table id="cost-table" class="table table-hover table-striped table-bordered ml-3"
                                            style="text-align: center;">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Room Type</th>
                                                    <th scope="col">Price per Room</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Single</td>
                                                    <td>
                                                        <input min="0" name="p-1" id="p-1" type="number" class="table-input"
                                                            required>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Double</td>
                                                    <td>
                                                        <input name="p-2" id="p-2" type="number" class="table-input" min="0"
                                                            required>
                                                    </td>  
                                                </tr>
                                                <tr>
                                                    <td>Triple</td>
                                                    <td>
                                                        <input name="p-3" id="p-3" type="number" class="table-input" min="0"
                                                            required>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Quadruple</td>
                                                    <td>
                                                        <input name="p-4" id="p-4" type="number" class="table-input" min="0"
                                                            required>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="services">Enter services, each one in new line</label>
                            <textarea class="form-control" id="services"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="criteria">Enter criteria, each one in new line</label>
                            <textarea class="form-control" id="criteria"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="url" class="col-sm-4 control-label">Enter an https:// URL of an image:</label>
                            <div>
                                <input type="text" id="de" name="description" class="form-control"
                                    placeholder="https://example.com"
                                    required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-30">
                                <div class="checkbox">
                                    <input type="checkbox" name="terms" id="terms" value="1"><b> I agree to the
                                        terms and conditions</b>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-30 col-sm-offset-2">
                                <button type="submit" class="brownButton">Submit</button>
                                <button type="reset" class="blueButton">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <%@include file="footer.jsp"%>
</body>

</html>