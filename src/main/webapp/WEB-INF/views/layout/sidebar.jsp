<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="main-sidebar">
	<div>
		<section class="sidebar">
			<div class="user-panel" style="background-color: #000;">
				<div class="pull-left image">
					<img src="${pageContext.request.contextPath}/assets/images/logoIVS.jpg" class="img-circle">
				</div>
				<div class="pull-left info" style="width: 175px;">
					<p class="upper">
						<a style="color: #fff">${sessionScope.fullName}</a>
					</p>
					<a style="display: inline-block;" class="pull-left">
						<i class="fa fa-circle text-success"></i>
						${sessionScope.roleName}
					</a>
					<a style="display: inline-block;" class="pull-right" href="${pageContext.request.contextPath}/logout">Logout</a>
				</div>
			</div>
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li>
						<input type="hidden" name="activeTabModuleId" value="" id="activeTabModuleId" />
						<input type="hidden" name="menuStatus" value="" id="menuStatus" />
					</li>


					<li class="menu-tab menu-tab-mini">
						<a href="#" data-toggle="tab">
							<span class="menu-tab-logo-mini">
								<i class="fa fa-th"></i>
							</span>
						</a>
					</li>

					<li class="menu-tab menu-tab-large active">
						<a href="#menu-tab-a" data-toggle="tab">
							<span class="menu-tab-logo-large">Academic</span>
						</a>
					</li>
					<li class="menu-tab menu-tab-large ">
						<a href="#menu-transport" data-toggle="tab">
							<span class="menu-tab-logo-large">Transport</span>
						</a>
					</li>
					<li class="menu-tab menu-tab-large ">
						<a href="#menu-master" data-toggle="tab">
							<span class="menu-tab-logo-large">Master</span>
						</a>
					</li>

				</ul>

				<div class="tab-content">

					<div class="tab-pane active" id="menu-tab-a">
						<ul class="sidebar-menu">

							<li class="treeview ${activeMenu == 'student' ? 'active' : ''}">
								<a>
									<i class="fa fa-user-circle"></i>
									<span>Student</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li id="new-student" class="${activeSubMenu == 'new-student' ? 'active' : ''}">
										<a href="${pageContext.request.contextPath}/student/new/step1">
											<i class="fa fa-user-plus"></i>
											<span>New Student</span>
										</a>
									</li>
									<li class="${activeSubMenu == 'student-list' ? 'active' : ''}">
										<a href="${pageContext.request.contextPath}/student/list">
											<i class="fa fa-list"></i>
											<span>Student List</span>
										</a>
									</li>
								</ul>
							</li>
							<li class="treeview">
								<a>
									<i class="fa-brands fa-google"></i>
									<span>Giro</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Giro Registered List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Giro Unregister List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Giro Terminated List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-share-from-square"></i>
											<span>Giro Export</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-upload"></i>
											<span>Giro Export for Bank</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-file-import"></i>
											<span>Giro Import</span>
										</a>
									</li>
								</ul>
							</li>

							<li class="treeview">
								<a>
									<i class="glyphicon glyphicon-list-alt"></i>
									<span>Receipt</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Tuition Fee Receipt List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Entrance Free Refund List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Entrance Free Refunded List</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a href="#">
									<i class="glyphicon glyphicon-th"></i>
									<span>Homeroom</span>
								</a>
							</li>

							<li>
								<a href="#">
									<i class="glyphicon glyphicon-transfer"></i>
									<span>Transfer</span>
								</a>
							</li>

							<li class="treeview">
								<a>
									<i class="fa-regular fa-rectangle-list"></i>
									<span>Invoice</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#">
											<i class="fa-solid fa-plus"></i>
											<span>New Invoice</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Tuition Fee Invoice List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Invoice Before Payment</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a href="#">
									<i class="fa-solid fa-language"></i>
									<span>English Class</span>
								</a>
							</li>

							<li class="treeview">
								<a>
									<i class="glyphicon glyphicon-tasks"></i>
									<span>Summary</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#">
											<i class="fa-regular fa-user"></i>
											<span>Student</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-bank"></i>
											<span>Collection</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-brands fa-google"></i>
											<span>Giro</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Cumulative</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Student Payment Infor</span>
										</a>
									</li>
								</ul>
							</li>

							<li class="treeview">
								<a>
									<i class="fa-brands fa-google-wallet"></i>
									<span>Misc</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Bank Swift Code List</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-check"></i>
											<span>TFEE Duplicate Check</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-share fa-flip-horizontal"></i>
											<span>Transfer Out</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-share"></i>
											<span>Transfer In</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa-solid fa-list-ul"></i>
											<span>Student Check</span>
										</a>
									</li>
								</ul>
							</li>


						</ul>
					</div>

					<!-- Nôi dung transport -->
					<div class="tab-pane " id="menu-transport">
						<ul class="sidebar-menu">

							<li class="treeview ">
								<a>
									<i class="fa fa-users"></i>
									<span>Transport</span>
									<span class="pull-right-container"> </span>
								</a>
							</li>

						</ul>
					</div>

					<!-- Nôi dung master -->
					<div class="tab-pane " id="menu-master">
						<ul class="sidebar-menu">

							<li class="treeview ${activeMenu == 'parent' ? 'active' : ''}">
								<a href="sidebartest.jsp">
									<i class="fa fa-users"></i>
									<span>Parent</span>
									<span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								<ul class="treeview-menu">
									<li class="${activeSubMenu == 'new-parent' ? 'active' : ''}">
										<a href="${pageContext.request.contextPath}/parent/new">
											<i class="fa fa-user-plus"></i>
											<span>New Parent</span>
										</a>
									</li>
									<li class="${activeSubMenu == 'parent-list' ? 'active' : ''}">
										<a href="${pageContext.request.contextPath}/parent/list">
											<i class="fa fa-list"></i>
											<span>Parent List</span>
										</a>
									</li>
								</ul>
							</li>

						</ul>
					</div>

				</div>
			</div>
		</section>
	</div>
</aside>
<!--   end : sidebar-menu -->