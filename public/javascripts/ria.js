jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader('Accept', 'application/json');
    }
});

function createBookItem(book) {
    return '<li>' + book.title + '</li>';
}

jQuery(document).ready(function() {
    jQuery('#search-form').submit(function() {
        jQuery.get(jQuery(this).attr('action'), jQuery(this).serialize(), function(data) {
            var results = jQuery('#search-results')
            data.each(function(item) {
                results.append(createBookItem(item.book));
            })
        });
        return false;
    })

});

