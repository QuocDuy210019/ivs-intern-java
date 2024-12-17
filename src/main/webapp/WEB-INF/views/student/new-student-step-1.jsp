<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<%@ include file="../layout/head.jsp"%>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->

	<form action="" method="post" enctype="multipart/form-data"
		class="form-vertical form-label-stripped">
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
							<div id="screen-name">NEW STUDENT</div>
							<div id="action-buttons">
								<a href="${pageContext.request.contextPath}/student/new/step2">
									<button type="button" class="btn btn-info">
										Next <i class="glyphicon glyphicon-arrow-right"></i>
									</button>
								</a>
								
								<a href="${pageContext.request.contextPath}/home">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span>Back</span>
									</button>
								</a>
								
							</div>
						</div>
						<div>
							<!--   end : screen title and action buttons -->
							<!-- start : Step by step -->
							<ul class="nav nav-pills nav-justified thumbnail setup-panel">
								<li class="active"><a>
										<h4 class="list-group-item-heading">Step 1</h4>
										<p class="list-group-item-text">Select Parent</p>
								</a></li>
								<li class="disabled"><a>
										<h4 class="list-group-item-heading">Step 2</h4>
										<p class="list-group-item-text">Input Student Information</p>
								</a></li>
								<li class="disabled"><a>
										<h4 class="list-group-item-heading">Step 3</h4>
										<p class="list-group-item-text">Confirm</p>
								</a></li>
							</ul>
						</div>
						<!-- end : Step by step -->
						<!-- start : Select Parent -->

						<div class="box box-primary">
							<div class="box-header  with-border">
								<h3 class="box-title">Select Parent</h3>
								<!-- start : list pagination top -->
								<div class="pagination-info pull-right">
									<span>Showing</span> 1 <span>to</span> 17 <span>of</span> 17 <span>entries</span>

								</div>
								<!--   end : list pagination top -->
							</div>
							<!-- /.box-header -->
							<!-- Main info -->
							<div class="box-body panel-primary table-responsive">


								<div class="pagination-top">
									<div class="pull-left">
										<nav aria-label="Page navigation">

											<div id="paginationAnchor"
												style="position: absolute; top: -70px; left: 0;"></div>

											<ul class="pagination">
												<li class="disabled"><a aria-label="Previous"> <span
														aria-hidden="true">Previous</span></a></li>
												<li class="active"><a>1</a>
												<li class="disabled"><a aria-label="Next"> <span
														aria-hidden="true">Next</span></a></li>
											</ul>
										</nav>

									</div>
									<div class="pull-right">
										<button type="button" class="btn btn-info btn-search">
											<i class="fa fa-search"></i> <span>Search</span>
										</button>
										<button type="button" class="btn btn-warning btn-reset">
											<i class="fa fa-refresh"></i> <span>Reset</span>
										</button>
									</div>
								</div>
								<table
									class="table table-bordered table-striped data-table display">
									<colgroup>
										<col style="width: 5%">
										<col style="width: 25%">
										<col style="width: 15%">
										<col style="width: 10%">
										<col style="width: 35%">
										<col style="width: 10%">
									</colgroup>
									<thead>
										<tr class="bg-aqua">
											<th style="text-align: center;"></th>
											<th style="text-align: center;">PARENT NAME</th>
											<th style="text-align: center;">JRCO NO</th>
											<th style="text-align: center;">JAS NO</th>
											<th style="text-align: center;">COMPANY NAME</th>
											<th style="text-align: center;">TEL</th>
										</tr>
										<tr>
											<td></td>
											<td><input type="text" name="filParentName" value=""
												id="index_filParentName"
												class="form-control input-sm list-filter" /></td>
											<td><input type="text" name="filJrcoNo" value=""
												id="index_filJrcoNo"
												class="form-control input-sm list-filter" /></td>
											<td><input type="text" name="filJasNo" value=""
												id="index_filJasNo"
												class="form-control input-sm list-filter" /></td>
											<td><input type="text" name="filCompanyName" value=""
												id="index_filCompanyName"
												class="form-control input-sm list-filter" /></td>
											<td><input type="text" name="filTel" value=""
												id="index_filTel" class="form-control input-sm list-filter" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="5" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="2" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="5" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="2" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="5" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="2" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="5" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="2" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="5" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
										<tr>
											<td class="text-center"><input type="radio"
												name="parentID" value="2" /></td>
											<td style="text-align: left;">JOHN STEVEN</td>
											<td style="text-align: center;"></td>
											<td style="text-align: center;">003</td>
											<td style="text-align: left;"></td>
											<td style="text-align: center;"></td>
										</tr>
									</tbody>
								</table>


								<div class="pagination-bottom">
									<div class="pull-left">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<li class="disabled"><a aria-label="Previous"> <span
														aria-hidden="true">Previous</span></a></li>
												<li class="active"><a>1</a>
												<li class="disabled"><a aria-label="Next"> <span
														aria-hidden="true">Next</span></a></li>
											</ul>
										</nav>
									</div>
								</div>

							</div>
							<!-- /.box-body -->
						</div>
						<!--   end : Select Parent -->

					</section>
					<!--   end : main-content -->
				</div>
			</div>

		</fieldset>
	</form>

	<%@include file="../layout/script.jsp"%>

</body>

</html>