$(document).ready(() => {
    $("#submit-rooms").click((e) => {
        e.preventDefault();
        let rooms = getRooms("luxury@gmail.com");
        fillTable(rooms);
    });

    function fillTable(rooms) {
        let table = $("#roomtable");
        for (let room in rooms) {
            console.log(room.number)
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
            return JSON.parse(data);
        });
    }
}); 