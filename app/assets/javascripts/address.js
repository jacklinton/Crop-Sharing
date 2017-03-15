$(document).ready(function() {
  var addressPicker = new AddressPicker();
  
  $('.address').typeahead(null, {
    displayKey: 'description',
    source: addressPicker.ttAdapter()
  });
});