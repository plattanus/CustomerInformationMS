var ENTITY_CUSTOMER = 2;
var ENTITY_CONTACT = 3;
var ENTITY_DEAL = 4;
var ENTITY_CONTRACT = 5;
var ENTITY_PAYMENT = 6;
var ENTITY_INVOICE = 7;
var ENTITY_PRODUCT = 8;
var ENTITY_PRODUCT_CATEGORY = 9;
var ENTITY_TASK = 10;
var ENTITY_WORKSHEET = 11;
var ENTITY_STATISTICS = 12;
var ENTITY_CALLCENTER = 13;
var ENTITY_TEMPLATE = 14;
var ENTITY_WEIXIN = 15;
var ENTITY_NOTE = 20;
var ENTITY_USER = 101;
var ENTITY_GROUP = 102;
var VISIBLE_PRIVATE = 1;
var VISIBLE_PUBLIC = 2;
var LIST_VIEW_TYPE_LIST = 1;
var LIST_VIEW_TYPE_STAGE = 2;
var LIST_VIEW_TYPE_DATE = 3;
var DEAL_STATUS_LOST = 0;
var DEAL_STATUS_DOING = 1;
var DEAL_STATUS_WON = 2;
var WORKSHEET_STATUS_NEW = 0;
var WORKSHEET_STATUS_DOING = 1;
var WORKSHEET_STATUS_FINISH = 2;
var SMS_TEMPLATE_STATUS_NEW = 1;
var SMS_TEMPLATE_STATUS_SUCCESS = 2;
var SMS_TEMPLATE_STATUS_FAILED = 3;
var WORK_REPORT_TYPE_ME = 0;
var STATUS_SUCCESS = 1;

function isEmail(a) {
	var b = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	return b.test(a)
}

function isMobile(a) {
	var b = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(199))+\d{8})$/;
	return b.test(a)
}

function isTel(a) {
	var b = /^([0-9]{3,4})?[0-9]{7,8}$/;
	return b.test(a)
}

function isURL(b) {
	var a = new RegExp(
		"^(https?:\\/\\/)?((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|((\\d{1,3}\\.){3}\\d{1,3}))(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*(\\?[;&a-z\\d%_.~+=-]*)?(\\#[-a-z\\d_]*)?$",
		"i");
	return a.test(b)
}

