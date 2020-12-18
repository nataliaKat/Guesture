<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guesture | Reviews</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
</head>

<body id="review">
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-light  custom-nav">
        <a class="navbar-brand" href="index.html"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="agencies.html">Agencies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reservations.html">Reservations</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="reviews.html">Reviews<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="chart.html">Statistics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> Dream Hotel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link logout" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- Begin page content -->
<main>
    <div class="container mb-3 mt-3">
        <table id="example" class="table table-dark table-hover table-striped table-bordered dt-responsive nowrap"
               style="width:100%;">
            <thead>
            <tr>
                <th>#</th>
                <th>Reservation ID</th>
                <th>Date of Reservation</th>
                <th>Agency</th>
                <th>Review Submission Date</th>
                <th>Show Review</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>15</td>
                <td>17/09/2020</td>
                <td>travel a.e.</td>
                <td>19/09/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>22</td>
                <td>28/09/2020</td>
                <td>taxidi</td>
                <td>30/09/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>36</td>
                <td>05/10/2020</td>
                <td>pame ekdromh</td>
                <td>08/10/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>10</td>
                <td>15/10/2020</td>
                <td>pame ekdromh</td>
                <td>19/10/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>45</td>
                <td>20/10/2020</td>
                <td>taxidi</td>
                <td>29/10/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td>10</td>
                <td>01/11/2020</td>
                <td>planet</td>
                <td>10/11/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>17</td>
                <td>03/11/2020</td>
                <td>planet</td>
                <td>07/11/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">8</th>
                <td>10</td>
                <td>05/11/2020</td>
                <td>travel a.e.</td>
                <td>06/11/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">9</th>
                <td>52</td>
                <td>10/11/2020</td>
                <td>planet</td>
                <td>15/11/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            <tr>
                <th scope="row">10</th>
                <td>36</td>
                <td>17/11/2020</td>
                <td>planet</td>
                <td>20/11/2020</td>
                <td>
                    <form action="show_review.html" target="_blank">
                        <button class="blueButton">Show Review</button>
                    </form>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <th>#</th>
                <th>Reservation ID</th>
                <th>Date of Reservation</th>
                <th>Agency</th>
                <th>Review Submission Date</th>
                <th>Show Review</th>
            </tr>
            </tfoot>
        </table>

    </div>
    <form class="form-inline" target="_blank">
        <div id="cust-submit" class="row" style="margin-right: 550px;">
            <button class="btn btn-secondary" style="border-radius: 7px; margin-left: 3px;"
                    onclick="location.href='index.html'">Back</button>
            <button class="btn btn-secondary"
                    style="border-radius: 7px; margin-left: 50px; margin-left:100px; background-color: #bfd9d7; color:black;"
                    onclick="location.href='chart.html'">Show Statistics</button>
        </div>
    </form>
    <hr>

</main>

<footer class="footer">
    <div class="container">
        <span class="text-muted">Made with &hearts; by Guesture - Group Management</span>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            lengthChange: false,
            buttons: ['copy', 'excel', 'csv', 'pdf', 'colvis']
        });

        table.buttons().container().appendTo('#example_wrapper .col-md-6:eq(0)');
    });

</script>
</body>

</html>