const ShowReservationApp = angular.module("res-app", []);

ShowReservationApp.controller("ReservationCtrl", ['$scope', '$http', '$window', ReservationCtrl]);

function ReservationCtrl($scope, $http, $window) {
    var id = getUrlId()

    const URL = 'getById?id=' + id;

    $http.get(URL).then(handleJson, handleError);

    $scope.convertToDate = function (fromDate) {
        fromDate = new Date(fromDate);
        if (fromDate.getDate() < 10)
            day = '0' + fromDate.getDate();
        else
            day = fromDate.getDate();
        if (fromDate.getMonth() < 9) {
            month = fromDate.getMonth() + 1;
            month = '0' + month
        } else {
            month = fromDate.getMonth() + 1;
        }
        formattedDate = fromDate.getFullYear() + "-" + month + "-" + day
        return formattedDate;
    }

    $scope.update = function (resEdit) {
        console.log(resEdit);
        let editURL = "edit";
        resEdit.id = $scope.reservation.reservationId;
        if (!resEdit.arrivalDate) resEdit.arrivalDate = $scope.reservation.arrivalDate;
        if (!resEdit.departureDate) resEdit.departureDate = $scope.reservation.departureDate;
        if (!resEdit.arrivalTime) resEdit.arrivalTime = $scope.reservation.arrivalTime;
        if (!resEdit.departureTime) resEdit.departureTime = $scope.reservation.departureTime;
        resEdit.arrivalDate = $scope.convertToDate(resEdit.arrivalDate);
        resEdit.departureDate = $scope.convertToDate(resEdit.departureDate);
        if (resEdit.arrivalDate > resEdit.departureDate) {
            $("#modal-body").text("Arrival date should be before departure date");
            $('#confirm-modal').modal('show');
            return;
        }
        $.ajax({
            type: "POST",
            url: editURL,
            dataType: 'JSON',
            data: resEdit,
            complete: function(data) {
                if (data.status == 200) {
                    $("#modal-body").text("Reservation has been updated");
                    $('#confirm-modal').modal('show');
                }
                $http.get(URL).then(handleJson);
            }
        });
    }

    function getUrlId() {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const id = urlParams.get('id')
        return id;
    }

    $scope.reservation = {};

    function handleJson(response) {
        $scope.reservation = response.data.reservation;
        $scope.hotel = response.data.hotel;
        $scope.services = response.data.services;
        console.log(response.data)
        $scope.data = {
            availableOptions: [
                {id: 'morning', name: 'morning'},
                {id: 'noon', name: 'noon'},
                {id: 'evening', name: 'evening'}
            ]
        };
    };

    function handleError(response) {
        if (response.status == 538)
            $window.location.href = 'login.jsp'
    }



}
