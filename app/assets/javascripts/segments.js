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
  },
  listenConditionFieldSelect: function() {
    $(document).on('change', '[data-condition-field-select]', function() {
      Segment._setConditionNameSelectOptions(this);
      Segment._setConditionTermInput(this);
    });
    $('[data-condition-field-select]').trigger('change');
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
    var $stringTermInput  = $('[data-condition-string-term-input]');
    var $stateTermInput   = $('[data-condition-state-term-input]');
    var $integerTermInput = $('[data-condition-integer-term-input]');
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
