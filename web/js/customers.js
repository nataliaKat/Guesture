$(document).ready(function() {
    customers = []
    counter = 0
    grouping = []
    customers.push(grouping)


    $("#new-room").click(function(e) {
        grouping = []
        customers.push(grouping)
        let content = `<tr style="background-color: #353745">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>`
        $('#customer-table tr:last').after(content);

    });

    $("#myform").submit(function(e) {
        console.log("submitted")
        e.preventDefault();
        let content = `<tr id='row-${++counter}'>`;
        let customer = {
            num : counter,
            name : e.target[0].value,
            surname : e.target[1].value,
            identityNumber : e.target[2].value,
            telephone : e.target[3].value,
            email : e.target[4].value,
        }

        for (key in customer) {
            content += `<td>${customer[key]}</td>`

        }
        content += "</tr>" 
        $('#customer-table tr:last').after(content);
        grouping.push(customer)



    })

    $("#final-submit").click(function() {
        $('#cover-spin').show(0)
        const queryString = window.location.search;
        let urlParams = new URLSearchParams(queryString);
        const reservationId = urlParams.get('reservation')
        console.log(customers)
            $.ajax({
                type: "POST",
                url: "groupCustomers",
                dataType: 'JSON',
                data: {"custs" : JSON.stringify(customers),
                        "reservation" : reservationId},
                complete: function() {
                    window.location.replace("view_hotels.jsp")
                },
                fail: function(xhr, textStatus, errorThrown){
                    alert('fail');
                }
            });
        }
    );

})



