// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
    $('.submit-btn-sms').click(function() {
        return confirm('Are you sure to send appointment SMS?');
    })
});