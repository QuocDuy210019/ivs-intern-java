<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<title>The Japanese School Singapore</title>
<%@ include file="layout/head.jsp"%>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->

	<form action="" method="post" enctype="multipart/form-data"
		class="form-vertical form-label-stripped">
		<fieldset>

			<div class="wrapper">

				<%@ include file="layout/header.jsp"%>

				<!-- start : sidebar-menu -->

				<%@ include file="layout/sidebar.jsp"%>

				<!-- start : content-wrapper -->
				<div class="content-wrapper">

					<!-- start : main-content -->

					<section class="content">

						<!-- start : screen title and action buttons -->
						<div id="sms-top-bar" class="row">
							<div id="screen-name">HOMEPAGE</div>
							<div id="action-buttons"></div>
						</div>
						<!--   end : screen title and action buttons -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<!-- start : list title -->
								<h3 class="box-title">Message Board List</h3>
								<!--   end : list title -->
							</div>
							<div class="box-body panel-primary table-responsive">
								<table class="table table-bordered table-striped">
									<colgroup>
										<col class="col-md-3">
										<col class="col-md-6">
										<col class="col-md-3">
									</colgroup>
									<thead>
										<tr class="bg-aqua">
											<th>Date</th>
											<th>Message</th>
											<th>Author</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
						<div class="box box-primary">
							<div class="box-header with-border">
								<!-- start : list title -->
								<h3 class="box-title">Students Without Proper Parents
									Information Under Master Table</h3>
								<!--   end : list title -->
							</div>
							<div class="box-body panel-primary table-responsive">
								<table class="table table-bordered table-striped">
									<colgroup>
										<col class="col-md-1">
										<col class="col-md-2">
										<col class="col-md-2">
										<col class="col-md-2">
										<col class="col-md-2">
										<col class="col-md-2">
										<col class="col-md-2">
									</colgroup>
									<thead>
										<tr class="bg-aqua">
											<th>Student No</th>
											<th>Sur Name</th>
											<th>Last Name</th>
											<th>Grade/HomeRoom</th>
											<th>School</th>
											<th>Update Username</th>
											<th>Update Date</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
					</section>

					<!--   end : main-content -->

				</div>

			</div>

		</fieldset>
	</form>

	<%@include file="layout/script.jsp"%>

</body>

</html>