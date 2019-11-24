var addChosenToClass = function() {
	$('.add-chosen').chosen();
	$('.chosen-select').chosen({
		allow_single_deselect: true,
		no_results_text:      'No results matched',
		disable_search_threshold: 10
	});
};

document.addEventListener("turbolinks:load", addChosenToClass);

document.addEventListener("turbolinks:load", function () {
	$('body').on("reLoadJS", addChosenToClass);
});
