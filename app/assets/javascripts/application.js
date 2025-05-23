// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require rails-ujs

$(document).on('turbolinks:load', function() {
    $('#search').on('input', function() {
      var searchTerm = $(this).val();
      if (searchTerm.length > 0) {
        $.ajax({
          url: '/search',
          method: 'GET',
          data: {
            exersize: searchTerm
          },
          success: function(data) {
            $('#results-list').html(data);
          }
        });
      } else {
        $('#results-list').empty();
      }
    });
  });
  