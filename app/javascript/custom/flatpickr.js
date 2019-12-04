var addDatePickerToClass = function() {
	flatpickr(".datepicker", {
		altInput: true,
		altFormat: "j F, Y",
		dateFormat: "Y-m-d",
	});
};

document.addEventListener("turbolinks:load", addDatePickerToClass);

document.addEventListener("turbolinks:load", function () {
	$('body').on("reLoadJS", addDatePickerToClass);
});



