jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader('Accept', 'application/json');
    }
});

function el(name, attributes) {
    var element = new Element(name, attributes);
    var children = [];
    if (arguments.length > 2)
        children = $A(arguments).slice(2).flatten().toArray();
    children.each(function(child) {
        if (typeof child == "string") {
            if (!child.startsWith("<"))
                child = document.createTextNode(child);
        }
        if (typeof child == "string")
            element.innerHTML = child;
        else
            element.appendChild(child);
    });
    return element;
}

function createBookItem(book) {
    return el('li', null, book.title);
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

