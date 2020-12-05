$(document).ready(function() {
    customers = []
    counter = 0

    $("#myform").submit(function(e) {
        console.log("submitted")
        e.preventDefault();
        let content = `<tr id='row-${++counter}'>`
                        // <td scope='row'>${counter}</td>`;
        let customer = {
            id : counter,
            cust_name : e.target[0].value,
            cust_sname : e.target[1].value,
            cust_id : e.target[2].value,
            cust_tel : e.target[3].value,
            cust_mail : e.target[4].value,
            cust_room : e.target[5].value
        }

        for (key in customer) {
            content += `<td>${customer[key]}</td>`

        }
        content += `<td>
                        <button id="delete-${counter}" type="button" class="delete-buttons btn btn-danger"><i class="fas fa-trash-alt fa-xs"></i></button>    
                    </td>`
        content += "</tr>" 
        $('#my-table tr:last').after(content);
        customers.push(customer)

        $(".delete-buttons").on("click", function(e) {
            let row = e.currentTarget.parentElement.parentElement;
            let data = row.firstChild.innerHTML;
            for (cust in customers) {
                if (data == cust[0]) {
                    customers.remove(cust);
                    break;
                }
            }
            console.log(customers)
            row.remove();
        })

    })

    function createXML(obj) {
        xml = '<customers>';
        for (let c in customers) {
            xml += '<customer>';
            xml += `<name>${customers[c].cust_name}</name>
                    <surname>${customers[c].cust_sname}</surname>
                    <identity>${customers[c].cust_id}</identity>
                    <tel>${customers[c].cust_tel}</tel>
                    <mail>${customers[c].cust_mail}</mail>
                    <room>${customers[c].cust_room}</room>`
            xml += '</customer>'
        }
        xml += '</customers>'
        return xml;
    }



    $("#final-submit").on('click', function sendXML() {
        createXML(customers);
        let url = 'groupCustomers';
        let data = createXML(customers);
        let xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.send(data);
    });

    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus');

    })

})



