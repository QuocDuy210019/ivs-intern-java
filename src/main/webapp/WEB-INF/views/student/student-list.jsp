<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<%@ include file="../layout/head.jsp"%>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->

	<form action="" method="post" enctype="multipart/form-data" class="form-vertical form-label-stripped">
		<fieldset>

			<div class="wrapper">

				<%@ include file="../layout/header.jsp"%>

				<!-- start : sidebar-menu -->

				<%@ include file="../layout/sidebar.jsp"%>

				<!-- start : content-wrapper -->
				<div class="content-wrapper">

					<!-- start : main-content -->

					<section class="content">
						<!-- start : screen title and action buttons -->
						<div id="sms-top-bar" class="row">
							<div id="screen-name">Student List</div>
							<div id="action-buttons">
								<a href="new-student-step-1">
									<button type="button" class="btn btn-info">
										<i class="fa fa-plus-circle" aria-hidden="true"></i>
										<span>New Student</span>
									</button>
								</a>
								<button type="button" class="btn btn-success">
									<i class="fa fa-download" aria-hidden="true"></i>
									<span>Excel</span>
								</button>
								<a href="home">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span>Back</span>
									</button>
								</a>
							</div>
						</div>
						<!--   end : screen title and action buttons -->

						<!-- start : list -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<!-- start : list title -->
								<h3 class="box-title">Student List</h3>
								<!--   end : list title -->
								<!-- start : pagination info -->


								<div class="pagination-info pull-right">


									<span>Showing</span>
									1
									<span>to</span>
									7
									<span>of</span>
									7
									<span>entries</span>

								</div>
								<!--   end : pagination info -->
							</div>
							<!-- start : list content -->
							<div class="box-body panel-primary table-responsive">
								<!-- start : pagination top -->

								<div class="pagination-top">
									<div class="pull-left">
										<nav aria-label="Page navigation">
											<div id="paginationAnchor" style="position: absolute; top: -70px; left: 0;"></div>
											<ul class="pagination">
												<li class="disabled">
													<a aria-label="Previous">
														<span aria-hidden="true">Previous</span>
													</a>
												</li>
												<li class="active">
													<a>1</a>
												<li class="disabled">
													<a aria-label="Next">
														<span aria-hidden="true">Next</span>
													</a>
												</li>
											</ul>
										</nav>
									</div>
									<div class="pull-right">
										<button type="button" class="btn btn-info btn-search">
											<i class="fa fa-search"></i>
											<span>Search</span>
										</button>
										<button type="button" class="btn btn-warning btn-reset">
											<i class="fa fa-refresh"></i>
											<span>Reset</span>
										</button>
									</div>
								</div>
								<!--   end : pagination top -->
								<table class="table table-bordered table-striped">
									<colgroup>
										<col style="width: 8%">
										<col style="width: 20%">
										<col style="width: 10%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 8%">
									</colgroup>
									<thead>
										<!-- start : list header -->
										<tr class="bg-aqua">
											<th>Student No</th>
											<th>Name</th>
											<th>School</th>
											<th>Adm Grade</th>
											<th>
												Global
												<br />
												Class
											</th>
											<th>Gender</th>
											<th>
												Current
												<br />
												Grade
											</th>
											<th>Homeroom</th>
											<th>
												Admission
												<br />
												Date
											</th>
											<th>Status</th>
										</tr>
										<!--   end : list header -->
										<!-- start : list filter -->
										<tr>
											<td>
												<input type="text" name="filterStudentNo" maxlength="6" value="" id="index_filterStudentNo"
													class="list-filter form-control input-sm" placeholder="Any value" />
											</td>
											<td>
												<input type="text" name="filterStudentName" value="" id="index_filterStudentName"
													class="list-filter form-control input-sm" placeholder="Any value" />
											</td>
											<td>
												<select name="filterSchool" id="index_filterSchool" class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="1">Clementi</option>
													<option value="2">Changi</option>
													<option value="3">West Coast</option>
												</select>
											</td>
											<td></td>
											<td>
												<select name="filterGlobalClass" id="index_filterGlobalClass" class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="1">Yes</option>
													<option value="0">No</option>
												</select>
											</td>
											<td></td>
											<td>
												<select name="filterCurrentGrade" id="index_filterCurrentGrade" class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>

												</select>
											</td>
											<td>
												<select name="filterCurrentHomeroomNo" id="index_filterCurrentHomeroomNo"
													class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>

												</select>
											</td>
											<td>
												<input type="text" name="filterAdmDate" value="" id="index_filterAdmDate"
													class="list-filter form-control input-sm" placeholder="Any value" />
											</td>
											<td>
												<select name="filterStatus" id="index_filterStatus" class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="N">Unpaid</option>
													<option value="P">Paid</option>
													<option value="A">Approved</option>

												</select>
											</td>
										</tr>
										<!--   end : list filter -->
									</thead>
									<tbody>
										<!-- start : list body -->
										<tr>
											<td align="center">
												<a> 210019 </a>
											</td>
											<td align="left">QUOC DUY</td>
											<td align="center">NOT</td>
											<td align="center">1</td>
											<td align="center"></td>
											<td align="center">MALE</td>
											<td align="center">
												<span class="label label-warning">Not Assigned</span>
											</td>
											<td align="center">
												<span class="label label-warning">Not Assigned</span>
											</td>
											<td align="center">31/08/2003</td>
											<td align="center">
												<font color="#FF0000">
													<span class="label label-danger">Unpaid</span>
												</font>
											</td>
										</tr>

										<!--   end : list body -->
									</tbody>
								</table>
								<!-- start : pagination bottom -->

								<div class="pagination-bottom">
									<div class="pull-left">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<li class="disabled">
													<a aria-label="Previous">
														<span aria-hidden="true">Previous</span>
													</a>
												</li>
												<li class="active">
													<a>1</a>
												<li class="disabled">
													<a aria-label="Next">
														<span aria-hidden="true">Next</span>
													</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>

								<!--   end : pagination bottom -->
							</div>
							<!--   end : list content -->
						</div>
						<!--   end : list -->

					</section>
					<!--   end : main-content -->
				</div>
			</div>
		</fieldset>
	</form>

	<%@include file="../layout/script.jsp"%>

</body>

</html>