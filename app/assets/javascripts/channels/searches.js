App.searches = App.cable.subscriptions.create('SearchesChannel', {  
  received: function(data) {
    var $searchForm   = $('form#contacts-search-form');
    var params        = $searchForm.data('current-params');
    var url           = $searchForm.prop('action');
    var $contactsArea = $('#contacts-area');
    $.get(url, function(data) {
      $contactsArea.html(data);
    })
  },
});
