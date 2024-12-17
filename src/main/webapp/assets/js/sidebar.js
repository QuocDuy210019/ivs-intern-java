document.addEventListener("DOMContentLoaded", function() {
	// ĐIỀU HƯỚNG TAB
	const buttons = document.querySelectorAll(".tab-button");
	const tabs = document.querySelectorAll(".tab-content");

	buttons.forEach(button => {
		button.addEventListener("click", function() {
			// Xóa lớp "active" khỏi tất cả các tab và nút
			tabs.forEach(tab => tab.classList.remove("active"));
			buttons.forEach(btn => btn.classList.remove("active"));

			// Lấy ID của tab được chọn
			const tabName = button.getAttribute("data-tab");
			const selectedTab = document.getElementById(tabName);

			// Hiển thị tab được chọn nếu tồn tại
			if (selectedTab) {
				selectedTab.classList.add("active");
				button.classList.add("active");
			} else {
				console.error(`Tab với ID "${tabName}" không tồn tại.`);
			}
		});
	});

	// DROPDOWN MENU
	var treeviewItems = document.querySelectorAll('.treeview');

	treeviewItems.forEach(function(item) {
	    // Sự kiện click chính cho mỗi mục .treeview
	    item.addEventListener('click', function(event) {
	        // Dừng sự kiện lan xuống các phần tử con
	        event.stopPropagation();

	        // Đóng tất cả các menu khác trước khi mở menu hiện tại
	        treeviewItems.forEach(function(otherItem) {
	            if (otherItem !== item) {
	                var otherSubmenu = otherItem.querySelector('.treeview-menu');
	                if (otherSubmenu) {
	                    otherSubmenu.classList.remove('show-menu');
	                    otherItem.classList.remove('active');
	                }
	                var otherIcon = otherItem.querySelector('.fa-angle-left');
	                if (otherIcon) {
	                    otherIcon.classList.remove('rotate-icon');
	                }
	            }
	        });

	        // Toggle mở/đóng cho mục hiện tại
	        var submenu = item.querySelector('.treeview-menu');
	        if (submenu) {
	            submenu.classList.toggle('show-menu');
	            item.classList.toggle('active');
	        }

	        var icon = item.querySelector('.fa-angle-left');
	        if (icon) {
	            icon.classList.toggle('rotate-icon');
	        }
	    });

	    // Ngăn sự kiện click lan truyền khi nhấp vào các phần tử bên trong menu con
	    var submenu = item.querySelector('.treeview-menu');
	    if (submenu) {
	        submenu.addEventListener('click', function(event) {
	            event.stopPropagation(); // Dừng sự kiện để menu không tự động đóng lại
	        });
	    }
	});




	// BẬT TẮT SIDEBAR
	const toggleButton = document.querySelector(".toggle-menu");
	const boxSidebar = document.querySelector(".sidebar");
	const logoHeader = document.querySelector(".logo-header");

	let isSidebarCollapsed = false; // Đặt trạng thái ban đầu là không thu nhỏ, tức là mở sidebar

	// Khi trang vừa tải, Sidebar sẽ ở trạng thái mở
	window.addEventListener("DOMContentLoaded", function() {
		if (boxSidebar && logoHeader && !isSidebarCollapsed) {
			boxSidebar.classList.remove("sidebar-collapsed");
			logoHeader.classList.remove("sidebar-collapsed");
		}
	});

	// Sự kiện click vào toggle để thu nhỏ hoặc mở rộng sidebar (cố định)
	if (toggleButton && boxSidebar && logoHeader) {
		toggleButton.addEventListener("click", function() {
			if (isSidebarCollapsed) {
				// Nếu đang thu nhỏ, mở rộng lại sidebar
				boxSidebar.classList.remove("sidebar-collapsed");
				logoHeader.classList.remove("sidebar-collapsed");
			} else {
				// Nếu đang mở rộng, thu nhỏ sidebar
				boxSidebar.classList.add("sidebar-collapsed");
				logoHeader.classList.add("sidebar-collapsed");
			}
			isSidebarCollapsed = !isSidebarCollapsed; // Đảo trạng thái
		});

		// Khi di chuột vào sidebar, và menu đang thu nhỏ, mở rộng tạm thời sidebar
		boxSidebar.addEventListener("mouseenter", function() {
			if (isSidebarCollapsed) { // Chỉ mở rộng nếu sidebar đang bị thu nhỏ
				boxSidebar.classList.remove("sidebar-collapsed");
				logoHeader.classList.remove("sidebar-collapsed");
			}
		});

		// Khi di chuột ra khỏi sidebar, thu nhỏ lại nếu menu đang ẩn và chưa được cố định
		boxSidebar.addEventListener("mouseleave", function() {
			if (isSidebarCollapsed) { // Nếu sidebar chưa được mở rộng cố định
				boxSidebar.classList.add("sidebar-collapsed");
				logoHeader.classList.add("sidebar-collapsed");
			}
		});
	}

	// Hàm đóng tất cả các dropdown menu
	function closeDropdownMenus() {
		const treeviewMenus = document.querySelectorAll('.treeview-menu');
		treeviewMenus.forEach(function(menu) {
			menu.style.display = 'none'; // Đóng tất cả các menu con
		});
	}


	// Tìm tất cả các liên kết trong phần tử có class 'treeview'
	var treeviewLinks = document.querySelectorAll('.treeview > a');

	// Lặp qua từng liên kết để thêm sự kiện click
	treeviewLinks.forEach(function(link) {
		link.addEventListener('click', function(event) {
			// Lấy phần tử menu con (ul hoặc li) sau liên kết
			var menu = this.nextElementSibling;

			// Kiểm tra xem menu đã được mở rộng chưa
			if (menu.style.maxHeight) {
				// Nếu menu đang mở rộng, thu gọn nó
				menu.style.maxHeight = null;
			} else {
				// Nếu menu đang thu gọn, mở rộng nó
				menu.style.maxHeight = menu.scrollHeight + "px";
			}
		});
	});


});

