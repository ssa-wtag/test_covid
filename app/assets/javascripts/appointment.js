// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
    $('#appointment-table').dataTable();
    $('.submit-btn-sms').click(function() {
        return confirm('Are you sure to send appointment SMS?');
    });

    $('.appointment_date_field').change(function() {
        date = this.value;

        $.ajax({
            url: "/appointment/new",
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: 'json',
            data: {
                desired_appointment_date: date
            },
            success: function(response) {
                adjust_time_slot(response);
            },
            error: function(response) {
                adjust_time_slot(response);
            }
        });
    });

    function adjust_time_slot(response) {
        if (response.slot_status.nine_ten == false) {
            $('.nine_ten_class').hide();
        } else {
            $('.nine_ten_class').show();
        }
        if (response.slot_status.ten_eleven == false) {
            $('.ten_eleven_class').hide();
        } else {
            $('.ten_eleven_class').show();
        }
        if (response.slot_status.eleven_twelve == false) {
            $('.eleven_twelve_class').hide();
        } else {
            $('.eleven_twelve_class').show();
        }
        if (response.slot_status.twelve_one == false) {
            $('.twelve_one_class').hide();
        } else {
            $('.twelve_one_class').show();
        }
    }
});
