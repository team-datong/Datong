// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize
//= require jquery_ujs
//= require tether
//= require_tree
//= require moment 
//= require fullcalendar


$( document ).ready(function(){
    $(".button-collapse").sideNav();
});

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
});

// Some jquery script to change a class when resizing to smaller than 992 or larger than 992

$( window ).on('load resize', function() {
    var width = $( window ).width();
    if ( width > 992 ) {
        $( 'ul#mobile-menu' ).removeClass('side-nav');
        $( 'ul#mobile-menu' ).addClass('right hide-on-med-and-down');
        $( 'ul#mobile-menu' ).css('transform', '');
    } else {
        $( 'ul#mobile-menu' ).addClass('side-nav');
        $( 'ul#mobile-menu' ).removeClass('right hide-on-med-and-down');
    }
});
