var CommonUtil = {
	func: {
		scrollObj : undefined,
		openSlideMenu: function(){
			$("#sideMenu_btn").click(function () {
				CommonUtil.func.openSlide();
			});
	    },

		openSlide: function() {
			$('#body').addClass('show_menu');
			$('#tent').fadeIn('fast');
			$('.sideMenu_lyr').show('slide', {direction: 'right'}, 1000);
			$('.aside_lyr_close').fadeIn('fast');
		}
	}
};