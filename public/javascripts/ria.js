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

    function countDisplay(book) {
        return '(' + book.loan_count + '/' + book.book_copy_count + ')';
    }

    function createBookItem(book, buttonType) {
        return el('li', {id: book.isbn, class: book.available ? 'available' : 'unavailable'},
                el('img', {class: 'book-image', src: book.image_thumbnail_url}),
                el('div', {class: 'book-title'}, book.title + ' ' + countDisplay(book)),
                el('span', {class: 'book-author'}, book.author),
                el('button', {class: buttonType.toLowerCase() + '-button'}, buttonType.capitalize())
                );
    }

    function borrowBook(isbn) {
        if (!user) {
            alert('You must be logged in to borrow a book!');
            jQuery('#login-field').focus();
        }
        else {
            var borrowUrl = '/loans';
            jQuery.post(borrowUrl, {user_id: user.id, isbn: isbn}, function(data) {
                updateLoans(user.id);
            });
        }

    }

    function returnBook(isbn) {
        var returnUrl = '/loans/destroy';        
        jQuery.post(returnUrl, {user_id: user.id, isbn: isbn}, function(data) {
            updateLoans(user.id);
        });
    }

    function parentId(el) {
        return jQuery(el).parent().attr('id');
    }

    function initListeners() {
        jQuery('.borrow-button').live('click', function() {
            borrowBook(parentId(this));
        });
        jQuery('.return-button').live('click', function() {
            returnBook(parentId(this));
        });
        jQuery('.book-image').live('mouseover', function() {

        });
    }

    function updateSearchResults(data) {
        var results = jQuery('#search-results')
        results.empty();
        data.each(function(item) {
            results.append(createBookItem(item.book, 'borrow'));
        });
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
            updateLoans(user.id);
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
        });
    }

    function initPanels() {
        jQuery('#logged-out-panel').show();
        jQuery('#logged-in-panel').hide();
    }


    initPanels();
    initListeners();
});

