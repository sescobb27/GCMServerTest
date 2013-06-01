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
// function initialize (section) {
//   section.find('.type').each(function(index){
//     $(this).on('click', function(event){
//       var new_sec = $("<section class='category_type'></section>")
//       $(this).append(new_sec);
//       // var type = $(this).data('name');
//       // var father = $(this);
//       // $.ajax("/category_type/"+type, {
//       //   cache: true,
//       //   success: function(result) {
//       //     father.append("<section class='category_type'></section>");
//       //     var container = father.find('.category_type')
//       //     container.append(result);
//       //     container.remove('h1');
//       //     container.show();
//       //     container.on('mouseenter',function(event){
//       //       container.slideToggle();
//       //     });
//       //   }
//       // });
//     });
//   });
// }
// function modify_response (section) {
//     $('.wrapper').css({'width':'50%', 'margin':'0px auto'})
//     section.removeClass('choose-types').addClass('show-types');
//     initialize(section);
// }
// $(document).ready(function() {
//   var loaded = null;
//     $('.choose-types').on('click', function(){
//       if (loaded == null) {
//         loaded = $.ajax(
//             '/types',{
//             cache: true,
//             success: function(result){
//             $('.choose-types').html(result)
//             modify_response($('.choose-types'))
//             }
//         }
//         );
//       }
//     });
// });
function eventos (section) {
  section.on('click', function(){
      var type = $(this).data('name');
      $(this).append($("<section class='category_type'></section>"))
      $(this).find('category_type').load('/category_type/'+type)
    });
}
$(document).ready(function() {
  var already_loaded = null;
    $('.choose-types').on('click', function(){
      if (already_loaded == null)
      {
        $(this).addClass('show-types').removeClass('choose-types');
        var show_type = $(this);
        already_loaded = $.ajax('/types',
          {
            cache: true,
            success: function(result){
              show_type.html(result);
              eventos(show_type.find('.type'));
            }
          });
        $('.wrapper').css({'width':'20%', 'margin':'0px auto'});
      }
    });
});