function HTMLEnCode(b) {
	var a = "";
	if (b.length == 0) {
		return ""
	}
	a = b.replace(/&/g, "&gt;");
	a = a.replace(/</g, "&lt;");
	a = a.replace(/>/g, "&gt;");
	a = a.replace(/    /g, "&nbsp;");
	a = a.replace(/\'/g, "'");
	a = a.replace(/\"/g, "&quot;");
	a = a.replace(/\n/g, "<br>");
	return a
}
$.ajaxSetup({
	complete: function(b, a) {
		if (b.status == 408) {
			toastr.error("您长时间未操作，已经超时。2 秒后将自动跳转到登录页面");
			setTimeout(function() {
				window.location.href = "/login"
			}, 2000);
			return
		}
		if (b.status == 401) {
			alertify.alert("您没有相关的操作权限")
		}
	}
});

function getArrayName(c, b) {
	if (b <= 0) {
		return ""
	}
	if (c === null) {
		return ""
	}
	var a = "";
	$.each(c, function(d, e) {
		if (e.id == b) {
			a = e.name;
			return false
		}
	});
	return a
}

function getDictionary(b, a) {
	if (a <= 0) {
		return ""
	}
	if (b === null) {
		return ""
	}
	var c = "";
	$.each(b, function(d, e) {
		if (e.id == a) {
			c = e;
			return false
		}
	});
	return c
}

function getEncodedArrayName(c, b) {
	if (b <= 0) {
		return ""
	}
	if (c === null) {
		return ""
	}
	var a = "";
	$.each(c, function(d, e) {
		if (e.encodedId == b) {
			a = e.name;
			return false
		}
	});
	return a
}

function getRecursiveArray(b, c, a) {
	$.each(c, function(d, e) {
		b.push({
			value: e.encodedId,
			text: e.name
		});
		if (e.children.length > 0) {
			getRecursiveArray(b, e.children, a + 1)
		}
	})
}

function getRecursiveArrayName(b, a) {
	if (b === null) {
		return ""
	}
	return getSubRecursiveArrayName({
		children: b
	}, a)
}

function getSubRecursiveArrayName(c, b) {
	if (c.encodedId == b) {
		return c.name
	}
	var a = "";
	$.each(c.children, function(d, e) {
		a = getSubRecursiveArrayName(e, b);
		if (a != "") {
			return false
		}
	});
	return a
}

function isImage(a) {
	var b = getSuffix(a);
	if (b == "") {
		return false
	}
	var c = false;
	$.each(["png", "jpeg", "jpg", "gif", "bmp"], function(d, e) {
		if (b == e) {
			c = true;
			return false
		}
	});
	return c
}

function getSuffix(a) {
	if (a == "" || isUndefined(a)) {
		return ""
	}
	var c = a.lastIndexOf(".");
	var b = "";
	if (c != -1) {
		b = a.substring(c + 1)
	}
	return $.trim(b)
}

function getFileIcon(a) {
	var b = getSuffix(a);
	if (b == "") {
		return "icon-file"
	}
	var c = "icon-file";
	$.each(["ppt", "pptx", "rar", "zip", "xls", "xlsx", "doc", "docx", "pdf", "mp3"], function(d, e) {
		if (b == e) {
			c = c + "-" + b;
			return false
		}
	});
	return c
}

function getFileSize(b) {
	var a = b / 1024;
	a = Math.round(a * Math.pow(10, 1)) / Math.pow(10, 1);
	if (a == 0) {
		a = 1
	}
	if (a < 1024) {
		a = a + " Bytes"
	} else {
		if (a < 1024 * 1024) {
			a = b / (1024 * 1024);
			a = Math.round(a * Math.pow(10, 1)) / Math.pow(10, 1);
			a = a + " MB"
		} else {
			a = b / (1024 * 1024 * 1024);
			a = Math.round(a * Math.pow(10, 1)) / Math.pow(10, 1);
			a = a + " G"
		}
	}
	return a
}

function checkInput(a) {
	$("#" + a + " .form-group").removeClass("has-error");
	var b = true;
	$("#" + a + " [data-field-required='true']").each(function() {
		if ($.trim($(this).val()) == "") {
			b = false;
			var c = $(this).closest(".form-group").addClass("has-error");
			c.find(".help-block").text(c.find("label.control-label").text() + "必须输入")
		}
	});
	$("#" + a + " [data-field-number='true']").each(function() {
		var d = $(this).val();
		if (d != "" && !$.isNumeric(d)) {
			b = false;
			var c = $(this).closest(".form-group").addClass("has-error");
			c.find(".help-block").text(c.find("label.control-label").text() + "必须为数字")
		}
	});
	$("#" + a + " [data-field-tel='true']").each(function() {
		var d = $(this).val();
		if (d != "" && !isMobile(d) && !isTel(d)) {
			b = false;
			var c = $(this).closest(".form-group").addClass("has-error");
			c.find(".help-block").text(c.find("label.control-label").text() + "电话格式不正确")
		}
	});
	$("#" + a + " [data-field-email='true']").each(function() {
		var d = $(this).val();
		if (d != "" && !isEmail(d)) {
			b = false;
			var c = $(this).closest(".form-group").addClass("has-error");
			c.find(".help-block").text(c.find("label.control-label").text() + "邮箱格式不正确")
		}
	});
	$("#" + a + " [data-field-website='true']").each(function() {
		var d = $(this).val();
		if (d != "" && !isURL(d)) {
			b = false;
			var c = $(this).closest(".form-group").addClass("has-error");
			c.find(".help-block").text(c.find("label.control-label").text() + "网址格式不正确，正确格式: http://www.qikebao.com")
		}
	});
	return b
}

function isUndefined(a) {
	return (typeof a === "undefined")
}

function getFormatDate(a, b) {
	if (isUndefined(a)) {
		return ""
	}
	if (a == "" || a == null) {
		return ""
	}
	return moment(a).format(b)
}
Number.prototype.formatTime = function() {
	var c = 0,
		a = 0,
		b = parseInt(this);
	if (b > 60) {
		a = parseInt(b / 60);
		b = parseInt(b % 60);
		if (a > 60) {
			c = parseInt(a / 60);
			a = parseInt(a % 60)
		}
	}
	var d = function(e) {
		return (e >> 0) < 10 ? "0" + e : e
	};
	return [d(c), d(a), d(b)].join(":")
};

function time2Second(b) {
	if (b == "0") {
		return 0
	}
	var a = b.split(":");
	if (a.length != 3) {
		return 0
	}
	return parseInt(a[2]) + parseInt(a[1]) * 60 + parseInt(a[0]) * 3600
}

function getRandFileName(b) {
	var c = "abcdefghijklmnopqrstuvwxyz0123456789";
	var a = c.length;
	var d = "";
	for (i = 0; i < b; i++) {
		d += c.charAt(Math.floor(Math.random() * a))
	}
	return d
};
