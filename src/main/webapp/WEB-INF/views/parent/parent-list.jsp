<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<%@ include file="../layout/head.jsp"%>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->

	<form class="form-vertical form-label-stripped">
		<fieldset>

			<div class="wrapper">

				<%@ include file="../layout/header.jsp"%>

				<!-- start : sidebar-menu -->

				<%@ include file="../layout/sidebar.jsp"%>

				<!-- start : content-wrapper -->
				<div class="content-wrapper">

					<!-- start : main-content -->

					<section class="content">
						<div id="sms-top-bar" class="row">
							<div id="screen-name">Parent List</div>
							<div id="action-buttons">
								<button type="button" class="btn btn-info">
									<i class="fa fa-plus"></i> <span>New Parent</span>
								</button>
								<button type="button" class="btn btn-default btn-back">
									<i class="fa fa-reply"></i> <span>Back</span>
								</button>
							</div>
						</div>

						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Parent List</h3>
								<div class="pagination-info pull-right">
									<span>Showing</span> 1 <span>to</span> 17 <span>of</span> 17 <span>entries</span>

								</div>
								<!--   end : pagination info -->
							</div>
							<!-- start : list content -->
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
								<table class="table table-bordered table-striped">
									<colgroup>
										<col style="width: 25%">
										<col style="width: 12%">
										<col style="width: 12%">
										<col style="width: 39%">
										<col style="width: 12%">
									</colgroup>
									<thead>
										<tr class="bg-aqua">
											<th>Parent Name</th>
											<th>Jrco No</th>
											<th>JAS No</th>
											<th>Company Name</th>
											<th>Tel</th>
										</tr>
										<tr>
											<td><input type="text" name="filterParentName" value=""
												id="index_filterParentName"
												class="list-filter form-control input-sm"
												placeholder="Any value" /></td>
											<td><input type="text" name="filterJrcoNo" value=""
												id="index_filterJrcoNo"
												class="list-filter form-control input-sm"
												placeholder="Any value" /></td>
											<td><input type="text" name="filterJasNo" value=""
												id="index_filterJasNo"
												class="list-filter form-control input-sm"
												placeholder="Any value" /></td>
											<td><input type="text" name="filterCompanyName" value=""
												id="index_filterCompanyName"
												class="list-filter form-control input-sm"
												placeholder="Any value" /></td>
											<td><input type="text" name="filterResPhone" value=""
												id="index_filterResPhone"
												class="list-filter form-control input-sm"
												placeholder="Any value" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td align="left"><a>JOHN STEVEN</a></td>
											<td align="center"></td>
											<td align="center">003</td>
											<td align="left"></td>
											<td align="center"></td>
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
							<!--   end : list content -->
						</div>
						<!--   end : list -->

					</section>

					<!--   end : main-content -->

				</div>
				<!--   end : content-wrapper -->
			</div>
		</fieldset>
	</form>

	<%@include file="../layout/script.jsp"%>

</body>

</html>