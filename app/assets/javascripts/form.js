$(document).ready(function(){
  $('form').on('click', '#delete_picture', function(e){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('.image_show_form').hide();
    e.preventDefault();
  });
});
