function validateSelectParent() {
	const radios = document.getElementsByName("selectParent");
	let isChecked = false;

	for (const radio of radios) {
		if (radio.checked) {
			isChecked = true;
			selectedParentId = radio.value;
			break;
		}
	}

	if (!isChecked) {
		const box = document.querySelector(".box");
		if (!existRequire((box.parentNode), "messRequired")) {
			(box.parentNode).insertBefore(getDivRequire(null, "Please select a parent.", "messRequired"), box);
		}

	} else {
		sessionStorage.setItem("selectParent", selectedParentId);
		window.location.href = `student?astudS03=step2`;
	}
}

function sendIfStudent() {
	getGender();
	var arrayInfor = document.getElementsByTagName("input");

	for (let i = 0; i < arrayInfor.length; i++) {
		const input = arrayInfor[i];
		if (input.type === 'checkbox' || input.type === 'radio') {
			sessionStorage.setItem(input.id, input.checked);
		} else {
			sessionStorage.setItem(input.id, input.value);
		}
	}

	const selects = document.querySelectorAll("select");
	selects.forEach(select => {
		sessionStorage.setItem(select.id, select.value);
	});

	const textareas = document.querySelectorAll("textarea");
	textareas.forEach(textarea => {
		sessionStorage.setItem(textarea.id, textarea.value);
	});

	var arrInputsRequire = Array.prototype.slice.call(arrayInfor, 6, 12);
	arrInputsRequire.push(arrayInfor[14], arrayInfor[18]);

	if (checkRequireList(arrInputsRequire)) {
		
	window.location.href = `student?astudS03=step3&selectParent=${sessionStorage.getItem("selectParent")}`;

	}
}

document.addEventListener("DOMContentLoaded", function() {
	if (window.location.href.includes("student?astudS03=step3")) {
		loadFormData();

	}
});

function loadFormData() {
	const inputs = document.querySelectorAll("input, select, textarea");
	inputs.forEach(input => {
		const id = input.id;
		if (id) {
			const storedValue = sessionStorage.getItem(id);
			if (storedValue) {
				if (input.type === 'checkbox' || input.type === 'radio') {
					input.checked = storedValue === 'true';
					if (input.checked) {
						input.setAttribute('aria-checked', 'true');
						input.parentNode.classList.add('checked');
					} else {
						input.setAttribute('aria-checked', 'false');
						input.parentNode.classList.remove('checked');
					}
				} else {
					input.value = storedValue;
				}
			}
		}
	});
	const selectParentId = sessionStorage.getItem("selectParent");
	const selectParentInput = document.querySelector("input[name='selectParent']");

	if (selectParentId && selectParentInput) {
		selectParentInput.value = selectParentId;
	}
}

function getGender() {
	const gender = document.getElementsByName("gender");
	if (gender[0].checked && !gender[1].checked) {
		return true;
	} else {
		return false;
	}
}

function hasChar(str) {
	const regex = /^[a-zA-Z]+$/;
	return regex.test(str);
}

function isFutureDate(dateStr) {
	const dateParts = dateStr.split('/');
	if (dateParts.length !== 3) {
		return false;
	}
	const day = parseInt(dateParts[0], 10);
	const month = parseInt(dateParts[1], 10) - 1;
	const year = parseInt(dateParts[2], 10);

	const birthday = new Date(year, month, day);
	const today = new Date();

	return birthday > today;
}

function hasCharNum(str) {
	const regex = /[^a-zA-Z0-9]/;
	return regex.test(str);
}

function checkRequireList(arr) {
	var countWrong = 0;
	arr.forEach(function(tag, index) {
		const tagAdd = checkTagFather(tag, "input-group");
		hideRequire(tagAdd, "messRequired"); // Xóa các thông báo lỗi cũ
		if (!checkNull(tag)) {
			countWrong++;
		}
		if (index === 2 && !hasChar(tag.value)) {
			console.log(tag.value);
			if (!existRequire(tagAdd, "messRequired")) {
				tagAdd.appendChild(getDivRequire(tagAdd, "Name is included invalid character.", "messRequired"));
				countWrong++;
			}
		}
		if (index === 3 && !hasChar(tag.value)) {
					console.log(tag.value);
					if (!existRequire(tagAdd, "messRequired")) {
						tagAdd.appendChild(getDivRequire(tagAdd, "Name is included invalid character.", "messRequired"));
						countWrong++;
					}
				}
		if (index === 6 && isFutureDate(tag.value)) {
			console.log(tag.value);
			if (!existRequire(tagAdd, "messRequired")) {
				tagAdd.appendChild(getDivRequire(tagAdd, "Birthday cannot be a future date.", "messRequired"));
				countWrong++;
			}
		}
		if (index === 7 && hasCharNum(tag.value)) {
			console.log(tag.value);
			if (!existRequire(tagAdd, "messRequired")) {
				tagAdd.appendChild(getDivRequire(tagAdd, "Passport number contains invalid characters.", "messRequired"));
				countWrong++;
			}
		}
	});

	if (countWrong == 0) {
		return true;
	} else {
		return false;
	}
}

function checkNull(tag) {
	const tagAdd = checkTagFather(tag, "input-group");
	if (!tag.value || !tag.value.trim()) {
		if (!existRequire(tagAdd, "messRequired")) {
			tagAdd.appendChild(getDivRequire(tagAdd, "This field is required.", "messRequired"));
		}
		return false;
	} else {
		if (existRequire(tagAdd, "messRequired")) {
			hideRequire(tagAdd, "messRequired");
		}
		return true;
	}
}

function getDivRequire(tagAdd, mess, classadd) {
	const div = document.createElement("div");
	div.textContent = mess;
	div.className = classadd;
	if (tagAdd == null) { div.classList.add("blockRequired"); }
	else { tagAdd.parentNode.className = "highlightRequired"; }
	return div;
}

function hideRequire(tagAdd, className) {
	const div = tagAdd.querySelector(`div.${className}`);
	if (div) {
		tagAdd.parentNode.classList.remove("highlightRequired");
		div.remove();
	}
}

function existRequire(tagAdd, classname) {
	if (tagAdd.querySelector(`div.${classname}`)) { return true; }
	else { return false; }
}

function checkTagFather(tag, className) {
	if (tag.parentNode.classList.contains(className)) {
		return (tag.parentNode).parentNode; // If the parent element has class "input-group", return the grandparent.
	}
	return tag.parentNode; // If the parent does not have class "input-group", return the parent itself.
}

function showSuccessMessage(studentNo) {
	console.log("Hàm showSuccessMessage đã được gọi với studentNo:", studentNo);

	const box = document.querySelector(".box");
	if (box) {
		if (!existRequire(box.parentNode, "messSucsess")) {
			const message = `New student has been added. Student No = ${studentNo}`;
			box.parentNode.insertBefore(getDivRequire(null, message, "messSucsess"), box);
		}
	} else {
		console.log('Element .box not found');
	}
}


document.getElementById('index_save').addEventListener('submit', function() {
	const disabledInputs = document.querySelectorAll('input[disabled]');
	disabledInputs.forEach(input => input.removeAttribute('disabled'));
});