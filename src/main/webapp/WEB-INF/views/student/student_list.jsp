<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<%@ include file="../layout/head.jsp"%>
<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->
	<form id="index" name="index" action="/sms/astud/astudS01/index" method="post" enctype="multipart/form-data"
		class="form-vertical form-label-stripped">
		<fieldset>
			<div class="wrapper">
				<!-- start : main-header -->
				<%@ include file="../layout/header.jsp"%>
				<!--   end : main-header -->
				<!-- start : sidebar-menu -->
				<%@ include file="../layout/sidebar.jsp"%>
				<!--   end : sidebar-menu -->
				<!-- start : content-wrapper -->
				<div class="content-wrapper">
					<!-- start : main-content -->
					<section class="content">
						<!-- start : screen title and action buttons -->
						<div id="sms-top-bar" class="row">
							<div id="screen-name">Student List</div>
							<div id="action-buttons">
								<a href="${pageContext.request.contextPath}/new_student_step1" style="color: white;">
									<button type="button" class="btn btn-info">
										<i class="fa fa-plus-circle" aria-hidden="true"></i>
										<span>New Student</span>
									</button>
								</a>
								<button type="button" class="btn btn-success">
									<i class="fa fa-download" aria-hidden="true"></i>
									<span>Excel</span>
								</button>
								<a href="${pageContext.request.contextPath}/home" style="color: white;">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span>Back</span>
									</button>
								</a>
							</div>
						</div>
						<!--   end : screen title and action buttons -->
						<!-- start : list -->

						<%
						// Lấy thông báo từ session
						String deleteMessage = (String) session.getAttribute("deleteMessage");

						// Xóa thông báo khỏi session sau khi hiển thị
						if (deleteMessage != null) {
							session.removeAttribute("deleteMessage");
						%>
						<!-- Hiển thị thông báo -->
						<div class="alert alert-info actionmessages" role="alert"
							style="margin-bottom: 20px; color: white; background-color: #00c0ef; text-align: left;">
							<%=deleteMessage%>
						</div>
						<%
						}
						%>


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
									${totalStudents}
									<span>of</span>
									${totalStudents}
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
											<%@ include file="../layout/pagination.jsp"%>
										</nav>
									</div>

									<div class="pull-right">
										<button type="button" class="btn btn-info">
											<i class="fa fa-search"></i>
											<span>Search</span>
										</button>
										<button type="button" class="btn btn-warning">
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
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
												</select>
											</td>
											<td>
												<select name="filterCurrentHomeroomNo" id="index_filterCurrentHomeroomNo"
													class="list-filter form-control input-sm">
													<option value="">Any value</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
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
										<%
										List<String[]> result_StudentList = (List<String[]>) request.getAttribute("result_StudentList");
										if (result_StudentList != null) {
											for (String[] record : result_StudentList) {
										%>
										<tr>
											<td align="center">
												<a href="student?astudS03=student_detail&studentNo=<%=record[0]%>"><%=record[0]%></a>
											</td>
											<td align="left"><%=record[1]%></td>
											<td align="center"><%=record[2]%></td>
											<td align="center"><%=record[3]%></td>
											<td align="center">
												<span class="label label-success"><%=record[4]%></span>
											</td>
											<td align="center"><%=record[5]%></td>
											<td align="center">
												<span class="label label-warning"><%=record[6]%></span>
											</td>
											<td align="center">
												<span class="label label-warning">Not Assigned</span>
											</td>
											<td align="center"><%=record[8]%></td>
											<td align="center">
												<font color="#FF0000">
													<span class="label label-danger">Unpaid</span>
												</font>
											</td>
										</tr>
										<%
										}
										}
										%>
									</tbody>

								</table>
								<!-- start : pagination bottom -->
								<div class="pagination-bottom">
									<div class="pull-left">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<%
												if (currentPage > 1) {
												%>
												<li>
													<a href="student?astudS03=student_list&page=<%=currentPage - 1%>" aria-label="Previous">
														<span aria-hidden="true">Previous</span>
													</a>
												</li>
												<%
												} else {
												%>
												<li class="disabled">
													<a aria-label="Previous">
														<span aria-hidden="true">Previous</span>
													</a>
												</li>
												<%
												}
												if (currentPage > pageWindow + 1) {
												%>
												<li>
													<a href="student?astudS03=student_list&page=1">1</a>
												</li>
												<%
												if (currentPage > pageWindow + 2) {
												%>
												<li class="disabled">
													<span>...</span>
												</li>
												<%
												}
												}
												for (int i = Math.max(1, currentPage - pageWindow); i <= Math.min(totalPages, currentPage + pageWindow); i++) {
												%>
												<li class="<%=(i == currentPage) ? "active" : ""%>">
													<a href="student?astudS03=student_list&page=<%=i%>"><%=i%></a>
												</li>
												<%
												}
												if (currentPage < totalPages - pageWindow) {
												if (currentPage < totalPages - pageWindow - 1) {
												%>
												<li class="disabled">
													<span>...</span>
												</li>
												<%
												}
												%>
												<li>
													<a href="student?astudS03=student_list&page=<%=totalPages%>"><%=totalPages%></a>
												</li>
												<%
												}
												if (currentPage < totalPages) {
												%>
												<li>
													<a href="student?astudS03=student_list&page=<%=currentPage + 1%>" aria-label="Next">
														<span aria-hidden="true">Next</span>
													</a>
												</li>
												<%
												} else {
												%>
												<li class="disabled">
													<a aria-label="Next">
														<span aria-hidden="true">Next</span>
													</a>
												</li>
												<%
												}
												%>
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
				<!--   end : content-wrapper -->
			</div>
		</fieldset>
	</form>
	<%
	// Lấy giá trị từ session
	Boolean isAdd = (Boolean) session.getAttribute("isAdd");
	Integer studentNo = (Integer) session.getAttribute("studentNo");

	// Kiểm tra nếu là trang thêm và studentNo không null
	if (isAdd != null && isAdd && studentNo != null) {
	%>
	<script>
		window.onload = function() {
			var studentNo =
	<%=session.getAttribute("studentNo")%>
		;
			showSuccessMessage(studentNo);
		};
	</script>
	<%
	// Xóa các attribute sau khi sử dụng
	session.removeAttribute("isAdd");
	session.removeAttribute("studentNo");
	}
	%>

	<script>
		// Biến toàn cục lưu trữ trạng thái hiện tại hoặc sự kiện
		var eventId = 'index'; // Xác định trạng thái hoặc trang hiện tại, ở đây là trang "index"
		var submitted = false; // Biến kiểm tra trạng thái form, ban đầu chưa được gửi (false)
	</script>
	<%@ include file="../layout/custom_script.jsp"%>
	<%@ include file="../layout/script.jsp"%>
</body>
</html>