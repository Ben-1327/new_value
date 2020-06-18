// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
  $(".part_select").on("change", function() {
    let input = $(".part_select").val();
     $.ajax({
      type: 'POST',
      url: 'public/self_analyses/part_select',
      data: { step_select: input },
      dataType: 'json'
    });
    .done(function(data){
      $('.part_select option').remove();

      $(function(){
        $(".step_select").on("change", function() {
          let input = $(".step_select").val();
          $.ajax({
            type: 'POST',
            url: 'public/self_analyses/step_select',
            data: { question_put: input },
            dataType: 'json'
          });
          .done(function(data){
          })
        })
      });
    })
    .fail(function(){
            console.log("失敗");
    });
  });
});

// $(function() {
//   $(".step_select").on("change", function() {
//     let input = $(".step_select").val();
//      $.ajax({
//       type: 'POST',
//       url: 'public/self_analyses/step_select',
//       data: { question_put: input },
//       dataType: 'json'
//   });
//   .done(function(data){
//     })
//
// });
