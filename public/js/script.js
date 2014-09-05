$(function() {

  var $counter = 1
  var $field =
  "<div class='form-inline'>\
    <div class='form-group'>\
      <label for='form_field_x'>Type of field</label>\
      <select class='form-control' id='form_field_x' name='form_fields[_x][type]'>\
        <option>Text</option>\
        <option>Phone</option>\
        <option>Email</option>\
        <option>Password</option>\
      </select>\
      <label for='form_field_name_x'>Name Of First Form Field</label>\
      <input type='text' class='form-control' id='form_field_name_x' name='form_fields[_x][name]' placeholder='What field should be called'>\

    </div>\
  </div>";

  $("#add_field").on("click", function(e){
    e.preventDefault();
  });

  $("#add_field").click(function(){
    var new_field = $field.replace(/_x/g, "_" + $counter );
    $(new_field).insertBefore("#placeholder");
    $counter += 1;
  });

});
