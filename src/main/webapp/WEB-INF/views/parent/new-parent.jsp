<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<%@ include file="../layout/head.jsp" %>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->

	<form action="" method="post" enctype="multipart/form-data"
		class="form-vertical form-label-stripped">
		<fieldset>

			<div class="wrapper">

				<%@ include file="../layout/header.jsp" %>

				<!-- start : sidebar-menu -->

				<%@ include file="../layout/sidebar.jsp" %>

				<!-- start : content-wrapper -->
				<div class="content-wrapper">

					<!-- start : main-content -->

					<section class="content">
						<div id="sms-top-bar" class="row">
							<div id="screen-name">New Parent</div>
							<div id="action-buttons">
								<button type="button"
									class="btn btn-warning">
									<i class="fa fa-check-square-o"></i> <span>Save</span>
								</button>
								<button type="button"
									class="btn btn-default btn-back">
									<i class="fa fa-reply"></i> <span>Back</span>
								</button>
							</div>
						</div>
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Parent Information</h3>
							</div>
							<div class="box-body panel-primary table-responsive">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parAlphaSurName">Parent
												Surname(English) <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="parAlphaSurName" maxlength="64"
													value="" id="index_parAlphaSurName" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parAlphaFstName">Parent
												First Name(English) <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="parAlphaFstName" maxlength="64"
													value="" id="index_parAlphaFstName" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parKanjiSurName">Parent
												Surname(Kanji) <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="parKanjiSurName" maxlength="64"
													value="" id="index_parKanjiSurName" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parKanjiFstName">Parent
												First Name(Kanji) <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="parKanjiFstName" maxlength="64"
													value="" id="index_parKanjiFstName" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parKanaSurName">Parent
												Surname(Kana) </label>
											<div class="  controls">

												<input type="text" name="parKanaSurName" maxlength="64"
													value="" id="index_parKanaSurName" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-6">
										<div class="form-group ">
											<label class="  control-label" for="index_parKanaFstName">Parent
												First Name(Kana) </label>
											<div class="  controls">

												<input type="text" name="parKanaFstName" maxlength="64"
													value="" id="index_parKanaFstName" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_jrcoNo">Jrco
												No </label>
											<div class="  controls">

												<input type="text" name="jrcoNo" value=""
													disabled="disabled" id="index_jrcoNo" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_jasNoType">Jas
												Type <span class="required">*</span>
											</label>
											<div class="  controls">
												<select name="jasNoType" id="index_jasNoType"
													class="form-control">
													<option value="" selected="selected">SELECT</option>
													<option value="1">JP company member</option>
													<option value="2">JP personal member</option>
													<option value="3">Other personal member</option>
												</select>

											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_jasNo">Jas
												No <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="jasNo" maxlength="10" value=""
													id="index_jasNo" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaType">Visa
												Type <span class="required">*</span>
											</label>
											<div class="  controls">
												<select name="visaType" id="index_visaType"
													class="form-control">
													<option value="" selected="selected">SELECT</option>
													<option value="1">Employment Pass</option>
													<option value="2">Permanent Residence</option>
													<option value="3">Others</option>


												</select>

											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaNo">Visa
												No <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="visaNo" maxlength="20" value=""
													id="index_visaNo" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_visaExpiryDate">Visa
												Expiry Date <span class="required">*</span>
											</label>
											<div class="  controls">

												<input type="text" name="visaExpiryDate" value=""
													id="index_visaExpiryDate" class="form-control datepicker" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="resZip">Residence
												Zip </label>
											<div class="  controls">

												<input type="text" name="resZip" maxlength="6" value=""
													id="resZip" class="form-control"/>
											</div>
										</div>

									</div>
									<div class="col-md-8">
										<div class="form-group ">
											<label class="  control-label" for="resAddress1">Residence
												Address1 </label>
											<div class="  controls">

												<input type="text" name="resAddress1" maxlength="128"
													value="" id="resAddress1" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-8 col-md-offset-4">
										<div class="form-group ">
											<label class="  control-label" for="resAddress2">Residence
												Address2 </label>
											<div class="  controls">

												<input type="text" name="resAddress2" maxlength="128"
													value="" id="resAddress2" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="mailZip">Mailing
												Zip </label>
											<div class="  controls">

												<input type="text" name="mailZip" maxlength="10" value=""
													id="mailZip" class="form-control"/>
											</div>
										</div>

									</div>
									<div class="col-md-8">
										<div class="form-group ">
											<label class="  control-label" for="mailAddress1">Mailing
												Address1 </label>
											<div class="  controls">

												<input type="text" name="mailAddress1" maxlength="128"
													value="" id="mailAddress1" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-8 col-md-offset-4">
										<div class="form-group ">
											<label class="  control-label" for="mailAddress2">Mailing
												Address2 </label>
											<div class="  controls">

												<input type="text" name="mailAddress2" maxlength="128"
													value="" id="mailAddress2" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_resPhone">Residence
												Phone </label>
											<div class="  controls">

												<input type="text" name="resPhone" maxlength="16" value=""
													id="index_resPhone" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_cellPhone">Cell
												Phone </label>
											<div class="  controls">

												<input type="text" name="cellPhone" maxlength="16" value=""
													id="index_cellPhone" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_email">Email
											</label>
											<div class="  controls">

												<input type="text" name="email" maxlength="128" value=""
													id="index_email" class="form-control" />
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_parBirthDay">Birthday
											</label>
											<div class="  controls">

												<input type="text" name="parBirthDay" value=""
													id="index_parBirthDay" class="form-control datepicker" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="index_passportNo">Passport
												No </label>
											<div class="  controls">

												<input type="text" name="passportNo" maxlength="20" value=""
													id="index_passportNo" class="form-control" />
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group ">
											<label class="  control-label" for="nationalityId">Nationality
											</label>
											<div class="  controls">
												<select name="nationalityId" id="nationalityId"
													class="form-control">
													<option value="" selected="selected">Any
														Value</option>
													<option value="32">ARGENTINA</option>
												</select>

											</div>
										</div>

									</div>
								</div>
							</div>

							<div class="box-header with-border">
								<h3 class="box-title">Family Information</h3>
							</div>
							<div class="box-body panel-primary table-responsive">
								<div class="col-md-13">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoAlphaSurName">Spouse
													Surname(English) </label>
												<div class="  controls">

													<input type="text" name="spoAlphaSurName" maxlength="64"
														value="" id="index_spoAlphaSurName" class="form-control" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoAlphaFstName">Spouse
													First Name(English) </label>
												<div class="  controls">

													<input type="text" name="spoAlphaFstName" maxlength="128"
														value="" id="index_spoAlphaFstName" class="form-control" />
												</div>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoKanjiSurName">Spouse
													Surname(Kanji) </label>
												<div class="  controls">

													<input type="text" name="spoKanjiSurName" maxlength="128"
														value="" id="index_spoKanjiSurName" class="form-control" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoKanjiFstName">Spouse
													First Name(Kanji) </label>
												<div class="  controls">

													<input type="text" name="spoKanjiFstName" maxlength="128"
														value="" id="index_spoKanjiFstName" class="form-control" />
												</div>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoKanaSurName">Spouse
													Surname(Kana) </label>
												<div class="  controls">

													<input type="text" name="spoKanaSurName" maxlength="128"
														value="" id="index_spoKanaSurName" class="form-control" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_spoKanaFstName">Spouse
													First Name(Kana) </label>
												<div class="  controls">

													<input type="text" name="spoKanaFstName" maxlength="128"
														value="" id="index_spoKanaFstName" class="form-control" />
												</div>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_sib1">Siblings
													Name 1 </label>
												<div class="  controls">

													<input type="text" name="sib1" maxlength="64" value=""
														id="index_sib1" class="form-control" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_sib2">Siblings
													Name 2 </label>
												<div class="  controls">

													<input type="text" name="sib2" maxlength="64" value=""
														id="index_sib2" class="form-control" />
												</div>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_sib3">Siblings
													Name 3 </label>
												<div class="  controls">

													<input type="text" name="sib3" maxlength="64" value=""
														id="index_sib3" class="form-control" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group ">
												<label class="  control-label" for="index_sib4">Siblings
													Name 4 </label>
												<div class="  controls">

													<input type="text" name="sib4" maxlength="64" value=""
														id="index_sib4" class="form-control" />
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

			</div>

			<input type="hidden" id="smsTransitionManagerId"
				name="smsTransitionManagerId" />

		</fieldset>
	</form>

	<%@include file = "../layout/script.jsp" %>

</body>

</html>