var addSortableToAssigment = function() {
	Sortable.create(packagesList, {
		ghostClass: 'ghost',
		onUpdate: function (e) {
			let data = this.toArray();
			mydata = {
			  assigment: [data]
			}
			$.ajax({
				url: e.target.getAttribute('data-url'),
				type: "PATCH",
				data: mydata
			})
		}
	});
};

document.addEventListener("turbolinks:load", function () {
	addSortableToAssigment();

	$('body').on('reLoadJS', function() {
		addSortableToAssigment();
	});
});
