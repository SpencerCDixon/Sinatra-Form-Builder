$(function() {

  var $counter = 1
  var $field = "<div class='form-inline'>\
    <div class='form-group'>\
      <label for='form_field_x'>Field</label>\
      <select class='form-control' id='form_field_x' name='form_fields[_x][type]'>\
        <option>Text</option>\
        <option>Phone</option>\
        <option>Email</option>\
        <option>Password</option>\
      </select>\
      <label for='form_field_name_x'>Name</label>\
      <input type='text' class='form-control' id='form_field_name_x' name='form_fields[_x][name]' placeholder='Name?' size='10'>\
      <label for='form_field_size_x'>Size</label>\
      <input type='text' class='form-control' id='form_field_size_x' name='form_fields[_x][size]' placeholder='#' size='2'>\
      <label for='form_field_place_x'>Placeholder?</label>\
      <input type='text' class='form-control' id='form_field_place_x' name='form_fields[_x][placeholder]' placeholder='Placeholder?' size=15'>\
    </div>\
  </div>";

  $(".add_field").on("click", function(e){
    e.preventDefault();
  });

  $(".add_field").click(function(){
    var new_field = $field.replace(/_x/g, "_" + $counter );
    $(new_field).insertBefore("#placeholder");
    $counter += 1;
  });

  var $featuresButton = $('#features');
  var $featuresShow = $('#show-features');
  $featuresShow.hide();

  $featuresButton.on("click", function(e){
    e.preventDefault();
    $featuresShow.toggle();
  });



  // main.js
  var client = new ZeroClipboard( document.getElementById("copy-button") );
  ZeroClipboard.config( { swfPath: 'ZeroClipboard.swf' }  );


  client.on( "ready", function( readyEvent ) {
  // alert( "ZeroClipboard SWF is ready!" );

  client.on( "aftercopy", function( event ) {
    // `this` === `client`
    // `event.target` === the element that was clicked
    event.target.style.display = "none";
    alert("Copied text to clipboard: " + event.data["text/plain"] );
  } );
} );



});
