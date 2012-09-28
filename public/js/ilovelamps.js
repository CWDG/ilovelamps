$(function(){
  console.log("I Love Lamps!");


  var $buyForm = $('#buy-lamp');

  if($buyForm.length > 0) {
    console.log("Found a buy form");
    $('#quantity').on('blur', function(e) {
      console.log("Quantity blurred.");
      var new_quantity = parseInt($('#quantity').val());
      var price = parseFloat($('#price').val().substring(1));
      var total = new_quantity * price;

      $('#total').val("$" + total);
    });
  }
});
