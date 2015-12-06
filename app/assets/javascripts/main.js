$(document).ready(function() {

  // product edit page

    // set up page on load
    $(".add-option-form").hide();


    // functionality

    $(".add-option-toggler").click(function() {
      $(".add-option-form").slideToggle(450, function() {
      });
    });



});
