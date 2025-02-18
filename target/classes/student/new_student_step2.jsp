<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../layout/head.jsp"%>
<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->
	<form id="index" name="index" action="" method="post" enctype="multipart/form-data" class="form-vertical form-label-stripped">
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
							<div id="screen-name">NEW STUDENT</div>
							<div id="action-buttons">
								<button type="button" class="btn btn-info" onclick="sendIfStudent()">
									Next
									<i class="glyphicon glyphicon-arrow-right"></i>
								</button>
								<a href="${pageContext.request.contextPath}/new_student_step1" style="color: #444;">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span>Back</span>
									</button>
								</a>
							</div>
						</div>
						<div>
							<ul class="nav nav-pills nav-justified thumbnail setup-panel">
								<li class="disabled">
									<a>
										<h4 class="list-group-item-heading">Step 1</h4>
										<p class="list-group-item-text">Select Parent</p>
									</a>
								</li>
								<li class="active">
									<a>
										<h4 class="list-group-item-heading">Step 2</h4>
										<p class="list-group-item-text">Input Student Information</p>
									</a>
								</li>
								<li class="disabled">
									<a>
										<h4 class="list-group-item-heading">Step 3</h4>
										<p class="list-group-item-text">Confirm</p>
									</a>
								</li>
							</ul>
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
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentNo">Student No </label>
											<div class="  controls">
												<input type="hidden" name="selectParent" value="">
												<input type="text" name="studentNo" value="Auto Generate" disabled="disabled" id="index_studentNo" class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Student No -->
									<!-- Application Date -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_applicationDate">Application Date </label>
											<div class="  controls">
												<input type="text" name="applicationDate" value="12-11-2024" id="index_applicationDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Application Date -->
									<!-- /Approved Date -->
								</div>
								<div class="row">
									<!-- Admission Date -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_admissionDate">Admission Date </label>
											<div class="  controls">
												<input type="text" name="admissionDate" value="12-11-2024" id="index_admissionDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Admission  Date -->
									<!-- Admission  School -->
									<div class="col-md-2">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="schoolId">Admission School </label>
											<div class="  controls">
												<select name="schoolId" id="index_schoolId" class="form-control" onchange="index_schoolIdRedirect(this.selectedIndex)">
													<option value="1">Clementi</option>
													<option value="2">Changi</option>
													<option value="3">West Coast</option>
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
															<label class="class_checkbox" for="globalClass">
																<input type="checkbox" class="checkbox_class" name="globalClass" value="true" id="globalClass" class="icheck-style pull-left" />
																<input type="hidden" id="__checkbox_globalClass" name="__checkbox_globalClass" value="true" />
																Global Class
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Admission  Grade -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="admissionGrade">Admission Grade </label>
											<div class="  controls">
												<select name="admissionGrade" id="index_admissionGrade" class="form-control">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /Admission  Grade -->
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
												<input type="text" name="SurNameEnglish" maxlength="32" value="" class="form-control" placeholder="Surname (English)" />
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
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentAlphaFirstName">
												First Name (English)
												<span class="required">*</span>
											</label>
											<div class="  controls">
												<input type="text" name="studentAlphaFirstName" maxlength="32" value="" id="index_studentAlphaFirstName" class="form-control" placeholder="First name (English)" />
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
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiSurName">
												Surname (Kanji)
												<span class="required">*</span>
											</label>
											<div class="  controls">
												<input type="text" name="studentKanjiSurName" maxlength="32" value="" id="index_studentKanjiSurName" class="form-control" placeholder="Surname (Kanji)" />
											</div>
										</div>
									</div>
									<!-- /Surname (Kanji) -->
									<!-- First name (Kanji) -->
									<div class="col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiFirstName">
												First Name (Kanji)
												<span class="required">*</span>
											</label>
											<div class="  controls">
												<input type="text" name="studentKanjiFirstName" maxlength="32" value="" id="index_studentKanjiFirstName" class="form-control" placeholder="First name (Kanji)" />
											</div>
										</div>
									</div>
									<!-- /First name (Kanji) -->
								</div>
								<div class="row">
									<!-- Surname (Kana) -->
									<div class="col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanaSurName">Surname (Kana) </label>
											<div class="  controls">
												<input type="text" name="studentKanaSurName" maxlength="32" value="" id="index_studentKanaSurName" class="form-control" placeholder="Surname (Kana)" />
											</div>
										</div>
									</div>
									<!-- /Surname (Kana)-->
									<!-- First name (Kana)-->
									<div class="col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanaFirstName">First Name (Kana) </label>
											<div class="  controls">
												<input type="text" name="studentKanaFirstName" maxlength="32" value="" id="index_studentKanaFirstName" class="form-control" placeholder="First name (Kana)" />
											</div>
										</div>
									</div>
									<!-- /First name (Kana)-->
								</div>
								<div class="row">
									<!--  Date of Birth -->
									<div class="col-md-3">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_birthDay">
												Birthday
												<span class="required">*</span>
											</label>
											<div class="  controls">
												<input type="text" name="birthDay" value="" id="index_birthDay" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Date of Birth -->
									<!-- Gender -->
									<div class="form-group col-md-3">
										<label>Gender</label>
										<br>
										<input type="radio" name="gender" id="index_gendertrue" checked="checked" value="true" class="icheck-style" />
										<label for="index_gendertrue" class="icheck-style">Male</label>
										<input type="radio" name="gender" id="index_genderfalse" value="false" class="icheck-style" />
										<label for="index_genderfalse" class="icheck-style">Female</label>
									</div>
									<!-- /Gender -->
									<!-- Language Ability -->
									<div class="col-md-3">
										<label for="exampleInputPassword1">Language Ability</label>
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<div class="  controls">
												<select name="langAbility" id="index_langAbility" class="form-control">
													<option value="1">Level-1</option>
													<option value="2">Level-2</option>
													<option value="3">Level-3</option>
													<option value="4">Level-4</option>
													<option value="5">Level-5</option>
													<option value="6">Level-6</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /Language Ability -->
									<!--  Internal Transfer Date -->
									<div class="col-md-3">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_transferDate">Internal Transfer Date </label>
											<div class="  controls">
												<input type="text" name="transferDate" value="" id="index_transferDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Internal Transfer Date -->
								</div>
								<div class="row">
									<!-- Nationality -->
									<div class="form-group col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_nationality1">Nationality1 </label>
											<div class="  controls">
												<select name="nationality1" id="index_nationality1" class="form-control">
													<option value=""></option>
													<option value="32">ARGENTINA</option>
													<option value="36">AUSTRALIA</option>
													<option value="56">BELGIUM</option>
													<option value="76">BRAZIL</option>
													<option value="124">CANADA</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /Nationality -->
									<!-- Nationality2 -->
									<div class="form-group col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_nationality2">Nationality2 </label>
											<div class="  controls">
												<select name="nationality2" id="index_nationality2" class="form-control">
													<option value=""></option>
													<option value="32">ARGENTINA</option>
													<option value="36">AUSTRALIA</option>
													<option value="56">BELGIUM</option>
													<option value="76">BRAZIL</option>
													<option value="124">CANADA</option>
													<option value="156">CHINA</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /Nationality2 -->
									<!-- Passport No -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_passportNo">
												Passport No
												<span class="required">*</span>
											</label>
											<div class="  controls">
												<input type="text" name="passportNo" maxlength="32" value="" id="index_passportNo" class="form-control" placeholder="Passport No" />
											</div>
										</div>
									</div>
									<!-- /Passport No -->
								</div>
								<div class="row">
									<!-- Visa type/Visa no -->
									<div class="form-group col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_visaType">Visa Type </label>
											<div class="  controls">
												<select name="visaType" id="index_visaType" class="form-control">
													<option value="1">SINGAPORE PR</option>
													<option value="2">DEPENDENT'S PASS</option>
													<option value="3">STUDENT'S PASS</option>
													<option value="4">SINGAPOREAN</option>
													<option value="5">DIPLOMATIC PASS</option>
													<option value="6">LONG TERM VISIT PASS</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_visaN0">Visa No </label>
											<div class="  controls">
												<input type="text" name="visaN0" maxlength="32" value="" id="index_visaN0" class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Visa type/Visa no -->
									<!--  Expiry Date -->
									<div class="form-group col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_visaExpiryDate">Expiry Date </label>
											<div class="  controls">
												<input type="text" name="visaExpiryDate" value="" id="index_visaExpiryDate" class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /  Expiry Date -->
								</div>
								<div class="row">
									<!-- Previous school name -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolName">Previous School Name </label>
											<div class="  controls">
												<input type="text" name="prevSchoolName" maxlength="64" value="" id="index_prevSchoolName" class="form-control" placeholder="Previous school name" />
											</div>
										</div>
										<!-- Telephone No -->
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolTel">Telephone No </label>
											<div class="  controls">
												<input type="text" name="prevSchoolTel" maxlength="32" value="" id="index_prevSchoolTel" class="form-control" placeholder="Telephone No" />
											</div>
										</div>
										<!-- /Telephone No -->
									</div>
									<!-- /Previous school name -->
									<!-- Previous school address -->
									<div class="col-md-8">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolAddress">Previous School Address </label>
											<div class="  controls">
												<textarea name="prevSchoolAddress" cols="" rows="5" id="index_prevSchoolAddress" class="form-control" placeholder="Previous school address"></textarea>
											</div>
										</div>
									</div>
									<!-- /Previous school address -->
								</div>
								<div class="row">
									<!-- Office Remark -->
									<div class="col-md-12">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_officeRemark">Office Remark </label>
											<div class="  controls">
												<textarea name="officeRemark" cols="" rows="3" id="index_officeRemark" class="form-control" placeholder="Office Remark..."></textarea>
											</div>
										</div>
									</div>
									<!-- /Office Remark -->
								</div>
								<div class="row">
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_nonGiro">Giro </label>
											<div class="  controls">
												<select name="nonGiro" id="index_nonGiro" class="form-control">
													<option value="0" selected="selected">Giro</option>
													<option value="1">Non Giro</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<!-- Documents -->
									<div class="form-group col-md-8">
										<label>Documents</label>
										<div>
											<div class="form-groupicheck-style pull-left">
												<div class=" "></div>
												<div class="  controls">
													<div class="checkbox">
														<label class="class_checkbox" for="index_prevSchoolDocYroku">
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocYroku" value="true" id="index_prevSchoolDocYroku" class="icheck-style pull-left" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocHealth" value="true" id="index_prevSchoolDocHealth" class="icheck-style pull-left" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocTeeth" value="true" id="index_prevSchoolDocTeeth" class="icheck-style pull-left" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocKyokasho" value="true" id="index_prevSchoolDocKyokasho" class="icheck-style pull-left" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocZaisho" value="true" id="index_prevSchoolDocZaisho" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocZaisho" name="__checkbox_prevSchoolDocZaisho" value="true" />
															Zaisho
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /Documents -->
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