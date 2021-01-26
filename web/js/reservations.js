$(document).ready(function () {
    var table = $('#example').DataTable({
        lengthChange: false,
    });

    $('#confirm-modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('id')
        var modal = $(this)
        modal.find('.modal-title').text('Confirm reservation #' + id)
        // modal.find('.modal-body input').val(recipient)
    })

});