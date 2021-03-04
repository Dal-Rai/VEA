$(document).on('click',".ticket-detail, .items , .activity-log-modal", function () {
    var id = $(this).attr('id');
    $.ajax({
        type: 'GET',
        url: "/ticketings/" + id + "/edit",
        success: function (data) {
            $('.modal-holder').html(data);
            $('#ticketModal').modal();
        },
        error: function (err) {
            $('.modal_flesh_msg').html(
                '<div class="alert alert-danger alert-modal"> There is error in the ticket<button class="close" data-dismiss="alert">x</button></div>'
            )
        }
    });
});


