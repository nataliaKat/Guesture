$(document).ready(() => {
    const queryString = window.location.search;
    let urlParams = new URLSearchParams(queryString);
    const hotelUsername = urlParams.get('hotel');
    getRooms(hotelUsername);

    $("#submit-rooms").click((e) => {
        e.preventDefault();
        let number = $("#number").val();
        let floor = $("#floor").val();
        let type = $("#type").val();
        $.ajax({
            type: "POST",
            url: "submitRoom",
            dataType: 'JSON',
            data: {
                "number": number,
                "floor": floor,
                "type": type,
                "username": hotelUsername
            },
            complete: function(data) {
                console.log(data);
                alert(data.responseText);
                setInterval(getRooms(hotelUsername), 10000)
            },
            success: function (data) {
                console.log(data);
                alert(data);
            }
        });
    });

    function getRooms(hotelUsername) {
        $.get(`getAllRooms?username=${hotelUsername}`, function (data, status) {
            let rooms = JSON.parse(data);
            let table = document.getElementById("roomtable");
            for(var i = table.rows.length - 1; i > 0; i--) {
                table.deleteRow(i);
            }
                console.log(rooms);
                for (let room of rooms) {
                    let row = table.insertRow(-1)
                    let number = row.insertCell(0);
                    number.innerHTML += room.number;
                    let floor = row.insertCell(1);
                    floor.innerHTML += room.floor;
                    let type = row.insertCell(2);
                    type.innerHTML += room.type;
                }
        });
    }
}); 