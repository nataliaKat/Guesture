const ReservationsApp = angular.module("app", []);

ReservationsApp.controller("MainCtrl", ['$scope', '$http', '$window', MainCtrl]);

function MainCtrl($scope, $http, $window) {
    const URL = "reservations";
    const confirmUrl = "confirm";

    $http.get(URL).then(handleJson, handleError);

    $scope.confirm = function (id) {
        $http({
            method: 'POST',
            url: confirmUrl,
            data: "id=" + id + "&action=" + 1,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }).then(handleConfResponse, handleError);
    }

    $scope.checkIn = function(id) {
        $http({
            method: 'POST',
            url: confirmUrl,
            data: "id=" + id + "&action=" + 2,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }).then(handleCheckInResponse, handleError);
    }

    $scope.checkOut = function(id) {
        $http({
            method: 'POST',
            url: confirmUrl,
            data: "id=" + id + "&action=" + 3,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }).then(handleCheckOutResponse, handleError);
    }

    $scope.delete = function(id) {
        $http({
            method: 'POST',
            url: confirmUrl,
            data: "id=" + id + "&action=" + 4,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }).then(function() {
            $http.get(URL).then(handleJson, handleError);
        });
    }

    function handleConfResponse(response) {
        if (response.status == 200) {
            $("#modal-body").text("Reservation has been confirmed");
            $('#confirm-modal').modal('show');
        }
        $http.get(URL).then(handleJson, handleError);
    }

    function handleCheckInResponse(response) {
        if (response.status == 200) {
            $("#modal-body").text("Reservation has been checked in");
            $('#confirm-modal').modal('show');
        }
        $http.get(URL).then(handleJson, handleError);
    }

    function handleCheckOutResponse(response) {
        if (response.status == 200) {
            $("#modal-body").text("Reservation has been checked out");
            $('#confirm-modal').modal('show');
        }
        $http.get(URL).then(handleJson, handleError);
    }

    function handleJson(response) {
        $scope.reservations = response.data;
    }

    function handleError(response) {
        if (response.status == 538)
            $window.location.href = 'login.jsp'
        if (response.status == 500 || response.status == 501) {
            $("#modal-body").text("Updated failure");
            $('#confirm-modal').modal('show');
        }

    }

}