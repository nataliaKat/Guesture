$(document).ready(() => {
    $("#submit-rooms").click((e) => {
        e.preventDefault();
        let hotelUsername = "luxury@gmail.com"
        let number = $("#number").val();
        if (!Number.isInteger(number)) {
            console.log("not number")
        }
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
            complete: getRooms(hotelUsername)
        });
    })

    function fillTable(rooms) {
        let table = $("#roomtable");
        // console.log(rooms);
        for (let room in rooms) {
            console.log(room.number)
            console.log(room)
            let row = table.insertRow(-1)
            let number = row.insertCell(0);
            number.innerHTML = room.number;
            let floor = row.insertCell(1);
            floor.innerHTML = room.floor;
            let type = row.insertCell(2);
            type.innerHTML = room.type;
        }
    }

    function getRooms(hotelUsername) {
        $.get(`getAllRooms?username=${hotelUsername}`, function (data, status) {
            let rooms = JSON.parse(data);
            let table = document.getElementById("roomtable");
            for(var i = table.rows.length - 1; i > 0; i--) {
                table.deleteRow(i);
            }
                console.log(rooms);
                for (let room of rooms) {
                    console.log(room.number);
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