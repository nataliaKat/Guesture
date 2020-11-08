$(document).ready(function () {

    let table = $("#cost-table")
    table.on("keyup click", function (e) {
        let items = $("#cost-table").children();

        sum = 0;
        for (i = 1; i < items[1].childNodes.length; i += 2) {
            let field = items[1].childNodes[i].children[1];
            let id = field.lastElementChild.id;
            let price = $("#" + id).val(); 
            field = items[1].childNodes[i].children[2];
            id = field.lastElementChild.id;
            let quantity = $("#" + id).val();
            sum += price * quantity;
        }
        $("#total-cost").val(sum)
    })

});