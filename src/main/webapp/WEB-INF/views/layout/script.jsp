<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <script type="text/javascript">
	// Kiểm tra xem thư viện jQuery đã được tải hay chưa
	if (typeof jQuery != 'undefined') {
		// Kiểm tra xem plugin 'tooltip' của jQuery có khả dụng hay không
		if (typeof jQuery.fn.tooltip == 'function') {
			// Kích hoạt tooltip cho các phần tử <i> có class là 's2b_tooltip'
			// Tooltip hiển thị thông tin khi người dùng di chuột qua các phần tử này
			jQuery('i.s2b_tooltip').tooltip();
		}
	}
</script> -->

<script>
	// Biến toàn cục lưu trữ trạng thái hiện tại hoặc sự kiện
	var eventId = 'index'; // Xác định trạng thái hoặc trang hiện tại, ở đây là trang "index"
	var submitted = false; // Biến kiểm tra trạng thái form, ban đầu chưa được gửi (false)
</script>
<!-- Thư viện cho checkbox-radio box -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>
<!-- Required JS -->
<!-- jQuery v2.2.3 -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/jQuery/jquery-2.2.3.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/Plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- bootstrap-fileinput -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/kartik-v-bootstrap-fileinput/js/fileinput.min.js"></script>
<!-- Bootstrap v3.3.7 -->
<script	src="${pageContext.request.contextPath}/assets/Bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/Plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- InputMask -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/input-mask/jquery.inputmask.js"></script>
<script	src="${pageContext.request.contextPath}/assets/Plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<!-- AdminLTE v2.3.8 -->
<script	src="${pageContext.request.contextPath}/assets/AdminLTE/js/app.js"></script>
<!-- Plugins -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/Plugins/slimScroll/jquery.slimscrollH.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/Plugins/datepicker/bootstrap-datepicker.min.js"></script>
<!-- iCheck 1.0.1 -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/iCheck/icheck.min.js"></script>
<!-- SMS Common JS -->
<script	src="${pageContext.request.contextPath}/assets/Plugins/jquery-loading-overlay-1.5.3/loadingoverlay.min.js"></script>
<!-- js chung -->
<script	src="${pageContext.request.contextPath}/assets/Layout/js/layout.js"></script>