$(function() {
	entity.initTransferModal(function() {
		afterTransferEntity()
	});
	entity.initShareModal();
	entity.initTaskModal();
	entity.initUpdateNoteModal();
	$("#changeTagModal").on("show.bs.modal", function(a) {
		var b = new Array();
		$("#customer-detail-tag-list span").each(function(c) {
			b.push($(this).data("value"))
		});
		$("#customer-changeTag").val(b).trigger("change")
	});
	$("#customer-changeTag-btn").click(function(a) {
		customer.updateTags(_targetId)
	});
	$('[data-tooltip="tooltip"]').tooltip({
		trigger: "hover"
	});
	$(".modal [data-plugin='select2']").select2();
	$("[data-plugin='datepicker']").datepicker({
		format: "yyyy-mm-dd",
		autoclose: true,
		todayBtn: "linked"
	});
	$("[data-plugin='datetimepicker']").datetimepicker({
		format: "YYYY-MM-DD HH:mm:ss"
	});
	$("#add-attachment-btn").click(function(a) {
		a.preventDefault();
		attachment.startUploadFiles()
	});
	$("#transferCommonCustomerModal").on("show.bs.modal", function(b) {
		var a = $(b.relatedTarget);
		if (typeof a.data("target") === "undefined") {
			$("#transfer-common-customer-btn").data("isBatch", true)
		} else {
			$("#transfer-common-customer-btn").data("isBatch", false)
		}
	});
	$("#transfer-common-customer-btn").click(function(a) {
		a.preventDefault();
		entity.transferCustomerToCommon()
	});
	$("#recordModal").on("show.bs.modal", function(c) {
		var b = $(c.relatedTarget);
		var a = b.data("filepath");
		$("#recordModal-audio").html("<audio src='/file/download?key=" + encodeURIComponent(a) +
			"&fileName=callrecord.mp3' preload='auto' controls></audio>");
		$(this).find("audio").audioPlayer()
	}).on("hidden.bs.modal", function(a) {
		$("#recordModal-audio").html("")
	})
});

function afterTransferEntity() {
	if (_isSinglePage) {
		location.reload();
		return
	}
	customerList.loadCustomer(customerList.currentPage)
};
