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
	<!-- start : wrapper -->
	<form action="${pageContext.request.contextPath}/student" method="post" class="form-vertical form-label-stripped">
		<%
		String[] studentDetails = (String[]) request.getAttribute("studentDetails");
		%>
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
						<div id="sms-top-bar" class="row">
							<div id="screen-name">EDIT STUDENT (Confirm)</div>
							<div id="action-buttons">
								<button type="submit" class="btn btn-warning">
									<i class="fa fa fa-check-square-o"></i>
									Save
								</button>
								<a href="student?astudS03=edit_student&studentNo=<%=studentDetails[0]%>" style="color: white;">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span> Back</span>
									</button>
								</a>
							</div>
						</div>
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
												<input type="hidden" name="astudS03" value="update_student">
												<input type="hidden" name="StudentNo" value="<%=studentDetails[0]%>">
												<input type="text" name="" value="<%=studentDetails[0]%>" disabled="disabled" id="index_studentNo" class="form-control">
											</div>
										</div>
									</div>
									<!-- /Student No -->
									<!-- Application Date -->
									<%
									String applicationDate = studentDetails[1]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedApplicationDate = DateUtils.formatDate(applicationDate); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="ApplicationDate">Application Date </label>
											<div class="  controls">

												<div class="input-group">
													<input type="text" name="ApplicationDate" disabled="disabled" value="<%=formattedApplicationDate%>" class="form-control datepicker">
												</div>
											</div>
										</div>
									</div>
									<!-- Approved Date -->
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_approvedDate">Approved Date </label>
											<div class="  controls">
												<input type="text" name="approvedDate" value="" disabled="disabled" id="index_approvedDate" class="form-control" placeholder="Unapproved">
											</div>
										</div>
										<input type="hidden" name="approvedDate" value="" id="index_approvedDate">
									</div>
									<!-- /Approved Date -->
								</div>
								<div class="row">
									<!-- Admission Date -->
									<%
									String admissionDate = studentDetails[3]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedAdmissionDate = DateUtils.formatDate(admissionDate); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="AdmissionDate">Admission Date </label>
											<div class="  controls">
												<div class="input-group">
													<input type="text" name="AdmissionDate" disabled="disabled" value="<%=formattedAdmissionDate%>" class="form-control datepicker">
												</div>
											</div>
										</div>
									</div>
									<!-- /Admission  Date -->
									<!-- Admission  School -->
									<%
									DropdownOptionsDAO admissionSchoolDAO = new DropdownOptionsDAO();
									List<String> admissionSchool = admissionSchoolDAO.getAllAdmissionSchool();
									String selectedAdmissionSchool = (studentDetails[4] != null) ? studentDetails[4] : null; // Tên trường
									%>
									<div class="col-md-2">
										<div class="form-group ">
											<label class="  control-label" for="AdmissionSchool">Admission School </label>
											<div class="  controls">
												<select name="AdmissionSchool" disabled="disabled" class="form-control">
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
											<label class="control-label" for=""></label>
											<div class="controls">
												<div class="form-groupicheck-style pull-left">
													<div class=" "></div>
													<div class="controls">
														<div class="form-groupicheck-style pull-left">
															<div class=" "></div>
															<div class="  controls">
																<div class="checkbox">
																	<label class="class_checkbox" for="GlobalClass">
																		<div class="icheckbox_square-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
																			<input type="checkbox" disabled="disabled" class="checkbox_class" name="GlobalClass" value="true" style="position: absolute; opacity: 0;" <%="Yes".equals(studentDetails[5]) ? "checked" : ""%>>
																			<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
																		</div>
																		Global Class
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div>
												<input type="hidden" name="globalClass" value="false" id="index_globalClass">
												<input type="hidden" name="globalClassEditable" value="false" id="globalClassEditable">
											</div>
										</div>
									</div>
									<!-- Admission  Grade -->

									<%
									DropdownOptionsDAO admissionGradeDAO = new DropdownOptionsDAO();
									List<String> admissionGrade = admissionGradeDAO.getAllAdmissionGrade();
									String selectedAdmissionGradeDAO = (studentDetails[6] != null) ? studentDetails[6] : null;
									%>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="admissionGrade">Admission Grade </label>
											<div class="  controls">
												<select name="admissionGrade" disabled="disabled" id="admissionGrade" class="form-control">
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
									<!-- /Admission  Grade -->
								</div>
								<div class="row">
									<!-- Current Grade -->
									<div class="form-group col-md-4">
										<div class="form-group">
											<label class="  control-label" for="index_currentGrade">Current Grade </label>
											<div class="  controls">
												<input type="text" name="currentGrade" disabled="disabled" value="<%=studentDetails[7]%>" id="index_currentGrade" class="form-control">
											</div>
										</div>
										<input type="hidden" name="currentGrade" value="" id="index_currentGrade">
									</div>
									<!-- /Current Grade -->
									<!-- Home Room -->
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_currentHomeroomNo">Home Room </label>
											<div class="  controls">
												<input type="text" name="currentHomeroomNo" value="Not Assigned" disabled="disabled" id="index_currentHomeroomNo" class="form-control">
											</div>
										</div>
										<input type="hidden" name="currentHomeroomNo" value="" id="index_currentHomeroomNo">
									</div>
									<!-- /Home Room -->
									<!-- Status -->
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_status">Status </label>
											<div class="  controls">
												<input type="text" name="status" value="Paid" disabled="disabled" id="index_status" class="form-control">
											</div>
										</div>
										<input type="hidden" name="status" value="P" id="index_status">
									</div>
									<!-- /Status -->
								</div>
								<div class="row">
									<!-- Surname (English) -->
									<div class="col-md-6">
										<div class="form-group <%=(request.getAttribute("surnameError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="SurNameEnglish">
												Surname (English)
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="SurNameEnglish" maxlength="32" value="<%=studentDetails[10] != null ? studentDetails[10] : ""%>" class="form-control" placeholder="Surname (English)" />
												<%
												if (request.getAttribute("surnameError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("surnameError")%></span>
												<%
												}
												%>
											</div>
										</div>
									</div>

									<!-- /Surname (English) -->
									<!-- First name (English) -->
									<div class="col-md-6">
										<div class="form-group <%=(request.getAttribute("firstnameError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="FirstNameEnglish">
												First Name (English)
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="FirstNameEnglish" maxlength="32" value="<%=studentDetails[11] != null ? studentDetails[11] : ""%>" class="form-control" placeholder="First Name (English)" />
												<%
												if (request.getAttribute("firstnameError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("firstnameError")%></span>
												<%
												}
												%>
											</div>
										</div>
									</div>

									<!-- /First name (English) -->
								</div>
								<div class="row">
									<!-- Surname (Kanji) -->
									<div class="col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group <%=(request.getAttribute("surnameKanjiError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="SurNameKanji">
												Surname (Kanji)
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="SurNameKanji" maxlength="32" value="<%=studentDetails[12] != null ? studentDetails[12] : ""%>" class="form-control" placeholder="Surname (Kanji)" />
												<%
												if (request.getAttribute("surnameKanjiError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("surnameKanjiError")%></span>
												<%
												}
												%>
											</div>
										</div>

									</div>
									<!-- /Surname (Kanji) -->
									<!-- First name (Kanji) -->
									<div class="col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group <%=(request.getAttribute("firstnameKanjiError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="FirstNameKanji">
												First Name (Kanji)
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="FirstNameKanji" maxlength="32" value="<%=studentDetails[13] != null ? studentDetails[13] : ""%>" class="form-control" placeholder="First Name (Kanji)" />
												<%
												if (request.getAttribute("firstnameKanjiError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("firstnameKanjiError")%></span>
												<%
												}
												%>
											</div>
										</div>
									</div>
									<!-- /First name (Kanji) -->
								</div>
								<div class="row">
									<!-- Surname (Kana) -->
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="SurNameKana">Surname (Kana) </label>
											<div class="  controls">

												<input type="text" name="SurNameKana" maxlength="32" value="<%=studentDetails[14]%>" class="form-control" placeholder="Surname (Kana)">
											</div>
										</div>
									</div>
									<!-- /Surname (Kana)-->
									<!-- First name (Kana)-->
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="FirstNameKana">First Name (Kana) </label>
											<div class="  controls">
												<input type="text" name="FirstNameKana" maxlength="32" value="<%=studentDetails[15]%>" class="form-control" placeholder="First name (Kana)">
											</div>
										</div>
									</div>
									<!-- /First name (Kana)-->
								</div>
								<div class="row">
									<!--  Date of Birth -->
									<%
									String birthday = studentDetails[16]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedBirthday = DateUtils.formatDate(birthday); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-3">
										<div class="form-group <%=(request.getAttribute("birthdayError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="Birthday">
												Birthday
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="Birthday" value="<%=studentDetails[16] != null ? studentDetails[16] : ""%>" class="form-control datepicker" placeholder="Birthday (yyyy-MM-dd)" />
												<%
												if (request.getAttribute("birthdayError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("birthdayError")%></span>
												<%
												}
												%>
											</div>
										</div>

									</div>
									<!-- /Date of Birth -->
									<!-- Gender -->
									<div class="form-group col-md-3">
										<label>Gender</label>
										<br>
										<input type="radio" name="Gender" id="index_gendertrue" value="Male" class="icheck-style" <%="Male".equals(studentDetails[17]) ? "checked" : ""%> />
										<label for="index_gendertrue" class="icheck-style">Male</label>
										<input type="radio" name="Gender" id="index_genderfalse" value="Female" class="icheck-style" <%="Female".equals(studentDetails[17]) ? "checked" : ""%> />
										<label for="index_genderfalse" class="icheck-style">Female</label>
									</div>

									<!-- /Gender -->
									<!-- Language Ability -->
									<%
									DropdownOptionsDAO languageAbilityDAO = new DropdownOptionsDAO();
									List<String> languageAbility = languageAbilityDAO.getAllLanguageAbility();
									String selectedLanguageAbility = (studentDetails[18] != null) ? studentDetails[18] : null; // Tên khả năng ngôn ngữ
									%>
									<div class="col-md-3">
										<div class="form-group ">
											<label class="  control-label" for="LanguageAbility">Language Ability </label>
											<div class="  controls">
												<select name="LanguageAbility" class="form-control">
													<%
													for (String language_Ability : languageAbility) {
														String selected = (language_Ability.equals(selectedLanguageAbility)) ? "selected" : "";
													%>
													<option value="<%=language_Ability%>" <%=selected%>><%=language_Ability%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>
									<!-- /Language Ability -->
									<!--  Internal Transfer Date -->
									<%
									String internalTransferDate = studentDetails[19]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedInternalTransferDate = DateUtils.formatDate(internalTransferDate); // Gọi phương thức định dạng ngày
									%>
									<div class="col-md-3">
										<div class="form-group ">
											<label class="  control-label" for="InternalTransferDate">Internal Transfer Date </label>
											<div class="  controls">
												<div class="input-group">
													<input type="text" name="InternalTransferDate" value="<%=formattedInternalTransferDate%>" class="form-control datepicker">
												</div>
											</div>
										</div>

									</div>
									<!-- /Internal Transfer Date -->
								</div>
								<div class="row">
									<!-- Nationality -->
									<%
									// Tạo đối tượng DAO để lấy danh sách quốc gia
									DropdownOptionsDAO nationality1DAO = new DropdownOptionsDAO();
									List<String> nationalities1 = nationality1DAO.getAllNationalities();
									String selectedNationality1 = (studentDetails[20] != null) ? studentDetails[20] : null; // Lấy giá trị từ cột Nationality1
									%>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="Nationality1">Nationality1 </label>
											<div class="  controls">
												<select name="Nationality1" class="form-control">
													<option value=""></option>
													<!-- Option trống -->
													<%
													// Lặp qua danh sách quốc gia
													for (String nationality1 : nationalities1) {
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
									// Tạo đối tượng DAO để lấy danh sách quốc gia
									DropdownOptionsDAO nationality2DAO = new DropdownOptionsDAO();
									List<String> nationalities2 = nationality2DAO.getAllNationalities();
									String selectedNationality2 = (studentDetails[21] != null) ? studentDetails[21] : null; // Lấy giá trị từ cột Nationality1
									%>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="Nationality2">Nationality2 </label>
											<div class="  controls">
												<select name="Nationality2" class="form-control">
													<option value=""></option>
													<!-- Option trống -->
													<%
													// Lặp qua danh sách quốc gia
													for (String nationality2 : nationalities2) {
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
									<!-- /Nationality2 -->
									<!-- Passport No -->
									<div class="col-md-4">
										<div class="form-group <%=(request.getAttribute("passportNoError") != null) ? "has-error" : ""%>">
											<label class="control-label" for="PassportNo">
												Passport No
												<span class="required">*</span>
											</label>
											<div class="controls">
												<input type="text" name="PassportNo" maxlength="32" value="<%=studentDetails[22] != null ? studentDetails[22] : ""%>" class="form-control" placeholder="Passport No">
												<%
												if (request.getAttribute("passportNoError") != null) {
												%>
												<span class="help-block alert-danger"><%=request.getAttribute("passportNoError")%></span>
												<%
												}
												%>
											</div>
										</div>

									</div>
									<!-- /Passport No -->
								</div>
								<div class="row">
									<!-- Visa type/Visa no -->
									<%
									// Tạo đối tượng DAO để lấy danh sách loại visa
									DropdownOptionsDAO visaTypeDAO = new DropdownOptionsDAO();
									List<String> visaTypes = visaTypeDAO.getAllVisaType();
									String selectedVisaType = (studentDetails[23] != null) ? studentDetails[23] : null; // Lấy giá trị từ cột VisaType
									%>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="VisaType">Visa Type </label>
											<div class="  controls">
												<select name="VisaType" class="form-control">
													<%
													// Lặp qua danh sách các loại visa
													for (String visaType : visaTypes) {
														String selected = (visaType.equals(selectedVisaType)) ? "selected" : "";
													%>
													<option value="<%=visaType%>" <%=selected%>><%=visaType%></option>
													<%
													}
													%>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="VisaNo">Visa No </label>
											<div class="  controls">
												<input type="text" name="VisaNo" maxlength="32" value="<%=studentDetails[24] != null ? studentDetails[24] : ""%>" class="form-control">
											</div>
										</div>
									</div>
									<!-- /Visa type/Visa no -->
									<!--  Expiry Date -->
									<%
									String expiryDate = studentDetails[25]; // Ngày trong định dạng "yyyy-MM-dd"
									String formattedExpiryDate = DateUtils.formatDate(expiryDate); // Gọi phương thức định dạng ngày
									%>
									<div class="form-group col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="VisaExpiryDate">Expiry Date </label>
											<div class="  controls">
												<div class="input-group">
													<input type="text" name="VisaExpiryDate" value="<%=formattedExpiryDate%>" class="form-control datepicker">
												</div>
											</div>
										</div>
									</div>
									<!-- /  Expiry Date -->
								</div>
								<div class="row">
									<!-- Previous school name -->
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="PreviousSchoolName">Previous School Name </label>
											<div class="  controls">
												<input type="text" name="PreviousSchoolName" maxlength="64" value="<%=studentDetails[26]%>" class="form-control" placeholder="Previous school name">
											</div>
										</div>
										<div class="form-group ">
											<label class="  control-label" for="TelephoneNo">Telephone No </label>
											<div class="  controls">
												<input type="text" name="TelephoneNo" maxlength="32" value="<%=studentDetails[28]%>" class="form-control" placeholder="Telephone No">
											</div>
										</div>
										<!-- /Telephone No -->
									</div>
									<!-- /Previous school name -->
									<!-- Previous school address -->
									<div class="col-md-8">
										<div class="form-group ">
											<label class="  control-label" for="PreviousSchoolAddress">Previous School Address </label>
											<div class="  controls">
												<textarea name="PreviousSchoolAddress" cols="" rows="5" class="form-control" placeholder="Previous school address"><%=studentDetails[27]%></textarea>
											</div>
										</div>

									</div>
									<!-- /Previous school address -->
								</div>
								<div class="row">
									<!-- Office Remark -->
									<div class="col-md-12">
										<div class="form-group ">
											<label class="  control-label" for="OfficeRemark">Office Remark </label>
											<div class="  controls">
												<textarea name="OfficeRemark" cols="" rows="3" id="index_officeRemark" class="form-control" placeholder="Office Remark..."><%=studentDetails[29]%></textarea>
											</div>
										</div>
									</div>
									<!-- /Office Remark -->
								</div>

								<%
								DropdownOptionsDAO giroDAO = new DropdownOptionsDAO();
								List<String> giroList = giroDAO.getAllGiro(); // Danh sách 'Giro' và 'Non Giro'
								String selectedGiro = (studentDetails[30] != null) ? studentDetails[30] : "Giro"; // Giá trị mặc định là 'Giro'
								%>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for=Giro>Giro </label>
											<div class="  controls">
												<select name="Giro" class="form-control">
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
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocYroku">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocYroku" value="true" id="index_prevSchoolDocYroku" class="icheck-style pull-left" <%=selectedDocuments.contains("Yoroku") ? "checked" : ""%> />
															<input type="hidden" id="__checkbox_index_prevSchoolDocYroku" name="__checkbox_prevSchoolDocYroku" value="true" />
															Yoroku
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocHealth">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocHealth" value="true" id="index_prevSchoolDocHealth" class="icheck-style pull-left" <%=selectedDocuments.contains("Doc Health") ? "checked" : ""%> />
															<input type="hidden" id="__checkbox_index_prevSchoolDocHealth" name="__checkbox_prevSchoolDocHealth" value="true" />
															Doc Health
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocTeeth">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocTeeth" value="true" id="index_prevSchoolDocTeeth" class="icheck-style pull-left" <%=selectedDocuments.contains("Doc Teeth") ? "checked" : ""%> />
															<input type="hidden" id="__checkbox_index_prevSchoolDocTeeth" name="__checkbox_prevSchoolDocTeeth" value="true" />
															Doc Teeth
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocKyokasho">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocKyokasho" value="true" id="index_prevSchoolDocKyokasho" class="icheck-style pull-left" <%=selectedDocuments.contains("Soshina") ? "checked" : ""%> />
															<input type="hidden" id="__checkbox_index_prevSchoolDocKyokasho" name="__checkbox_prevSchoolDocKyokasho" value="true" />
															Soshina
														</label>
													</div>
												</div>
											</div>
											<div class="form-groupicheck-style pull-left">
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocZaisho">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocZaisho" value="true" id="index_prevSchoolDocZaisho" class="icheck-style pull-left" <%=selectedDocuments.contains("Zaisho") ? "checked" : ""%> />
															<input type="hidden" id="__checkbox_index_prevSchoolDocZaisho" name="__checkbox_prevSchoolDocZaisho" value="true" />
															Zaisho
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="box-header with-border">
										<h3 class="box-title">Parent Information</h3>
										<input type="hidden" name="parentId" value="6" id="index_parentId">
									</div>
									<div class="box-body">
										<div class="row">
											<!-- Student No -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameAlpha">Parent Name (Alpha) </label>
													<div class="  controls">
														<input type="text" name="parentNameAlpha" value="<%=studentDetails[32]%>" disabled="disabled" id="index_parentNameAlpha" class="form-control">
													</div>
												</div>
												<input type="hidden" name="parentNameAlpha" value="" id="index_parentNameAlpha">
											</div>
											<!-- /Student No -->
											<!-- Application Date -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameKana">Parent Name (Kana) </label>
													<div class="  controls">
														<input type="text" name="parentNameKana" value="<%=studentDetails[33]%>" disabled="disabled" id="index_parentNameKana" class="form-control">
													</div>
												</div>
												<input type="hidden" name="parentNameKana" value=" " id="index_parentNameKana">
											</div>
										</div>
										<div class="row">
											<!-- Parent Address -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentAddress1">Parent Address </label>
													<div class="  controls">
														<input type="text" name="parentAddress1" value="<%=studentDetails[34]%>" disabled="disabled" id="index_parentAddress1" class="form-control">
													</div>
												</div>
												<input type="hidden" name="parentAddress1" value="" id="index_parentAddress1">
											</div>
											<!-- /Parent Address -->
											<!-- Company Name -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_parentCompanyName">Company Name </label>
													<div class="  controls">
														<input type="text" name="parentCompanyName" value="<%=studentDetails[35]%>" disabled="disabled" id="index_parentCompanyName" class="form-control">
													</div>
												</div>
												<input type="hidden" name="parentCompanyName" value="" id="index_parentCompanyName">
											</div>
											<!-- /Company Name -->
										</div>
										<div class="row">
											<!-- busJrcoNo -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_busJrcoNo">JRCO NO (Alpha) </label>
													<div class="  controls">
														<input type="text" name="busJrcoNo" value="<%=studentDetails[36]%>" disabled="disabled" id="index_busJrcoNo" class="form-control">
													</div>
												</div>
												<input type="hidden" name="busJrcoNo" value="" id="index_busJrcoNo">
											</div>
											<!-- /busJrcoNo -->
											<!-- jassociatNo -->
											<div class="col-md-6">
												<div class="form-group ">
													<label class="  control-label" for="index_jassociatNo">JAS NO </label>
													<div class="  controls">
														<input type="text" name="jassociatNo" value="<%=studentDetails[37]%>" disabled="disabled" id="index_jassociatNo" class="form-control">
													</div>
												</div>
												<input type="hidden" name="jassociatNo" value="" id="index_jassociatNo">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>

					</section>
					<!--   end : main-content -->
				</div>
				<!--   end : content-wrapper -->
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