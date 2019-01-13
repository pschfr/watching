// Waits for the DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
	// Attach to the proper select tag
	const sortTag = document.getElementById('sort');

	// Get URL parameters from window.location
	const urlParams = new URLSearchParams(window.location.search);

	// If a sort not has been selected,
	if (urlParams.get('sort') == null) {
		// select the default option.
		sortTag.value = '';
	} else {
		// Otherwise, select the respective option.
		sortTag.value = urlParams.get('sort');
	}

	// And if the user picks a different sort,
	sortTag.addEventListener('change', function() {
		// redirect to the proper sort.
		document.location.replace(`/?sort=${sortTag.value}`);
	});
}, false);
