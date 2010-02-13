jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader('Accept', 'application/json');
    }
});


jQuery(document).ready(function() {
    var user = null;

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

    function createBookItem(book, buttonType) {
        return el('li', {id: book.isbn},
                el('img', {class: 'book-image', src: book.image_thumbnail_url}),
                el('div', {class: 'book-title'}, book.title),
                el('span', {class: 'book-author'}, book.author),
                el('button', {class: buttonType.toLowerCase() + '-button'}, buttonType.capitalize())
                );
    }

    function borrowBook(book) {
        alert(book);

    }

    function returnBook() {
        alert(book);
    }

    function parentId(el) {
        return jQuery(el).parent().attr('id');
    }
    function addBookListeners() {
        jQuery('.borrow-button').unbind('click').click(function(){
            borrowBook(parentId(this));
        });
        jQuery('.return-button').unbind('click').click(function(){
            returnBook(parentId(this));
        });
        jQuery('.book-image').unbind('mouseover').mouseover(function() {
            alert(this);
        });
    }

    function updateSearchResults(data) {
        var results = jQuery('#search-results')
        results.empty();
        data.each(function(item) {
            results.append(createBookItem(item.book, 'borrow'));
        });
        addBookListeners();
    }

    jQuery('#search-form').submit(function() {
        jQuery.get(jQuery(this).attr('action'), jQuery(this).serialize(), function(data) {
            updateSearchResults(data);
        });
        return false;
    });

    jQuery('#login-form').submit(function() {
        var username = jQuery('#login-field').val();
        var loginUrl = '/users/' + username;
        jQuery.get(loginUrl, function(data) {
            user = data.user;
            jQuery('#logged-out-panel').hide();
            jQuery('#logged-in-panel').show();
            jQuery('#logged-in-username').text(user.name);
            updateLoans(user.login);
        });
        return false;
    });

    function updateLoans(username) {
        var loansUrl = '/users/' + username + '/loans';
        jQuery.get(loansUrl, function(data) {
            var loans = jQuery('#loans');
            loans.empty();
            data.each(function(item) {
                loans.append(createBookItem(item.book, 'return'));
            });
            addBookListeners();
        });
    }

    function initPanels() {
        jQuery('#logged-out-panel').show();
        jQuery('#logged-in-panel').hide();
    }


    initPanels();

});

