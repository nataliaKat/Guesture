$(document).ready(function () {
    var table = $('#example').DataTable({
        lengthChange: false,
    });

    table.buttons().container().appendTo('#example_wrapper .col-md-6:eq(0)');
    $('#modal-edit').on('shown.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        console.log("hi")
        var ar_date = button.data('ar_date')
        var ar_time = button.data('ar_time')
        var dep_date = button.data('dep_date')
        var dep_time = button.data('dep_time')
        console.log(ar_date) // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#ar_date').val(ar_date)
        modal.find('#ar_time').val(ar_time)
        modal.find('#dep_date').val(dep_date)
        modal.find('#dep_time').val(dep_time)
    })

});