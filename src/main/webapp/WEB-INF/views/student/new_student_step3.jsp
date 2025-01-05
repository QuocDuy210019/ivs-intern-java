<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../layout/head.jsp"%>
<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->
	<form id="index_save" name="index" action="${pageContext.request.contextPath}/student?astudS03=save_student"
		method="POST" class="form-vertical form-label-stripped">
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
								<button type="submit" class="btn btn-warning">
									<i class="fa fa fa-check-square-o"></i>
									Save
								</button>
								<a href="${pageContext.request.contextPath}/student?astudS03=step2" style="color: #444;">
									<button type="button" class="btn btn-default btn-back">
										<i class="fa fa-reply"></i>
										<span>Back</span>
									</button>
								</a>
							</div>
						</div>
						<div class="">
							<ul class="nav nav-pills nav-justified thumbnail setup-panel">
								<li class="disabled">
									<a>
										<h4 class="list-group-item-heading">Step 1</h4>
										<p class="list-group-item-text">Select Parent</p>
									</a>
								</li>
								<li class="disabled">
									<a>
										<h4 class="list-group-item-heading">Step 2</h4>
										<p class="list-group-item-text">Input Student Information</p>
									</a>
								</li>
								<li class="active">
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
												<input type="hidden" name="astudS03" value="save_student">
												<input type="hidden" name="selectParent" value="">
												<input type="text" name="studentNo" value="" disabled="disabled" id="index_studentNo" class="form-control"
													placeholder="Auto Generate" />
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
												<input type="text" name="applicationDate" value="12/11/2024" disabled="disabled" id="index_applicationDate"
													class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- Application Date -->
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
												<input type="text" name="admissionDate" value="12/11/2024" disabled="disabled" id="index_admissionDate"
													class="form-control datepicker" />
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
												<select name="schoolId" disabled="disabled" id="index_schoolId" class="form-control">
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
																<input class="checkbox_class" type="checkbox" name="globalClass" value="true" disabled="disabled"
																	id="globalClass" class="icheck-style pull-left" />
																<input type="hidden" id="__checkbox_globalClass" name="__checkbox_globalClass" value="true"
																	disabled="disabled" />
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
											<label class="  control-label" for="index_admissionGrade">Admission Grade </label>
											<div class="  controls">
												<select name="admissionGrade" disabled="disabled" id="index_admissionGrade" class="form-control">
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
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentAlphaSurName">Surname (English) </label>
											<div class="  controls">
												<input type="text" name="studentAlphaSurName" value="" disabled="disabled" id="index_studentAlphaSurName"
													class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Surname (English) -->
									<!-- First name (English) -->
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentAlphaFirstName">First Name (English) </label>
											<div class="  controls">
												<input type="text" name="studentAlphaFirstName" value="" disabled="disabled"
													id="index_studentAlphaFirstName" class="form-control" />
											</div>
										</div>
									</div>
									<!-- /First name (English) -->
								</div>
								<div class="row">
									<!-- Surname (Kanji) -->
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiSurName">Surname (Kanji) </label>
											<div class="  controls">
												<input type="text" name="studentKanjiSurName" value="" disabled="disabled" id="index_studentKanjiSurName"
													class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Surname (Kanji) -->
									<!-- First name (Kanji) -->
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanjiFirstName">First Name (Kanji) </label>
											<div class="  controls">
												<input type="text" name="studentKanjiFirstName" value="" disabled="disabled"
													id="index_studentKanjiFirstName" class="form-control" />
											</div>
										</div>
									</div>
									<!-- /First name (Kanji) -->
								</div>
								<div class="row">
									<!-- Surname (Kana) -->
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanaSurName">Surname (Kana) </label>
											<div class="  controls">
												<input type="text" name="studentKanaSurName" value="" disabled="disabled" id="index_studentKanaSurName"
													class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Surname (Kana)-->
									<!-- First name (Kana)-->
									<div class="form-group col-md-6">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_studentKanaFirstName">First Name (Kana) </label>
											<div class="  controls">
												<input type="text" name="studentKanaFirstName" value="" disabled="disabled" id="index_studentKanaFirstName"
													class="form-control" />
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
											<label class="  control-label" for="index_birthDay">Birthday </label>
											<div class="  controls">
												<input type="text" name="birthDay" value="" disabled="disabled" id="index_birthDay"
													class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Date of Birth -->
									<!-- Gender -->
									<div class="form-group col-md-3">
										<label>Gender</label>
										<br>
										<input type="radio" name="gender" id="index_gendertrue" checked="checked" value="true" disabled="disabled"
											class="icheck-style" />
										<label for="index_gendertrue" class="icheck-style">Male</label>
										<input type="radio" name="gender" id="index_genderfalse" value="false" disabled="disabled"
											class="icheck-style" />
										<label for="index_genderfalse" class="icheck-style">Female</label>
									</div>
									<!-- /Gender -->
									<!-- Language Ability -->
									<div class="col-md-3">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_langAbility">Language Ability </label>
											<div class="  controls">
												<select name="langAbility" disabled="disabled" id="index_langAbility" class="form-control">
													<option value="1" selected="selected">Level-1</option>
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
									<div class="form-group col-md-3">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_transferDate">Internal Transfer Date </label>
											<div class="  controls">
												<input type="text" name="transferDate" value="" disabled="disabled" id="index_transferDate"
													class="form-control datepicker" />
											</div>
										</div>
									</div>
									<!-- /Internal Transfer Date -->
								</div>
								<div class="row">
									<!-- Nationality -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_nationality1">Nationality1 </label>
											<div class="  controls">
												<select name="nationality1" disabled="disabled" id="index_nationality1" class="form-control">
													<option value=""></option>
													<option value="32">ARGENTINA</option>
													<option value="36">AUSTRALIA</option>
													<option value="56">BELGIUM</option>
													<option value="76">BRAZIL</option>
													<option value="124">CANADA</option>
													<option value="156">CHINA</option>
													<option value="191">CROATIA</option>
													<option value="203">CZECH REPUBLIC</option>
													<option value="208">DENMARK</option>
													<option value="250">FRANCE</option>
													<option value="276">GERMANY</option>
													<option value="356">INDIA</option>
													<option value="360">INDONESIA</option>
													<option value="380">ITALY</option>
													<option value="392">JAPAN</option>
													<option value="458">MALAYSIA</option>
													<option value="480">MAURITIUS</option>
													<option value="528">NETHERLANDS</option>
													<option value="554">NEW ZEALAND</option>
													<option value="578">NORWAY</option>
													<option value="608">PHILIPPINES</option>
													<option value="616">POLAND</option>
													<option value="410">REPUBLIC OF KOREA</option>
													<option value="642">ROMANIA</option>
													<option value="643">RUSSIAN FEDERATION</option>
													<option value="688">SERBIA</option>
													<option value="702">SINGAPORE</option>
													<option value="144">SRI LANKA</option>
													<option value="756">SWITZERLAND</option>
													<option value="158">TAIWAN</option>
													<option value="764">THAILAND</option>
													<option value="826">UNITED KINGDOM BRITISH CITIZEN</option>
													<option value="903">UNITED KINGDOM BRITISH DEPENDENT TERRITORIES CITIZEN</option>
													<option value="904">UNITED KINGDOM BRITISH NATIONAL (OVERSEAS)</option>
													<option value="840">UNITED STATES OF AMERICA</option>
													<option value="909">YUGOSLAVIA</option>
													<option value="908">UNKNOWN</option>
													<option value="901">STATELESS</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /Nationality -->
									<!-- Nationality2 -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_nationality2">Nationality2 </label>
											<div class="  controls">
												<select name="nationality2" disabled="disabled" id="index_nationality2" class="form-control">
													<option value=""></option>
													<option value="32">ARGENTINA</option>
													<option value="36">AUSTRALIA</option>
													<option value="56">BELGIUM</option>
													<option value="76">BRAZIL</option>
													<option value="124">CANADA</option>
													<option value="156">CHINA</option>
													<option value="191">CROATIA</option>
													<option value="203">CZECH REPUBLIC</option>
													<option value="208">DENMARK</option>
													<option value="250">FRANCE</option>
													<option value="276">GERMANY</option>
													<option value="356">INDIA</option>
													<option value="360">INDONESIA</option>
													<option value="380">ITALY</option>
													<option value="392">JAPAN</option>
													<option value="458">MALAYSIA</option>
													<option value="480">MAURITIUS</option>
													<option value="528">NETHERLANDS</option>
													<option value="554">NEW ZEALAND</option>
													<option value="578">NORWAY</option>
													<option value="608">PHILIPPINES</option>
													<option value="616">POLAND</option>
													<option value="410">REPUBLIC OF KOREA</option>
													<option value="642">ROMANIA</option>
													<option value="643">RUSSIAN FEDERATION</option>
													<option value="688">SERBIA</option>
													<option value="702">SINGAPORE</option>
													<option value="144">SRI LANKA</option>
													<option value="756">SWITZERLAND</option>
													<option value="158">TAIWAN</option>
													<option value="764">THAILAND</option>
													<option value="826">UNITED KINGDOM BRITISH CITIZEN</option>
													<option value="903">UNITED KINGDOM BRITISH DEPENDENT TERRITORIES CITIZEN</option>
													<option value="904">UNITED KINGDOM BRITISH NATIONAL (OVERSEAS)</option>
													<option value="840">UNITED STATES OF AMERICA</option>
													<option value="909">YUGOSLAVIA</option>
													<option value="908">UNKNOWN</option>
													<option value="901">STATELESS</option>
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
											<label class="  control-label" for="index_passportNo">Passport No </label>
											<div class="  controls">
												<input type="text" name="passportNo" value="x" disabled="disabled" id="index_passportNo"
													class="form-control" />
											</div>
										</div>
									</div>
									<!-- /Passport No -->
								</div>
								<div class="row">
									<!-- Visa type/Visa no -->
									<div class="col-md-4">
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_visaType">Visa Type </label>
											<div class="  controls">
												<select name="visaType" disabled="disabled" id="index_visaType" class="form-control">
													<option value="1" selected="selected">SINGAPORE PR</option>
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
												<input type="text" name="visaN0" value="" disabled="disabled" id="index_visaN0"
													class="form-control inputmask" data-inputmask="&quot;mask&quot;: &quot;9999 9999 9999 9999&quot;" />
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
												<input type="text" name="visaExpiryDate" value="" disabled="disabled" id="index_visaExpiryDate"
													class="form-control datepicker" />
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
												<input type="text" name="prevSchoolName" value="" disabled="disabled" id="index_prevSchoolName"
													class="form-control" />
											</div>
										</div>
										<!-- Telephone No -->
										<!-- s2b_form_element_class:    -->
										<!-- s2b_form_element_class:    -->
										<div class="form-group ">
											<label class="  control-label" for="index_prevSchoolTel">Telephone No </label>
											<div class="  controls">
												<input type="text" name="prevSchoolTel" value="" disabled="disabled" id="index_prevSchoolTel"
													class="form-control" />
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
											<label class="  control-label" for="index_prevSchoolAddress">Previous School address </label>
											<div class="  controls">
												<textarea name="prevSchoolAddress" cols="" rows="5" disabled="disabled" id="index_prevSchoolAddress"
													class="form-control"></textarea>
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
												<textarea name="officeRemark" cols="" rows="3" disabled="disabled" id="index_officeRemark"
													class="form-control"></textarea>
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
												<select name="nonGiro" disabled="disabled" id="index_nonGiro" class="form-control">
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocYroku" value="true" disabled="disabled"
																id="index_prevSchoolDocYroku" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocYroku" name="__checkbox_prevSchoolDocYroku"
																value="true" disabled="disabled" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocHealth" value="true" disabled="disabled"
																id="index_prevSchoolDocHealth" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocHealth" name="__checkbox_prevSchoolDocHealth"
																value="true" disabled="disabled" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocTeeth" value="true" disabled="disabled"
																id="index_prevSchoolDocTeeth" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocTeeth" name="__checkbox_prevSchoolDocTeeth"
																value="true" disabled="disabled" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocKyokasho" value="true"
																disabled="disabled" id="index_prevSchoolDocKyokasho" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocKyokasho" name="__checkbox_prevSchoolDocKyokasho"
																value="true" disabled="disabled" />
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
															<input class="checkbox_class" type="checkbox" name="prevSchoolDocZaisho" value="true" disabled="disabled"
																id="index_prevSchoolDocZaisho" class="icheck-style pull-left" />
															<input type="hidden" id="__checkbox_index_prevSchoolDocZaisho" name="__checkbox_prevSchoolDocZaisho"
																value="true" disabled="disabled" />
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
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameAlpha">Parent Name (Alpha) </label>
													<div class="  controls">
														<input type="text" name="parentNameAlpha" value="${parentDetailsArray[0]}" disabled="disabled"
															id="index_parentNameAlpha" class="form-control" />
													</div>
												</div>
											</div>
											<!-- /Student No -->
											<!-- Application Date -->
											<div class="col-md-6">
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_parentNameKana">Parent Name (Kana) </label>
													<div class="  controls">
														<input type="text" name="parentNameKana" value="${parentDetailsArray[1]}" disabled="disabled"
															id="index_parentNameKana" class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<!-- Res Phone -->
											<div class="col-md-6">
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_parentAddress1">Parent Address </label>
													<div class="  controls">
														<input type="text" name="parentAddress1" value="${parentDetailsArray[2]}" disabled="disabled"
															id="index_parentAddress1" class="form-control" />
													</div>
												</div>
											</div>
											<!-- /Res Phone -->
											<!-- Company Name -->
											<div class="col-md-6">
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_parentCompanyName">Company Name </label>
													<div class="  controls">
														<input type="text" name="parentCompanyName" value="${parentDetailsArray[3]}" disabled="disabled"
															id="index_parentCompanyName" class="form-control" />
													</div>
												</div>
											</div>
											<!-- /Company Name -->
										</div>
										<div class="row">
											<!-- busJrcoNo -->
											<div class="col-md-6">
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_busJrcoNo">JRCO NO (Alpha) </label>
													<div class="  controls">
														<input type="text" name="busJrcoNo" value="${parentDetailsArray[4]}" disabled="disabled"
															id="index_busJrcoNo" class="form-control" />
													</div>
												</div>
											</div>
											<!-- /busJrcoNo -->
											<!-- jassociatNo -->
											<div class="col-md-6">
												<!-- s2b_form_element_class:    -->
												<!-- s2b_form_element_class:    -->
												<div class="form-group ">
													<label class="  control-label" for="index_jassociatNo">JAS NO </label>
													<div class="  controls">
														<input type="text" name="jassociatNo" value="${parentDetailsArray[5]}" disabled="disabled"
															id="index_jassociatNo" class="form-control" />
													</div>
												</div>
											</div>
										</div>
									</div>
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
	<script>
		// Biến toàn cục lưu trữ trạng thái hiện tại hoặc sự kiện
		var eventId = 'index'; // Xác định trạng thái hoặc trang hiện tại, ở đây là trang "index"
		var submitted = false; // Biến kiểm tra trạng thái form, ban đầu chưa được gửi (false)
	</script>
	<%@ include file="../layout/custom_script.jsp"%>
	<%@ include file="../layout/script.jsp"%>
</body>
</html>