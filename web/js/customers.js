$(document).ready(function() {
    customers = []
    counter = 0
    grouping = []
    customers.push(grouping)


    $("#new-room").click(function(e) {
        grouping = []
        customers.push(grouping)
    });

    $("#myform").submit(function(e) {
        console.log("submitted")
        e.preventDefault();
        let content = `<tr id='row-${++counter}'>`
                        // <td scope='row'>${counter}</td>`;
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
        content += `<td>
                        <button id="delete-${counter}" type="button" class="delete-buttons btn btn-danger"><i class="fas fa-trash-alt fa-xs"></i></button>    
                    </td>`
        content += "</tr>" 
        $('#my-table tr:last').after(content);
        grouping.push(customer)

        $(".delete-buttons").on("click", function(e) {
            let row = e.currentTarget.parentElement.parentElement;
            let data = row.firstChild.innerHTML;
            for (let i = 0; i < customers.length; i++) {
                for (let j = 0; j < customers[i].length; j++) {
                    if (data == customer.num) {
                        console.log(j, "is");
                        customers[i].splice(j, 1);
                        row.remove();
                        console.log(customers)

                        break;
                    }
                }

            }
        })

    })

    $("#final-submit").click(function() {
        console.log(customers)
            $.ajax({
                type: "POST",
                url: "groupCustomers",
                dataType: 'JSON',
                data: {"custs" : JSON.stringify(customers)},
                complete: function() {
                    window.location.replace("index.jsp")
                },
                fail: function(xhr, textStatus, errorThrown){
                    alert('fail');
                    console.log("oooffff")
                }
            });
        }
    );

    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus');

    })

})



