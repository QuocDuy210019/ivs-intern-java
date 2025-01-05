<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="dev.studentmanager.util.DateUtils"%>
<%@ page import="dev.studentmanager.dao.DropdownOptionsDAO"%>
<%@ page import="dev.studentmanager.dao.DatabaseConnection"%>

<!DOCTYPE html>
<html>
<%@ include file="../layout/head.jsp"%>
<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<form id="index" name="index" action="" method="post" enctype="multipart/form-data" class="form-vertical form-label-stripped">
		<%
		String[] studentDetails = (String[]) request.getAttribute("studentDetails");
		%>
		<fieldset>
			<div class="wrapper">
				<%@ include file="../layout/header.jsp"%>
				<aside class="main-sidebar">
					<%@ include file="../layout/sidebar.jsp"%>
				</aside>
				<div class="content-wrapper">
					<section class="content">
						<div id="sms-top-bar" class="row">
							<div id="screen-name">STUDENT DETAILS</div>
							<div id="action-buttons">
								<button type="button" class="btn btn-info">
									<i class="fa fa-cog"></i>
									Exemption
								</button>
								<button type="button" class="btn btn-success">
									<i class="glyphicon glyphicon-list-alt"></i>
									Admission
								</button>
								<button type="button" class="btn btn-danger" onclick="window.location.href = '${pageContext.request.contextPath}/student?astudS03=delete_student&studentNo=${studentDetails[0]}'">
									<i class="fa fa-times"></i>
									Delete
								</button>
								<button type="button" class="btn btn-warning" onclick="window.location.href = '${pageContext.request.contextPath}/student?astudS03=edit_student&studentNo=${studentDetails[0]}';">
									<i class="fa fa-pencil-square-o"></i>
									Edit
								</button>
								<a href="${pageContext.request.contextPath}/student?astudS03=student_list" style="color: white;">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span> Back</span>
									</button>
								</a>
							</div>
						</div>

						<%
						// Lấy thông báo từ session
						String updateMessage = (String) session.getAttribute("updateMessage");

						// Xóa thông báo khỏi session sau khi hiển thị
						if (updateMessage != null) {
							session.removeAttribute("updateMessage");
						%>
						<!-- Hiển thị thông báo -->
						<div class="alert alert-info actionmessages" role="alert" style="margin-bottom: 20px; color: white; background-color: #00c0ef; text-align: left;">
							<%=updateMessage%>
						</div>
						<%
						}
						%>

						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Student Information</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<!-- Student No -->
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_studentNo">Student No </label>
											<div class="  controls">
												<input type="text" name="studentNo" value="<%=studentDetails[0]%>" disabled="disabled" id="index_studentNo" class="form-control" />
											</div>
										</div>
									</div>

									<%
									String applicationDate = studentDetails[1]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedApplicationDate = DateUtils.formatDate(applicationDate); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-4">
										<div class="form-group">
											<label class="control-label" for="index_applicationDate">Application Date </label>
											<div class="controls">
												<input type="text" name="applicationDate" value="<%=formattedApplicationDate%>" disabled="disabled" id="index_applicationDate" class="form-control datepicker" />
											</div>
										</div>
									</div>


									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_approvedDate">Approved Date </label>
											<div class="  controls">
												<input type="text" name="approvedDate" value="<%=studentDetails[2]%>" disabled="disabled" id="index_approvedDate" class="form-control" placeholder="Unapproved" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">

									<%
									String admissionDate = studentDetails[3]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedAdmissionDate = DateUtils.formatDate(admissionDate); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_admissionDate">Admission Date </label>
											<div class="  controls">
												<input type="text" name="admissionDate" value="<%=formattedAdmissionDate%>" disabled="disabled" id="index_admissionDate" class="form-control datepicker" />
											</div>
										</div>
									</div>

									<%
									DropdownOptionsDAO admissionSchoolDAO = new DropdownOptionsDAO();
									List<String> admissionSchool = admissionSchoolDAO.getAllAdmissionSchool();
									String selectedAdmissionSchool = (studentDetails[4] != null) ? studentDetails[4] : null;
									%>
									<div class="col-md-2">
										<div class="form-group ">
											<label class="  control-label" for="index_schoolId">Admission School </label>
											<div class="  controls">
												<select name="schoolId" disabled="disabled" id="index_schoolId" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->
													<%
													for (String admission_School : admissionSchool) {
														String selected = (admission_School.equals(selectedAdmissionSchool)) ? "selected" : "";
													%>
													<option value="<%=admission_School%>" <%=selected%>><%=admission_School%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>
									<!-- /Admission  School -->
									<div class="col-md-2">
										<div class="form-group ">
											<label class="  control-label" for=""></label>
											<div class="controls">
												<div class="form-groupicheck-style pull-left">
													<div class=" "></div>
													<div class="  controls">
														<div class="checkbox">

															<label for="globalClass">
																<input type="checkbox" name="globalClass" value="true" disabled="disabled" id="globalClass" class="icheck-style pull-left" <%="Yes".equals(studentDetails[5]) ? "checked" : ""%> />
																<input type="hidden" id="__checkbox_globalClass" name="__checkbox_globalClass" value="true" disabled="disabled" />
																Global Class
															</label>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<%
									DropdownOptionsDAO admissionGradeDAO = new DropdownOptionsDAO();
									List<String> admissionGrade = admissionGradeDAO.getAllAdmissionGrade();
									String selectedAdmissionGradeDAO = (studentDetails[6] != null) ? studentDetails[6] : null;
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_admissionGrade">Admission Grade </label>
											<div class="  controls">
												<select name="admissionGrade" disabled="disabled" id="index_admissionGrade" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->
													<%
													for (String admission_Grade : admissionGrade) {
														String selected = (admission_Grade.equals(selectedAdmissionGradeDAO)) ? "selected" : "";
													%>
													<option value="<%=admission_Grade%>" <%=selected%>><%=admission_Grade%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_currentGrade">Current Grade </label>
											<div class="  controls">
												<input type="text" name="currentGrade" value="<%=studentDetails[7]%>" disabled="disabled" id="index_currentGrade" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_currentHomeroomNo">Home Room </label>
											<div class="  controls">
												<input type="text" name="currentHomeroomNo" value="<%=studentDetails[8]%>" disabled="disabled" id="index_currentHomeroomNo" class="form-control" placeholder="Not Assigned" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_status">Status </label>
											<div class="  controls">
												<input type="text" name="status" value="<%=studentDetails[9]%>" disabled="disabled" id="index_status" class="form-control" placeholder="Unpaid" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_studentAlphaSurName">Surname (English) </label>
											<div class="  controls">
												<input type="text" name="studentAlphaSurName" value="<%=studentDetails[10]%>" disabled="disabled" id="index_studentAlphaSurName" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_studentAlphaFirstName">First Name (English) </label>
											<div class="  controls">
												<input type="text" name="studentAlphaFirstName" value="<%=studentDetails[11]%>" disabled="disabled" id="index_studentAlphaFirstName" class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiSurName">Surname (Kanji) </label>
											<div class="  controls">
												<input type="text" name="studentKanjiSurName" value="<%=studentDetails[12]%>" disabled="disabled" id="index_studentKanjiSurName" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiFirstName">First Name (Kanji) </label>
											<div class="  controls">
												<input type="text" name="studentKanjiFirstName" value="<%=studentDetails[13]%>" disabled="disabled" id="index_studentKanjiFirstName" class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
										<div class="form-group">
											<label class="control-label" for="index_studentKanaSurName">Surname (Kana)</label>
											<div class="controls">
												<input type="text" name="studentKanaSurName" value="<%=studentDetails[14] != null ? studentDetails[14] : ""%>" disabled="disabled" id="index_studentKanaSurName" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-6">
										<div class="form-group">
											<label class="control-label" for="index_studentKanaFirstName">First Name (Kana)</label>
											<div class="controls">
												<input type="text" name="studentKanaFirstName" value="<%=studentDetails[15] != null ? studentDetails[15] : ""%>" disabled="disabled" id="index_studentKanaFirstName" class="form-control" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<!--  Date of Birth -->
									<%
									String birthday = studentDetails[16]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedBirthday = DateUtils.formatDate(birthday); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-3">
										<div class="form-group ">
											<label class="  control-label" for="index_birthDay">Birthday </label>
											<div class="  controls">
												<input type="text" name="birthDay" value="<%=formattedBirthday%>" disabled="disabled" id="index_birthDay" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<div class="form-group col-md-3">
										<label>Gender</label>
										<br>
										<input type="radio" name="gender" id="index_gendertrue" disabled="disabled" class="icheck-style" <%="Male".equals(studentDetails[17]) ? "checked" : ""%> />
										<label for="index_gendertrue" class="icheck-style">Male</label>
										<input type="radio" name="gender" id="index_genderfalse" disabled="disabled" class="icheck-style" <%="Female".equals(studentDetails[17]) ? "checked" : ""%> />
										<label for="index_genderfalse" class="icheck-style">Female</label>
									</div>


									<%
									DropdownOptionsDAO languageAbilityDAO = new DropdownOptionsDAO();
									List<String> languageAbility = languageAbilityDAO.getAllLanguageAbility();
									String selectedLanguageAbilityDAO = (studentDetails[18] != null) ? studentDetails[18] : null;
									%>
									<div class="col-md-3">
										<div class="form-group ">
											<label class="  control-label" for="index_langAbility">Language Ability </label>
											<div class="  controls">
												<select name="langAbility" disabled="disabled" id="index_langAbility" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->
													<%
													for (String language_Ability : languageAbility) {
														String selected = (language_Ability.equals(selectedLanguageAbilityDAO)) ? "selected" : "";
													%>
													<option value="<%=language_Ability%>" <%=selected%>><%=language_Ability%></option>
													<%
													}
													%>

												</select>
											</div>
										</div>
									</div>
									<%
									String internalTransferDate = studentDetails[19]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedInternalTransferDate = DateUtils.formatDate(internalTransferDate); // Gọi phương thức định dạng ngày
									%>
									<div class="form-group col-md-3">
										<div class="form-group ">
											<label class="  control-label" for="index_transferDate">Internal Transfer Date </label>
											<div class="  controls">
												<input type="text" name="transferDate" value="<%=formattedInternalTransferDate%>" disabled="disabled" id="index_transferDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<!-- Nationality -->
									<%
									// Tạo đối tượng DAO và lấy danh sách quốc gia từ bảng nationality_tbl
									DropdownOptionsDAO nationality1DAO = new DropdownOptionsDAO();
									List<String> nationalities1 = nationality1DAO.getAllNationalities(); // Lấy tất cả các quốc gia
									String selectedNationality1 = (studentDetails[20] != null) ? studentDetails[20] : null; // Nếu có giá trị trong database thì chọn quốc gia, nếu không để null
									%>

									<div class="col-md-4">
										<div class="form-group">
											<label class="control-label" for="index_nationality1">Nationality1</label>
											<div class="controls">
												<select name="nationality1" disabled="disabled" id="index_nationality1" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->

													<!-- Hiển thị tất cả quốc gia từ cơ sở dữ liệu -->
													<%
													// Lặp qua danh sách quốc gia và chỉ hiển thị quốc gia hợp lệ
													for (String nationality1 : nationalities1) {
														// Kiểm tra nếu quốc gia trong danh sách trùng với giá trị đã chọn (Nếu studentDetails[20] có giá trị hợp lệ)
														String selected = (nationality1.equals(selectedNationality1)) ? "selected" : "";
													%>
													<option value="<%=nationality1%>" <%=selected%>><%=nationality1%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>


									<%
									// Tạo đối tượng DAO và lấy danh sách quốc gia từ bảng nationality_tbl
									DropdownOptionsDAO nationality2DAO = new DropdownOptionsDAO();
									List<String> nationalities2 = nationality2DAO.getAllNationalities(); // Lấy tất cả các quốc gia
									String selectedNationality2 = (studentDetails[21] != null) ? studentDetails[21] : null; // Nếu có giá trị trong database thì chọn quốc gia, nếu không để null
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_nationality2">Nationality2 </label>
											<div class="  controls">
												<select name="nationality2" disabled="disabled" id="index_nationality2" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->

													<!-- Hiển thị tất cả quốc gia từ cơ sở dữ liệu -->
													<%
													// Lặp qua danh sách quốc gia và chỉ hiển thị quốc gia hợp lệ
													for (String nationality2 : nationalities2) {
														// Kiểm tra nếu quốc gia trong danh sách trùng với giá trị đã chọn (Nếu studentDetails[20] có giá trị hợp lệ)
														String selected = (nationality2.equals(selectedNationality2)) ? "selected" : "";
													%>
													<option value="<%=nationality2%>" <%=selected%>><%=nationality2%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>


									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_passportNo">Passport No </label>
											<div class="  controls">
												<input type="text" name="passportNo" value="<%=studentDetails[22]%>" disabled="disabled" id="index_passportNo" class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Passport No -->
								</div>
								<div class="row">


									<%
									DropdownOptionsDAO visaTypeDAO = new DropdownOptionsDAO();
									List<String> visaType = visaTypeDAO.getAllVisaType();
									String selectedVisaType = (studentDetails[23] != null) ? studentDetails[23] : null;
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaType">Visa Type </label>
											<div class="  controls">
												<select name="visaType" disabled="disabled" id="index_visaType" class="form-control">
													<option value=""></option>
													<!-- Option trống nếu không có giá trị -->
													<%
													for (String visa_Type : visaType) {
														String selected = (visa_Type.equals(selectedVisaType)) ? "selected" : "";
													%>
													<option value="<%=visa_Type%>" <%=selected%>><%=visa_Type%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaN0">Visa No </label>
											<div class="  controls">
												<input type="text" name="visaN0" value="<%=studentDetails[24] != null ? studentDetails[24] : ""%>" disabled="disabled" id="index_visaN0" class="form-control inputmask" data-inputmask="&quot;mask&quot;: &quot;9999 9999 9999 9999&quot;" />
											</div>
										</div>
									</div>

									<%
									String expiryDate = studentDetails[25]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedExpiryDate = DateUtils.formatDate(expiryDate); // Gọi phương thức định dạng ngày
									%>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaExpiryDate">Expiry Date </label>
											<div class="  controls">
												<input type="text" name="visaExpiryDate" value="<%=formattedExpiryDate%>" disabled="disabled" id="index_visaExpiryDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /  Expiry Date -->
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolName">Previous School Name </label>
											<div class="  controls">
												<input type="text" name="prevSchoolName" value="<%=studentDetails[26]%>" disabled="disabled" id="index_prevSchoolName" class="form-control" />
											</div>
										</div>
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolTel">Telephone No </label>
											<div class="  controls">
												<input type="text" name="prevSchoolTel" value="<%=studentDetails[28]%>" disabled="disabled" id="index_prevSchoolTel" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-8">
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolAddress">Previous School Address </label>
											<div class="  controls">
												<textarea name="prevSchoolAddress" cols="" rows="5" disabled="disabled" id="index_prevSchoolAddress" class="form-control"><%=studentDetails[27]%></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group ">
											<label class="  control-label" for="index_officeRemark">Office Remark </label>
											<div class="  controls">
												<textarea name="officeRemark" cols="" rows="3" disabled="disabled" id="index_officeRemark" class="form-control"><%=studentDetails[29]%></textarea>
											</div>
										</div>
									</div>
								</div>

								<%
								DropdownOptionsDAO giroDAO = new DropdownOptionsDAO();
								List<String> giroList = giroDAO.getAllGiro(); // Danh sách 'Giro' và 'Non Giro'
								String selectedGiro = (studentDetails[30] != null) ? studentDetails[30] : "Giro"; // Giá trị mặc định là 'Giro'
								%>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_nonGiro">Giro </label>
											<div class="  controls">
												<select name="nonGiro" disabled="disabled" id="index_nonGiro" class="form-control">
													<%
													for (String giro : giroList) {
														String selected = (giro.equals(selectedGiro)) ? "selected" : "";
													%>
													<option value="<%=giro%>" <%=selected%>><%=giro%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<!-- Documents -->
									<%
									String documents = (studentDetails[31] != null) ? studentDetails[31] : "";
									List<String> selectedDocuments = Arrays.asList(documents.split(",\\s*"));
									%>
									<div class="form-group col-md-8">
										<label>Documents</label>
										<div>
											<div class="form-groupicheck-style pull-left">
												<div class="controls">
													<div class="checkbox">
														<label for="index_prevSchoolDocYroku">
															<input type="checkbox" name="prevSchoolDocYroku" value="Yoroku" id="index_prevSchoolDocYroku" class="icheck-style pull-left" <%=selectedDocuments.contains("Yoroku") ? "checked" : ""%> disabled="disabled" />
															Yoroku
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class="controls">
													<div class="checkbox">
														<label for="index_prevSchoolDocHealth">
															<input type="checkbox" name="prevSchoolDocHealth" value="Doc Health" id="index_prevSchoolDocHealth" class="icheck-style pull-left" <%=selectedDocuments.contains("Doc Health") ? "checked" : ""%> disabled="disabled" />
															Doc Health
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class="controls">
													<div class="checkbox">
														<label for="index_prevSchoolDocTeeth">
															<input type="checkbox" name="prevSchoolDocTeeth" value="Doc Teeth" id="index_prevSchoolDocTeeth" class="icheck-style pull-left" <%=selectedDocuments.contains("Doc Teeth") ? "checked" : ""%> disabled="disabled" />
															Doc Teeth
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class="controls">
													<div class="checkbox">
														<label for="index_prevSchoolDocKyokasho">
															<input type="checkbox" name="prevSchoolDocKyokasho" value="Soshina" id="index_prevSchoolDocKyokasho" class="icheck-style pull-left" <%=selectedDocuments.contains("Soshina") ? "checked" : ""%> disabled="disabled" />
															Soshina
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class="controls">
													<div class="checkbox">
														<label for="index_prevSchoolDocZaisho">
															<input type="checkbox" name="prevSchoolDocZaisho" value="Zaisho" id="index_prevSchoolDocZaisho" class="icheck-style pull-left" <%=selectedDocuments.contains("Zaisho") ? "checked" : ""%> disabled="disabled" />
															Zaisho
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- /Documents -->
								</div>
								<div class="row">
									<div class="box-header with-border">
										<h3 class="box-title">Parent Information</h3>
									</div>
									<div class="box-body">
										<div class="row">
											<!-- Student No -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameAlpha">Parent Name (Alpha) </label>
													<div class="  controls">
														<input type="text" name="parentNameAlpha" value="<%=studentDetails[32]%>" disabled="disabled" id="index_parentNameAlpha" class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameKana">Parent Name (Kana) </label>
													<div class="  controls">
														<input type="text" name="parentNameKana" value="<%=studentDetails[33]%>" disabled="disabled" id="index_parentNameKana" class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<!-- Res Phone -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentAddress1">Parent Address </label>
													<div class="  controls">
														<input type="text" name="parentAddress1" value="<%=studentDetails[34]%>" disabled="disabled" id="index_parentAddress1" class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentCompanyName">Company Name </label>
													<div class="  controls">
														<input type="text" name="parentCompanyName" value="<%=studentDetails[35]%>" disabled="disabled" id="index_parentCompanyName" class="form-control" />
													</div>
												</div>
											</div>
											<!-- /Company Name -->
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_busJrcoNo">JRCO NO (Alpha) </label>
													<div class="  controls">
														<input type="text" name="busJrcoNo" value="<%=studentDetails[36]%>" disabled="disabled" id="index_busJrcoNo" class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_jassociatNo">JAS NO </label>
													<div class="  controls">
														<input type="text" name="jassociatNo" value="<%=studentDetails[37]%>" disabled="disabled" id="index_jassociatNo" class="form-control" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</fieldset>
	</form>
	<script>
		// Biến toàn cục lưu trữ trạng thái hiện tại hoặc sự kiện
		var eventId = 'index'; // Xác định trạng thái hoặc trang hiện tại, ở đây là trang "index"
		var submitted = false; // Biến kiểm tra trạng thái form, ban đầu chưa được gửi (false)
	</script>
	<%@ include file="../layout/custom_script.jsp"%>
	<%@ include file="../layout/script.jsp"%>
</body>
</html>