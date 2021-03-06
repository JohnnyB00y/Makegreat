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
//= require jquery
//= require jquery-ui/widget
//= require jquery-ui/widgets/sortable
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $("#links_wrapper").sortable({
    update: function(e, ui) {
      $.ajax({
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize'),
        });
      }
  });
});

$( function() {
  $( "#links_wrapper" ).sortable({
    placeholder: "ui-state-highlight"
  });
  $( "#links_wrapper" ).disableSelection();
} );
