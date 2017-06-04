var Segment = {
  init: function() {
    try {
      this.interfaceActions();
    } catch(e) {
      console.log(e);
    }
  },
  interfaceActions: function() {
    this.listenConditionFieldSelect();
    this.listenConditionRemoveLink();
    this.initSelects();
  },
  listenConditionRemoveLink: function() {
    $("#conditions").on('cocoon:before-remove', function(e, condition) {
      $(this).data('remove-timeout', 200);
      condition.fadeOut('slow');
    });
  },
  listenConditionFieldSelect: function() {
    $(document).on('change', '[data-condition-field-select]', function() {
      Segment._setConditionNameSelectOptions(this);
      Segment._setConditionTermInput(this);
    });
  },
  initSelects: function() {
    $('[data-condition-field-select]').trigger('change');
    $('[data-condition-name-select]').each(function() {
      $(this).val($(this).data('selected'));
    });
  },
  _setConditionNameSelectOptions: function(context) {
    var $conditionNameSelect = $(context).closest('[data-conditions-fields]').find('[data-condition-name-select]');
    var stringNames  = $conditionNameSelect.data('string-names');
    var integerNames = $conditionNameSelect.data('integer-names');
    var optionsArray = $(context).val() == 'age' ? integerNames : stringNames;
    var options      = "";
    $conditionNameSelect.empty();
    for(var i in optionsArray)
      options += '<option value="'+optionsArray[i][1]+'">'+optionsArray[i][0]+'</option>';
    $conditionNameSelect.append(options);
  },
  _setConditionTermInput: function(context) {
    var selectedField = $(context).val();
    var $conditionsFields = $(context).closest('[data-conditions-fields]');
    var $stringTermInput  = $conditionsFields.find('[data-condition-string-term-input]');
    var $stateTermInput   = $conditionsFields.find('[data-condition-state-term-input]');
    var $integerTermInput = $conditionsFields.find('[data-condition-integer-term-input]');
    if (selectedField == 'age') {
      $integerTermInput.prop('disabled', false);
      $integerTermInput.show();;
      $stringTermInput.prop('disabled', true);
      $stringTermInput.hide();;
      $stateTermInput.prop('disabled', true);
      $stateTermInput.hide();
    } else if (selectedField == 'state') {
      $integerTermInput.prop('disabled', true);
      $integerTermInput.hide();;
      $stringTermInput.prop('disabled', true);
      $stringTermInput.hide();;
      $stateTermInput.prop('disabled', false);
      $stateTermInput.show();
    } else {
      $integerTermInput.prop('disabled', true);
      $integerTermInput.hide();;
      $stringTermInput.prop('disabled', false);
      $stringTermInput.show();;
      $stateTermInput.prop('disabled', true);
      $stateTermInput.hide();
    }
  }
};

$(document).ready(function() {
  Segment.init();
})
