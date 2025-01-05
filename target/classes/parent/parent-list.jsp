<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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

					<div class="mes">
					
						<%
						String successMessage = (String) session.getAttribute("message");
						if (successMessage != null) {
							out.println("<p class='success'>" + successMessage + "</p>");
							session.removeAttribute("message");
						}
						%>
					</div>

					<section class="content">
						<div id="sms-top-bar" class="row">
							<div id="screen-name">Parent List</div>
							<div id="action-buttons">
								<button type="button" onclick="window.location.href='new'" class="btn btn-info">
									<i class="fa fa-plus"></i>
									<span>New Parent</span>
								</button>
								<button type="button" onclick="window.location.href='exportExcel'" class="btn btn-success">
									<i class="fa fa-download" aria-hidden="true"></i>
									<span>Excel</span>
								</button>
								<button type="button" onclick="window.history.back()" class="btn btn-default btn-back">
									<i class="fa fa-reply"></i>
									<span>Back</span>
								</button>
							</div>
						</div>
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Parent List</h3>

								<div class="paging-info pull-right">
									<span>
										Showing
										<%=request.getAttribute("currentPage")%>
										to
										<%=request.getAttribute("currentItems")%>
										of
										<%=request.getAttribute("totalEntries")%>
										entries
									</span>
								</div>
							</div>
							<div class="box-body panel-primary table-responsive">

								<div class="paging-top">
									<div class="pull-left">
										<div class="alert-danger" id="noResultsMessage" style="display: none;">
											<i class="fa fa-exclamation-triangle"></i>
											<span>No matching records found!</span>
										</div>

										<nav aria-label="Page navigation" id="pagination-top">
											<ul class="pagination">
												<%
												Integer currentPage = (Integer) request.getAttribute("currentPage");
												Integer totalPages = (Integer) request.getAttribute("totalPages");
												%>

												<li class="page-item <%=(currentPage == 1 || totalPages == 1) ? "disabled" : ""%>">
													<a class="page-link <%=(currentPage == 1 || totalPages == 1) ? "not-allowed" : ""%>"
														href="<%=(currentPage == 1 || totalPages == 1) ? "#" : "?page=" + (currentPage - 1)%>"> Previous </a>
												</li>

												<%
												for (int i = 1; i <= totalPages; i++) {
												%>
												<li class="page-item <%=(currentPage == i) ? "active" : ""%>">
													<a class="page-link" href="?page=<%=i%>"><%=i%></a>
												</li>
												<%
												}
												%>

												<li class="page-item <%=(currentPage == totalPages || totalPages == 1) ? "disabled" : ""%>">
													<a class="page-link <%=(currentPage == totalPages || totalPages == 1) ? "not-allowed" : ""%>"
														href="<%=(currentPage == totalPages || totalPages == 1) ? "#" : "?page=" + (currentPage + 1)%>"> Next
													</a>
												</li>
											</ul>
										</nav>
									</div>
									<div class="pull-right">
										<button type="button" class="btn btn-info" id="searchBtn">
											<i class="fa fa-search"></i>
											<span>Search</span>
										</button>
										<button type="button" onclick="location.reload()" class="btn btn-warning">
											<i class="fa fa-refresh"></i>
											<span>Reset</span>
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

									</thead>
									<tbody>
										<tr>
											<td>
												<input type="text" name="filterParentName" class="form-control input-sm" placeholder="Any value">
											</td>
											<td>
												<input type="text" name="filterJrcoNo" class="form-control input-sm" placeholder="Any value">
											</td>
											<td>
												<input type="text" name="filterJasNo" class="form-control input-sm" placeholder="Any value">
											</td>
											<td>
												<input type="text" name="filterCompanyName" class="form-control input-sm" placeholder="Any value">
											</td>
											<td>
												<input type="text" name="filterCellPhone" class="form-control input-sm" placeholder="Any value">
											</td>
										</tr>
										<%
										List<String[]> parentList = (List<String[]>) request.getAttribute("parentList");
										if (parentList != null && !parentList.isEmpty()) {
											for (String[] parentlist : parentList) {
										%>
										<tr>
											<td align="left" class="uppercase">
												<a href="parentdetails?Id=<%=parentlist[5]%>"><%=parentlist[0]%></a>
											</td>
											<td align="center"><%=(parentlist[1] != null) ? parentlist[1] : ""%></td>
											<td align="center"><%=parentlist[2]%></td>
											<td align="left"><%=(parentlist[3] != null) ? parentlist[3] : ""%></td>
											<td align="center"><%=parentlist[4]%></td>
										</tr>
										<%
										}
										}
										%>
									</tbody>
								</table>

								<div class="pagination-bottom" id="pagination-bottom">
									<nav aria-label="Page navigation">
										<ul class="pagination">
											<%

											%>

											<li class="page-item <%=(currentPage == 1 || totalPages == 1) ? "disabled" : ""%>">
												<a class="page-link <%=(currentPage == 1 || totalPages == 1) ? "not-allowed" : ""%>"
													href="<%=(currentPage == 1 || totalPages == 1) ? "#" : "?page=" + (currentPage - 1)%>"> Previous </a>
											</li>

											<%
											for (int i = 1; i <= totalPages; i++) {
											%>
											<li class="page-item <%=(currentPage == i) ? "active" : ""%>">
												<a class="page-link" href="?page=<%=i%>"><%=i%></a>
											</li>
											<%
											}
											%>

											<li class="page-item <%=(currentPage == totalPages || totalPages == 1) ? "disabled" : ""%>">
												<a class="page-link <%=(currentPage == totalPages || totalPages == 1) ? "not-allowed" : ""%>"
													href="<%=(currentPage == totalPages || totalPages == 1) ? "#" : "?page=" + (currentPage + 1)%>"> Next </a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
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