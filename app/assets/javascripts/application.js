// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function initialize (section) {
  section.find('.type').each(function(index){
    $(this).on('click', function(event){
      var type = $(this).data('name');
      $.ajax("/category_type/"+type, {
        cache: true,
        success: function(result) {
          $(this.body).append(result);
        }
      });
    });
  });
}
function modify_response (section) {
    $('.wrapper').css({'width':'50%', 'margin':'0px auto'})
    section.removeClass('choose-types').addClass('show-types');
    initialize(section);
}
$(document).ready(function() {
    $('.choose-types').on('click', function(){
        $.ajax(
            '/types',{
            cache: true,
            success: function(result){
            $('.choose-types').html(result)
            modify_response($('.choose-types'))
            }
        }
        );
    });
    $(".type").on("click", function(event) {
    $.ajax("/category_type/Restaurant", {
        data: { type: event.target.getAttribute('data-name') },
        cache: true,
        success: function(result) {
          $(this).appendChild(result);
        }
  });
});
});