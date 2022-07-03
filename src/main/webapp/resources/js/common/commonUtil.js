var CommonUtil = {
	func: {
		scrollObj : undefined,
		openSlideMenu: function(){
			$("#sideMenu_btn").off().click(function () {
				CommonUtil.func.openSlide();
			});

			$("#tent").off().click(function () {
				CommonUtil.func.closeSlide();
			});
	    },
		openSlide: function() {
			$('#body').addClass('show_menu');
			$('#tent').fadeIn('fast');
			$('.sideMenu_lyr').show('slide');
			$('.aside_lyr_close').fadeIn('fast');
		},

		closeSlide : function(){
			$('.aside_lyr_close').fadeOut('fast');
			$('#body').removeClass('show_menu');
			$('#tent').fadeOut('fast');
			$('.sideMenu_lyr').hide('slide');
		},
	}
};