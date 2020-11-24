$(document).ready(function() {
    customers = []
    counter = 0

    $("#myform").submit(function(e) {
        e.preventDefault();
        let content = `<tr>
                        <th scope='row'>${++counter}</th>`;
        let customer = {
            cust_name : e.target[0].value,
            cust_sname : e.target[1].value,
            cust_id : e.target[2].value,
            cust_tel : e.target[3].value,
            cust_mail : e.target[4].value,
            cust_romm : e.target[5].value
        }
        
        for (key in customer) {
            content += `<td>${customer[key]}</td>`            
        }
        content += `<td>
                        <button type="button" class="btn btn-secondary"><i class="fas fa-edit fa-xs"></i></button>
                        <button type="button" class="btn btn-danger"><i class="fas fa-trash-alt fa-xs"></i></button>    
                    </td>`
        content += "</tr>" 
        $('#my-table tr:last').after(content);
        customers.push(customer)
        console.log(customers)
    })

    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
      })

})

function sendJSON() {
    let url = "submit.php"; 
    let data = JSON.stringify(customers);
    let xhr = new XMLHttpRequest(); 
    xhr.open("POST", url, true); 
    xhr.send(data);
    window.location.href = "index.html";

}
