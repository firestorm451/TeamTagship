$(document).ready(function() {
    var text_max = 170;
    $('#textarea_feedback').html(text_max + ' characters remaining');

    $('#ship_body').keyup(function() {
        var text_length = $('#ship_body').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' characters remaining');
    });
});
