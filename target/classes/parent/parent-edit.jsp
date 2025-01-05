<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html>

<%@ include file="../layout/head.jsp"%>

<body class="hold-transition skin-blue fixed sidebar-mini sms-body ">
	<!-- start : wrapper -->


	<fieldset>

		<div class="wrapper">

			<%@ include file="../layout/header.jsp"%>

			<!-- start : sidebar-menu -->

			<%@ include file="../layout/sidebar.jsp"%>


			<div class="content-wrapper">

				<section class="content">
					<form action="parentedit" method="post">
						<div id="sms-top-bar" class="row">
							<div id="screen-name">Parent Details</div>
							<div id="action-buttons">
								<button type="submit" class="btn btn-warning">
									<i class="fa fa-check-square-o"></i>
									<span>Save</span>
								</button>
								<button type="button" onclick="window.history.back()" class="btn btn-default btn-back">
									<i class="fa fa-reply"></i>
									<span>Back</span>
								</button>
							</div>
						</div>


						<div class="box box-primary">
							<%
							String Id = request.getParameter("Id");
							if (Id != null && !Id.isEmpty()) {
								Connection con = null;
								PreparedStatement ps = null;
								ResultSet rs = null;
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ivs_school", "root", "Duy31082003@");
									String query = "SELECT p.*, c.Name, n.Name, j.Name, v.Name " + "FROM parent p "
									+ "LEFT JOIN company c ON p.CompanyId = c.id " + "LEFT JOIN nationality n ON p.NationalityId = n.id "
									+ "LEFT JOIN jas_type j ON p.JasTypeId = j.id " + "LEFT JOIN visa_type v ON p.VisaTypeId = v.id "
									+ "WHERE p.Id = ?";

									ps = con.prepareStatement(query);
									ps.setString(1, Id);

									rs = ps.executeQuery();

									if (rs.next()) {
								java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");

								String formattedVisaExpiryDate = rs.getDate("VisaExpiryDate") != null
										? dateFormat.format(rs.getDate("VisaExpiryDate"))
										: "";

								String formattedBirthday = rs.getDate("Birthday") != null ? dateFormat.format(rs.getDate("Birthday")) : "";

								String nationality = rs.getString("n.Name") != null ? rs.getString("n.Name") : "";

								String company = rs.getString("c.Name") != null ? rs.getString("c.Name") : "";
							%>
							<div class="box-header with-border">
								<h3 class="box-title">Parent Information</h3>
							</div>

							<div class="box-body panel-primary table-responsive">

								<input type="hidden" name="Id" value="<%=rs.getString("Id")%>" />
								<div class="form-container">
									<div class="form-group">
										<label for="ParentSurNameEnglish">
											Parent Surname (English)
											<span class="required">*</span>
										</label>
										<input type="text" name="ParentSurNameEnglish" maxlength="64" id="ParentSurNameEnglish"
											class="form-control uppercase" value="<%=rs.getString("ParentSurNameEnglish")%>" />
										<span class="error-message" id="errorParentSurNameEnglish" style="display: none;">This field is
											required.</span>
									</div>

									<div class="form-group">
										<label for="ParentFirstNameEnglish">
											Parent First Name (English)
											<span class="required">*</span>
										</label>
										<input type="text" name="ParentFirstNameEnglish" maxlength="64" id="ParentFirstNameEnglish"
											class="form-control uppercase" value="<%=rs.getString("ParentFirstNameEnglish")%>" />
										<span class="error-message" id="errorParentFirstNameEnglish" style="display: none;">This field is
											required.</span>
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="ParentSurNameKanji">
											Parent Surname (Kanji)
											<span class="required">*</span>
										</label>
										<input type="text" name="ParentSurNameKanji" maxlength="64" id="ParentSurNameKanji" class="form-control"
											value="<%=rs.getString("ParentSurNameKanji")%>" />
										<span class="error-message" id="errorParentSurNameKanji" style="display: none;">This field is required.</span>
									</div>

									<div class="form-group">
										<label for="ParentFirstNameKanji">
											Parent First Name (Kanji)
											<span class="required">*</span>
										</label>
										<input type="text" name="ParentFirstNameKanji" maxlength="64" id="ParentFirstNameKanji" class="form-control"
											value="<%=rs.getString("ParentFirstNameKanji")%>" />
										<span class="error-message" id="errorParentFirstNameKanji" style="display: none;">This field is
											required.</span>
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="ParentSurNameKana">Parent Surname (Kana)</label>
										<input type="text" name="ParentSurNameKana" maxlength="64" id="ParentSurNameKana" class="form-control"
											value="<%=rs.getString("ParentSurNameKana")%>" />
									</div>

									<div class="form-group">
										<label for="ParentFirstNameKana">Parent First Name (Kana)</label>
										<input type="text" name="ParentFirstNameKana" maxlength="64" id="ParentFirstNameKana" class="form-control"
											value="<%=rs.getString("ParentFirstNameKana")%>" />
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="JrcoNo">Jrco No</label>
										<input type="text" name="JrcoNo" disabled id="JrcoNo" class="form-control"
											value="<%=(rs.getString("JrcoNo") != null) ? rs.getString("JrcoNo") : ""%>" />
									</div>

									<div class="form-group">
										<label for="JasTypeId">
											Jas Type
											<span class="required">*</span>
										</label>
										<select name="JasTypeId" id="JasTypeId" class="form-control">
											<option value="">SELECT</option>
											<%=request.getAttribute("jasTypeDropdown")%>
										</select>
										<span class="error-message" id="errorJasTypeId" style="display: none;">This field is required.</span>
									</div>

									<div class="form-group">
										<label for="JasNo">
											Jas No
											<span class="required">*</span>
										</label>
										<input type="text" name="JasNo" maxlength="10" id="JasNo" class="form-control uppercase"
											value="<%=rs.getString("JasNo")%>" />
										<span class="error-message" id="errorJasNo" style="display: none;">This field is required.</span>
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="VisaTypeId">
											Visa Type
											<span class="required">*</span>
										</label>
										<select name="VisaTypeId" id="VisaTypeId" class="form-control">
											<option value="">SELECT</option>
											<%=request.getAttribute("visaTypeDropdown")%>
										</select>
										<span class="error-message" id="errorVisaTypeId" style="display: none;">This field is required.</span>
									</div>

									<div class="form-group">
										<label for="VisaNo">
											Visa No
											<span class="required">*</span>
										</label>
										<input type="text" name="VisaNo" maxlength="20" id="VisaNo" class="form-control uppercase"
											value="<%=rs.getString("VisaNo")%>" />
										<span class="error-message" id="errorVisaNo" style="display: none;">This field is required.</span>
									</div>

									<div class="form-group">
										<label for="VisaExpiryDate">
											Visa Expiry Date
											<span class="required">*</span>
										</label>
										<div class="input-group">
											<input type="text" name="VisaExpiryDate" id="VisaExpiryDate" class="form-control datepicker"
												value="<%=formattedVisaExpiryDate%>" />
										</div>
										<span class="error-message" id="errorVisaExpiryDate" style="display: none;">This field is required.</span>
									</div>
								</div>

								<div class="form-container zip">
									<div class="form-group zip">
										<label for="ResidenceZip">Residence Zip</label>
										<input type="text" name="ResidenceZip" maxlength="6" id="ResidenceZip" class="form-control"
											value="<%=rs.getString("ResidenceZip")%>" />
									</div>

									<div class="form-group full-width">
										<label for="ResidenceAddress1">Residence Address1</label>
										<input type="text" name="ResidenceAddress1" maxlength="128" id="ResidenceAddress1" class="form-control"
											value="<%=rs.getString("ResidenceAddress1")%>" />
									</div>
								</div>

								<div class="form-container adr">
									<div class="form-group adr">
										<label for="ResidenceAddress2">Residence Address2</label>
										<input type="text" name="ResidenceAddress2" maxlength="128" id="ResidenceAddress2" class="form-control"
											value="<%=rs.getString("ResidenceAddress2")%>" />
									</div>
								</div>

								<div class="form-container zip">
									<div class="form-group zip">
										<label for="MailingZip">Mailing Zip</label>
										<input type="text" name="MailingZip" maxlength="10" id="MailingZip" class="form-control"
											value="<%=rs.getString("MailingZip")%>" />
									</div>

									<div class="form-group full-width">
										<label for="MailingAddress1">Mailing Address1</label>
										<input type="text" name="MailingAddress1" maxlength="128" id="MailingAddress1" class="form-control"
											value="<%=rs.getString("MailingAddress1")%>" />
									</div>
								</div>

								<div class="form-container adr">
									<div class="form-group adr">
										<label for="MailingAddress2">Mailing Address2 </label>
										<input type="text" name="MailingAddress2" maxlength="128" id="MailingAddress2" class="form-control"
											value="<%=rs.getString("MailingAddress2")%>" />
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="ResidencePhone">Residence Phone</label>
										<input type="text" name="ResidencePhone" maxlength="16" id="ResidencePhone" class="form-control"
											value="<%=rs.getString("ResidencePhone")%>" />
									</div>

									<div class="form-group">
										<label for="CellPhone">Cell Phone</label>
										<input type="text" name="CellPhone" maxlength="16" id="CellPhone" class="form-control"
											value="<%=rs.getString("CellPhone")%>" />
									</div>

									<div class="form-group">
										<label for="Email">Email</label>
										<input type="text" name="Email" maxlength="128" id="Email" class="form-control"
											value="<%=rs.getString("Email")%>" />
									</div>
								</div>

								<div class="form-container">
									<div class="form-group">
										<label for="Birthday">Birthday</label>
										<div class="controls">
											<div class="input-group">
												<input type="text" name="Birthday" id="Birthday" class="form-control datepicker"
													value="<%=formattedBirthday%>" />
											</div>
										</div>
									</div>

									<div class="form-group">
										<label for="PassportNo">Passport No</label>
										<div class="controls">
											<input type="text" name="PassportNo" maxlength="20" id="PassportNo" class="form-control"
												value="<%=rs.getString("PassportNo")%>" />
										</div>
									</div>

									<div class="form-group">
										<label for="NationalityId">Nationality</label>
										<div class="controls">
											<select name="NationalityId" id="NationalityId" class="form-control">
												<option value="">Any Value</option>
												<%=request.getAttribute("nationalityDropdown")%>
											</select>
										</div>
									</div>
								</div>

								<div class="form-container company">
									<div class="form-group company">
										<label for="CompanyId">Company Name </label>
										<select name="CompanyId" id="CompanyId" class="form-control">
											<option value=""></option>
											<%=request.getAttribute("companyDropdown")%>
										</select>
									</div>
								</div>
							</div>

							<div class="box-header with-border">
								<h3 class="box-title">Family Information</h3>
							</div>

							<div class="box-body panel-primary table-responsive">
								<div class="form-container">
									<div class="form-group">
										<label for="SpouseSurNameEnglish">Spouse Surname (English)</label>
										<input type="text" name="SpouseSurNameEnglish" maxlength="64" id="SpouseSurNameEnglish" class="form-control"
											value="<%=rs.getString("SpouseSurNameEnglish")%>" />
									</div>

									<div class="form-group">
										<label for="SpouseFirstNameEnglish">Spouse First Name (English)</label>
										<input type="text" name="SpouseFirstNameEnglish" maxlength="128" id="SpouseFirstNameEnglish"
											class="form-control" value="<%=rs.getString("SpouseFirstNameEnglish")%>" />
									</div>
								</div>
								<div class="form-container">
									<div class="form-group">
										<label for="SpouseSurNameKanji">Spouse Surname (Kanji)</label>
										<input type="text" name="SpouseSurNameKanji" maxlength="128" id="SpouseSurNameKanji" class="form-control"
											value="<%=rs.getString("SpouseSurNameKanji")%>" />
									</div>

									<div class="form-group">
										<label for="SpouseFirstNameKanji">Spouse First Name (Kanji)</label>
										<input type="text" name="SpouseFirstNameKanji" maxlength="128" id="SpouseFirstNameKanji" class="form-control"
											value="<%=rs.getString("SpouseFirstNameKanji")%>" />
									</div>
								</div>
								<div class="form-container">
									<div class="form-group">
										<label for="SpouseSurNameKana">Spouse Surname (Kana)</label>
										<input type="text" name="SpouseSurNameKana" maxlength="128" id="SpouseSurNameKana" class="form-control"
											value="<%=rs.getString("SpouseSurNameKana")%>" />
									</div>

									<div class="form-group">
										<label for="SpouseFirstNameKana">Spouse First Name (Kana)</label>
										<input type="text" name="SpouseFirstNameKana" maxlength="128" id="SpouseFirstNameKana" class="form-control"
											value="<%=rs.getString("SpouseFirstNameKana")%>" />
									</div>
								</div>
								<div class="form-container">
									<div class="form-group">
										<label for="SiblingsName1">Siblings Name 1</label>
										<input type="text" name="SiblingsName1" maxlength="64" id="SiblingsName1" class="form-control"
											value="<%=rs.getString("SiblingsName1")%>" />
									</div>

									<div class="form-group">
										<label for="SiblingsName2">Siblings Name 2</label>
										<input type="text" name="SiblingsName2" maxlength="64" id="SiblingsName2" class="form-control"
											value="<%=rs.getString("SiblingsName2")%>" />
									</div>
								</div>
								<div class="form-container">
									<div class="form-group">
										<label for="SiblingsName3">Siblings Name 3</label>
										<input type="text" name="SiblingsName3" maxlength="64" id="SiblingsName3" class="form-control"
											value="<%=rs.getString("SiblingsName3")%>" />
									</div>

									<div class="form-group">
										<label for="SiblingsName4">Siblings Name 4</label>
										<input type="text" name="SiblingsName4" maxlength="64" id="SiblingsName4" class="form-control"
											value="<%=rs.getString("SiblingsName4")%>" />
									</div>
								</div>
							</div>
						</div>
						<%
						} else {
						out.println("<p> Khong tim thay id: " + Id + "</p>");
						}
						} catch (Exception e) {
						out.println("<p>Error while retrieving data: " + e.getMessage() + "</p>");
						} finally {
						if (rs != null)
						rs.close();
						if (ps != null)
						ps.close();
						if (con != null)
						con.close();
						}
						} else {
						out.println("<p>Please provide a Parent ID.</p>");
						}
						%>
					</form>
				</section>
				<div>
					<button id="scrollToTop" style="display: none;">
						<i class="fa fa-chevron-up"></i>
					</button>
				</div>
			</div>

		</div>
	</fieldset>


	<input type="hidden" id="smsTransitionManagerId" name="smsTransitionManagerId" />

	<%@include file="../layout/script.jsp"%>

</body>

</html>