document.addEventListener('DOMContentLoaded', () => {
	document.getElementById('searchBtn').addEventListener('click', () => {
		const filters = Array.from(document.querySelectorAll('table tbody tr:first-child input'))
			.map(input => input.value.toLowerCase());

		const rows = Array.from(document.querySelectorAll('table tbody tr')).slice(1);

		let hasMatch = false;
		let visibleRowsCount = 0;

		rows.forEach(row => {
			const cells = row.querySelectorAll('td');
			let matches = true;

			filters.forEach((filter, index) => {
				if (filter && !cells[index].textContent.toLowerCase().includes(filter)) {
					matches = false;
				}
			});

			if (matches) {
				row.style.display = '';
				hasMatch = true;
				visibleRowsCount++;
			} else {
				row.style.display = 'none';
			}
		});

		const paginationTop = document.getElementById('pagination-top');
		const paginationBottom = document.getElementById('pagination-bottom');
		const noResultsMessage = document.getElementById('noResultsMessage');
		const entriesInfo = document.querySelector('.paging-info span');

		if (hasMatch) {
			entriesInfo.textContent = `Showing 1 to ${visibleRowsCount} of ${visibleRowsCount} entries`;
			entriesInfo.parentElement.style.display = '';
			paginationTop.style.display = '';
			paginationBottom.style.display = '';
			noResultsMessage.style.display = 'none';
		} else {
			entriesInfo.parentElement.style.display = 'none';
			paginationTop.style.display = 'none';
			paginationBottom.style.display = 'none';
			noResultsMessage.style.display = 'block';
		}
	});
});