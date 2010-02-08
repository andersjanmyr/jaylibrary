jQuery(document).ready(function() {
    jQuery('#search-form').submit(function() {
        jQuery.get(jQuery(this).attr('action'), jQuery(this).serialize(), function(data) {
        });
        return false;
    })

});
