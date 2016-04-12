$(document).ready(function() {
    var text_max = 170;
    $('#textarea_feedback').html('You have ' + text_max + ' characters remaining');
    $('#ship_body').keyup(function() {
        var text_length = $('#ship_body').val().length;
        var text_remaining = text_max - text_length;
        if (text_remaining >= 0) {
          $('#textarea_feedback').html('You have ' + text_remaining + ' characters remaining.');
          $('#textarea_feedback').removeClass("reddening").addClass("blackening")
        }else{
          $('#textarea_feedback').removeClass("blackening").addClass("reddening")
          $('#textarea_feedback').html('You need to remove ' + (-1 * text_remaining) + ' characters to post this.');
        };
    });
});
