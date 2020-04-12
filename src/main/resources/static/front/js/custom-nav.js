	// home2 header
	 var navbar=$('.main_header_area .header_menu');
    var nav_offset_top = $('.header_menu').offset().top + 85;
    /*-------------------------------------------------------------------------------
	  Navbar 
	-------------------------------------------------------------------------------*/

	navbar.affix({
	  offset: {
	    top: nav_offset_top,
	  }
	});


	navbar.on('affix.bs.affix', function() {
		if (!navbar.hasClass('affix')){
			navbar.addClass('animated slideInDown');
		}
	});
    
    navbar.on('affixed-top.bs.affix', function() {
	  	navbar.removeClass('animated slideInDown');
	});



	
"use strict";


/*======== Doucument Ready Function =========*/
jQuery(document).ready(function () {

      // slicknav
    /**
     * Slicknav - a Mobile Menu
     */
    var $slicknav_label;
    $('.responsive-menu').slicknav({
      duration: 500,
      easingOpen: 'easeInExpo',
      easingClose: 'easeOutExpo',
      closedSymbol: '<i class="fa fa-plus"></i>',
      openedSymbol: '<i class="fa fa-minus"></i>',
      prependTo: '#slicknav-mobile',
      allowParentLinks: true,
      label:"" 
    });

    var $slicknav_label;
    $('#responsive-menu').slicknav({
      duration: 500,
      easingOpen: 'easeInExpo',
      easingClose: 'easeOutExpo',
      closedSymbol: '<i class="fa fa-plus"></i>',
      openedSymbol: '<i class="fa fa-minus"></i>',
      prependTo: '#slicknav-mobile',
      allowParentLinks: true,
      label:"" 
    });

    
    /**
     * Sticky Header
     */
        
    $(window).scroll(function(){

      if( $(window).scrollTop() > 10 ){

        $('.navbar').addClass('navbar-sticky-in')

      } else {
        $('.navbar').removeClass('navbar-sticky-in')
      }

    })
    
    /**
     * Main Menu Slide Down Effect
     */
     
    var selected = $('#navbar li');
    // Mouse-enter dropdown
    selected.on("mouseenter", function() {
        $(this).find('ul').first().stop(true, true).delay(350).slideDown(500, 'easeInOutQuad');
    });

    // Mouse-leave dropdown
    selected.on("mouseleave", function() {
        $(this).find('ul').first().stop(true, true).delay(100).slideUp(150, 'easeInOutQuad');
    });

    /**
     *  Arrow for Menu has sub-menu
     */
    if ($(window).width() > 992) {
      $(".navbar-arrow ul ul > li").has("ul").children("a").append("<i class='arrow-indicator fa fa-angle-right'></i>");
    }


});



