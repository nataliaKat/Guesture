<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dream Hotel | Agencies</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css"/>
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
<body id="agency">
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
                <li class="nav-item active">
                    <a class="nav-link" href="agencies.html">Agencies<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reservations.html">Reservations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reviews.html">Reviews</a>
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
        <div class="row mb-4">
            <a href="new_agency.html"><button class="brownButton"><i class="fas fa-plus"></i>
                New Agency</button></a>
        </div>
        <table id="example" class="table table-dark table-hover table-striped table-bordered dt-responsive nowrap" style="width:100%;">
            <thead>
            <tr>
                <th>Agency</th>
                <th>Telephone</th>
                <th>E-mail</th>
                <th>Agent</th>
                <th>Registration Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Orea Komotini</td>
                <td>2115256342</td>
                <td>oreakomotini@gmail.com</td>
                <td>Tiger Nixon</td>
                <td>02/10/2020</td>
            </tr>
            <tr>
                <td>Travel</td>
                <td>2104258892</td>
                <td>travel@gmail.com</td>
                <td>Garrett Winters</td>
                <td>25/07/2011</td>
            </tr>
            <tr>
                <td>Pame Ekdromi</td>
                <td>2152545857</td>
                <td>pameekdromi@gmail.com</td>
                <td>Sofia Papadopoulou</td>
                <td>12/01/2009</td>
            </tr>
            <tr>
                <td>Travelling 24</td>
                <td>2174859565</td>
                <td>travelling@gmail.com</td>
                <td>Cedric Kelly</td>
                <td>23/09/2012</td>
            </tr>
            <tr>
                <td>Taxidi</td>
                <td>2152442258</td>
                <td>taxidi@gmail.com</td>
                <td>Herrod Chandler</td>
                <td>28/11/2008</td>
            </tr>
            <tr>
                <td>Planet</td>
                <td>2105428536</td>
                <td>planet@gmail.com</td>
                <td>Sonya Green</td>
                <td>02/12/2012</td>
            </tr>
            <tr>
                <td>Peripatos</td>
                <td>2125245857</td>
                <td>peripatos@yahoo.com</td>
                <td>Anastasia Georgiou</td>
                <td>06/08/2012</td>
            </tr>
            <tr>
                <td>Tour</td>
                <td>2142585796</td>
                <td>tours@gmail.com</td>
                <td>Rhona Davidson</td>
                <td>14/10/2010</td>
            </tr>
            <tr>
                <td>Taxidiotiko</td>
                <td>2514587968</td>
                <td>taxidiotiko@gmail.com</td>
                <td>Colleen Hurst</td>
                <td>15/09/2009</td>
            </tr>
            <tr>
                <td>Pame Diakopes</td>
                <td>2102587965</td>
                <td>pamediakopes@yahoo.com</td>
                <td>Sonya Frost</td>
                <td>13/12/2008</td>
            </tr>
            <tr>
                <td>Memorable Trips </td>
                <td>2152025458</td>
                <td>memorable_t@yahoo.com</td>
                <td>Jena Gaines</td>
                <td>19/12/2008</td>
            </tr>
            <tr>
                <td>Vacation</td>
                <td>2152545225</td>
                <td>vacay@yahoo.com</td>
                <td>Mary White</td>
                <td>03/03/2013</td>
            </tr>
            <tr>
                <td>Holidays</td>
                <td>2562532145</td>
                <td>holidays@gmail.com</td>
                <td>Charde Marshall</td>
                <td>16/10/2008</td>
            </tr>
            <tr>
                <td>Planning Trips</td>
                <td>1524585796</td>
                <td>plan_trips@gmail.com</td>
                <td>Haley Kennedy</td>
                <td>18/12/2012</td>
            </tr>
            <tr>
                <td>Summer Trips</td>
                <td>2563245236</td>
                <td>summer@yahoo.com</td>
                <td>Tatyana Fitzpatrick</td>
                <td>17/03/2010</td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <th>Agency</th>
                <th>Telephone</th>
                <th>E-mail</th>
                <th>Agent</th>
                <th>Registration Date</th>
            </tr>
            </tfoot>
        </table>

    </div>
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
    $(document).ready(function() {
        var table = $('#example').DataTable( {
            lengthChange: false,
            buttons: [ 'copy', 'excel', 'csv', 'pdf', 'colvis' ]
        } );

        table.buttons().container().appendTo( '#example_wrapper .col-md-6:eq(0)' );
    } );

</script>
</body>
</html>
