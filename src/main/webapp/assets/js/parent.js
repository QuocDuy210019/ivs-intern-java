document.addEventListener('DOMContentLoaded', function() {
	var formElement = document.querySelector('form');

	if (formElement) {
		formElement.addEventListener('submit', function(event) {
			var fields = [
				{ id: 'ParentSurNameEnglish', errorId: 'errorParentSurNameEnglish', labelFor: 'ParentSurNameEnglish' },
				{ id: 'ParentFirstNameEnglish', errorId: 'errorParentFirstNameEnglish', labelFor: 'ParentFirstNameEnglish' },
				{ id: 'ParentSurNameKanji', errorId: 'errorParentSurNameKanji', labelFor: 'ParentSurNameKanji' },
				{ id: 'ParentFirstNameKanji', errorId: 'errorParentFirstNameKanji', labelFor: 'ParentFirstNameKanji' },
				{ id: 'JasTypeId', errorId: 'errorJasTypeId', labelFor: 'JasTypeId' },
				{ id: 'JasNo', errorId: 'errorJasNo', labelFor: 'JasNo' },
				{ id: 'VisaTypeId', errorId: 'errorVisaTypeId', labelFor: 'VisaTypeId' },
				{ id: 'VisaNo', errorId: 'errorVisaNo', labelFor: 'VisaNo' },
				{ id: 'VisaExpiryDate', errorId: 'errorVisaExpiryDate', labelFor: 'VisaExpiryDate', groupClass: 'input-group' }
			];

			var isValid = true;

			fields.forEach(function(field) {
				var inputElement = document.getElementById(field.id);
				var errorMessage = document.getElementById(field.errorId);
				var labelElement = document.querySelector(`label[for="${field.labelFor}"]`);
				var groupElement = field.groupClass ? inputElement.closest(`.${field.groupClass}`) : null;

				if (inputElement.value.trim() === '') {
					errorMessage.style.display = 'block';
					inputElement.classList.add('error-input');
					labelElement.classList.add('error-label');

					if (groupElement) {
						groupElement.classList.add('error-group');
						var iconElement = groupElement.querySelector('.fa-calendar');
						if (iconElement) {
							iconElement.classList.add('error-icon');
						}
					}

					isValid = false;
				} else {
					errorMessage.style.display = 'none';
					inputElement.classList.remove('error-input');
					labelElement.classList.remove('error-label');

					if (groupElement) {
						groupElement.classList.remove('error-group');
						var iconElement = groupElement.querySelector('.fa-calendar');
						if (iconElement) {
							iconElement.classList.remove('error-icon');
						}
					}
				}
			});

			if (!isValid) {
				event.preventDefault();
			}
		});
	} else {
		console.error('Form element not found!');
	}
});
document.addEventListener('DOMContentLoaded', function() {
	var formElement = document.querySelector('form');

	if (formElement) {
		formElement.addEventListener('submit', function(event) {
			var fields = [
				{ id: 'ParentSurNameEnglish', errorId: 'errorParentSurNameEnglish', labelFor: 'ParentSurNameEnglish' },
				{ id: 'ParentFirstNameEnglish', errorId: 'errorParentFirstNameEnglish', labelFor: 'ParentFirstNameEnglish' },
			];

			var nameRegex = /^[a-zA-Z\s]+$/;
			var isValid = true;

			fields.forEach(function(field) {
				var inputElement = document.getElementById(field.id);
				var errorMessage = document.getElementById(field.errorId);
				var labelElement = document.querySelector(`label[for="${field.labelFor}"]`);

				if (inputElement.value.trim() === '') {
					errorMessage.style.display = 'block';
					errorMessage.textContent = 'This field is required.';
					inputElement.classList.add('error-input');
					labelElement.classList.add('error-label');
					isValid = false;
				} else if (!nameRegex.test(inputElement.value.trim())) {
					errorMessage.style.display = 'block';
					errorMessage.textContent = 'Name is included invalid character.';
					inputElement.classList.add('error-input');
					labelElement.classList.add('error-label');
					isValid = false;
				} else {
					errorMessage.style.display = 'none';
					inputElement.classList.remove('error-input');
					labelElement.classList.remove('error-label');
				}
			});

			if (!isValid) {
				event.preventDefault();
			}
		});
	} else {
		console.error('Form element not found!');
	}
});
document.addEventListener("DOMContentLoaded", function() {
	const scrollToTopButton = document.querySelector("#scrollToTop");

	function handleScroll() {
		if (document.documentElement.scrollTop > 200) {
			scrollToTopButton.style.display = 'block';
		} else {
			scrollToTopButton.style.display = 'none';
		}
	}

	window.addEventListener('scroll', handleScroll);

	scrollToTopButton.addEventListener('click', () => {
		document.documentElement.scrollTo({
			top: 0,
			behavior: 'smooth'
		});
	});
});
document.addEventListener("DOMContentLoaded", function() {
	function validateZipInput(inputId) {
		const inputField = document.getElementById(inputId);
		const errorMessage = "The subscription is expired. (error code: -13)";
		let alertShown = false;

		inputField.addEventListener("input", function() {
			this.value = this.value.replace(/[^0-9]/g, "");

			if (this.value.length >= 6) {
				if (!alertShown) {
					alertShown = true;
					setTimeout(function() {
						alert(errorMessage);
						alertShown = false;
					}, 300);
				}
				this.value = this.value.slice(0, 6);
			}
		});
	}

	validateZipInput("ResidenceZip");
	validateZipInput("MailingZip");
});



document.addEventListener("DOMContentLoaded", () => {
	$(document).ready(function() {

		function setPlaceholder(selector, placeholderText) {
			$(selector).on('mouseenter', function() {
				$(this).attr('placeholder', placeholderText);
			});

			$(selector).on('mouseleave', function() {
				$(this).attr('placeholder', '');
			});
		}

		setPlaceholder('#ResidenceZip', '______');
		setPlaceholder('#MailingZip', '______');

		function allowOnlyNumbers(selector) {
			$(selector).on('input', function(e) {

				$(this).val($(this).val().replace(/\D/g, ''));
			});
		}
		allowOnlyNumbers('#MailingZip');
		allowOnlyNumbers('#ResidenceZip');
	});
});

document.addEventListener("DOMContentLoaded", function() {
	/*document.getElementById("JasNo").addEventListener("blur", function() {
		const jasNo = this.value.trim();
		const errorMessage = document.getElementById("errorJasNo");

		// Kiểm tra rỗng
		if (!jasNo) {
			errorMessage.textContent = "This field is required.";
			errorMessage.style.display = "block";
			return;
		}

		// Gọi Servlet kiểm tra trùng lặp
		fetch(`/parent?jasNo=${encodeURIComponent(jasNo)}`)
			.then((response) => {
				if (!response.ok) {
					return response.json().then((err) => {
						throw new Error(err.error || "Error occurred.");
					});
				}
				return response.json();
			})
			.then((data) => {
				if (data.isDuplicate) {
					errorMessage.textContent = "Jas No is duplicated.";
					errorMessage.style.display = "block";
				} else {
					errorMessage.style.display = "none";
				}
			})
			.catch((error) => {
				console.error("Error:", error.message);
			});
	});*/
});