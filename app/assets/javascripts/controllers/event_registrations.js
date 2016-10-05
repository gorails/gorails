jQuery(function ($) {
  'use strict';

  $('.js-ev-presence').on('click', 'button[value=yes]', markUserAsPresent);
  $('.js-ev-presence').on('click', 'button[value=no]', markUserAsAbsent);

  function markUserAsPresent() {
    var $el = $(this);
    if (!canSetPresence($el)) { return; }
    setLoadingState($el);
    performAjaxRequest($el, { presence: 1 });
  }

  function markUserAsAbsent() {
    var $el = $(this);
    if (!canSetAbsence($el)) { return; }
    setLoadingState($el);
    performAjaxRequest($el, { presence: 0 });
  }

  function canSetPresence($el) {
    return !$el.is('.btn-info') && !$el.data('busy');
  }

  function canSetAbsence($el) {
    return !$el.is('.btn-danger') && !$el.data('busy');
  }

  function setLoadingState($el) {
    var trEl = $el.closest('tr');
    trEl.css({ opacity: 0.3, cursor: 'wait' });
    trEl.find('button').css({ cursor: 'wait' }).data({ busy: true });
  }

  function unsetLoadingState($el) {
    var trEl = $el.closest('tr');
    trEl.css({ opacity: '', cursor: '' });
    trEl.find('button').css({ cursor: '' }).data({ busy: false });
  }

  function performAjaxRequest(button, data) {
    $.ajax({
      url:      registrationUpdateURL(button),
      method:   'POST',
      data:     jQuery.extend(forgeryProtectedFormParams('PUT'), data),
      dataType: 'json',
      context:  button
    }).then(preparePresenceUpdateResponseProcessor(button));
  }

  function registrationUpdateURL(button) {
    var registrationId = button.parents('tr:eq(0)').data('id');
    return $('#event-registrations-list').data('url-base').replace(':id', registrationId);
  }

  function preparePresenceUpdateResponseProcessor(clickedElement) {
    return function (data) {
      if (data.status !== 'success') { return; }

      var presentCounter = $('#ev-present');
      var increment      = data.result === 'present' ? 1 : -1;

      presentCounter.text(+presentCounter.text() + increment);
      unsetLoadingState(clickedElement);

      if (data.result === 'present') {
        hightlightYesButtonAsClicked(clickedElement);
      } else {
        hightlightNoButtonAsClicked(clickedElement);
      }
    };
  }

  function hightlightYesButtonAsClicked(yesButton) {
    yesButton.addClass('btn-info').removeClass('btn-default').
      next().addClass('btn-default').removeClass('btn-danger');
  }

  function hightlightNoButtonAsClicked(noButton) {
    noButton.addClass('btn-danger').removeClass('btn-default').
      prev().addClass('btn-default').removeClass('btn-info');
  }
});
