jQuery(function ($) {
  'use strict';

  var registrationUpdateURL = $('#event-registrations-list').data('url-base');

  $('.js-ev-presence').on('click', 'button', function() {
    var $el            = $(this)
      , registrationId = $el.parents('tr:eq(0)').data('id')
      , url            = registrationUpdateURL.replace(':id', registrationId)
      , presence       = $el.val() === 'yes' ? 1 : 0
      , data           = jQuery.extend(forgeryProtectedFormParams('PUT'), { presence: presence })
    ;

    if ($el.val() === 'yes' && $el.is('.btn-info')) { return; }
    if ($el.val() === 'no' && $el.is('.btn-danger')) { return; }

    $.ajax({
      url:      url,
      method:   'POST',
      data:     data,
      dataType: 'json',
      context:  $el,
      success:  processPresenceUpdateResponse
    });
  });

  function processPresenceUpdateResponse(data) {
    if (data.status !== 'success') { return; }

    var presentCounter = $('#ev-present')
      , increment      = data.result === 'present' ? 1 : -1;

    presentCounter.text(+presentCounter.text() + increment);

    if (data.result === 'present') {
      this.addClass('btn-info').removeClass('btn-default').
        next().addClass('btn-default').removeClass('btn-danger');
    } else {
      this.addClass('btn-danger').removeClass('btn-default').
        prev().addClass('btn-default').removeClass('btn-info');
    }
  }
});
