/**
 * 
 *
 */

$(document).ready(function() {
    var urlstr = window.location.href;
    $('#navbar a').each(function() {
        if(urlstr.indexOf($(this).attr('href')) > -1) {
            $(this).parent().addClass('active');
        } 
    });
});















