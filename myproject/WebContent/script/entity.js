var entity = {
	clickLink: "",
	selectEntityIds: "",
	loadEntityStatistics: function(a) {
		$.ajax({
			url: "/" + a + "/detail/" + encodeURIComponent(_targetId) + "/statistics?random=" + Math.random(),
			type: "GET",
			dataType: "json",
			timeout: 60000,
			error: function(d, b, c) {
				alertify.alert("统计信息加载失败，请稍后再试")
			},
			success: function(b) {
				if (b.code <= 0) {
					alertify.alert(b.message);
					return
				}
				$.each(b.items, function(c, d) {
					$("#" + c).text(d);
					if ((d + "").length >= 8) {
						$("#" + c).addClass("min")
					}
				})
			}
		})
	},
	initToggleAdvSearchMode: function() {
		$("#show-adv-search-link").click(function(a) {
			a.preventDefault();
			$(this).closest(".search-item-container").addClass("adv");
		});
		$("#show-basic-search-btn").click(function() {
			$(this).closest(".search-item-container").removeClass("adv");
		})
	},
	initCustomFields: function(a, c) {
		var b = this;
		$("#entity-fields-container .dropdown-menu-checkbox-list").click(function(d) {
			d.stopPropagation()
		});
		$("#dropdown-entity-fields").on("shown.bs.dropdown", function() {
			$(this).find(".dropdown-menu-checkbox-list").asScrollable({
				contentSelector: ">",
				containerSelector: ">"
			})
		});
		$("#entity-fields-container input:checkbox").change(function() {
			if ($(this).prop("checked")) {
				$("#header-field-" + $(this).val()).removeClass("hide");
				$("td.item-" + $(this).val()).removeClass("hide")
			} else {
				$("#header-field-" + $(this).val()).addClass("hide");
				$("td.item-" + $(this).val()).addClass("hide")
			}
		});
		$("#change-fields-btn").click(function(f) {
			var d = $("#entity-fields-container input:checked[name=field-checkbox]").map(function() {
				return $(this).val()
			}).get().join();
			b.updateCustomFields(a, d, c)
		})
	},
	updateCustomFields: function(a, b, c) {
		$.ajax({
			url: "/profile/field/update",
			type: "POST",
			data: {
				category: a,
				ids: b
			},
			dataType: "json",
			timeout: 60000,
			error: function(f, d, e) {
				alertify.alert("更新一览页面中显示字段信息失败，请稍后再试")
			},
			success: function(d) {
				if (d.code <= 0) {
					alertify.alert(d.message);
					return
				}
				toastr.success("一览显示字段信息更新成功");
				_showFieldIds = b;
				if (c && typeof(c) === "function") {
					c()
				}
			}
		})
	},
	updateCustomFieldSort: function(a, c, b) {
		var url = '/myproject/customer/mycustomersort?mybook=';
		url += c;
		console.log(url);
		window.location.href = url;
		
//		$.ajax({
//			url: "/profile/field/update/sort",
//			type: "POST",
//			data: {
//				category: a,
//				sortField: c,
//				sortOrder: b
//			},
//			dataType: "json",
//			timeout: 60000,
//			error: function(f, d, e) {
//				alertify.alert("一览页面中排序字段信息更新失败，请稍后再试")
//			},
//			success: function(d) {
//				if (d.code <= 0) {
//					alertify.alert(d.message);
//					return
//				}
//				toastr.success("一览显示字段信息更新成功");
//				_sortField = c;
//				_sortOrder = b
//			}
//		})
	},
	getEntityIcon: function(a) {
		if (a == ENTITY_CUSTOMER) {
			return "company"
		}
		if (a == ENTITY_CONTACT) {
			return "contacts"
		}
		if (a == ENTITY_DEAL) {
			return "deal"
		}
		if (a == ENTITY_CONTRACT) {
			return "contract"
		}
		if (a == ENTITY_PAYMENT) {
			return "payment"
		}
		if (a == ENTITY_INVOICE) {
			return "invoice"
		}
		if (a == ENTITY_PRODUCT) {
			return "product"
		}
		if (a == ENTITY_PRODUCT_CATEGORY) {
			return "product"
		}
		if (a == ENTITY_TASK) {
			return "task"
		}
		if (a == ENTITY_WORKSHEET) {
			return "worksheet"
		}
		if (a == ENTITY_STATISTICS) {
			return "statistics"
		}
		if (a == ENTITY_CALLCENTER) {
			return "tel"
		}
		return "note2"
	},
	getEntityTypeName: function(a) {
		if (a == ENTITY_CUSTOMER) {
			return "客户"
		}
		if (a == ENTITY_CONTACT) {
			return "联系人"
		}
		if (a == ENTITY_DEAL) {
			return "销售机会"
		}
		if (a == ENTITY_CONTRACT) {
			return "合同"
		}
		if (a == ENTITY_PAYMENT) {
			return "款项"
		}
		if (a == ENTITY_INVOICE) {
			return "票据"
		}
		if (a == ENTITY_PRODUCT) {
			return "产品"
		}
		if (a == ENTITY_PRODUCT_CATEGORY) {
			return "产品分类"
		}
		if (a == ENTITY_TASK) {
			return "任务提醒"
		}
		if (a == ENTITY_WORKSHEET) {
			return "工单"
		}
		if (a == ENTITY_STATISTICS) {
			return "统计分析"
		}
		if (a == ENTITY_CALLCENTER) {
			return "呼叫中心"
		}
		return ""
	},
	getEntityTypeKey: function(a) {
		if (a == ENTITY_CUSTOMER) {
			return "customer"
		}
		if (a == ENTITY_CONTACT) {
			return "contact"
		}
		if (a == ENTITY_DEAL) {
			return "deal"
		}
		if (a == ENTITY_CONTRACT) {
			return "contract"
		}
		if (a == ENTITY_PAYMENT) {
			return "payment"
		}
		if (a == ENTITY_INVOICE) {
			return "invoice"
		}
		if (a == ENTITY_PRODUCT) {
			return "product"
		}
		if (a == ENTITY_PRODUCT_CATEGORY) {
			return "productCategory"
		}
		if (a == ENTITY_TASK) {
			return "task"
		}
		if (a == ENTITY_WORKSHEET) {
			return "worksheet"
		}
		if (a == ENTITY_STATISTICS) {
			return "statistics"
		}
		if (a == ENTITY_CALLCENTER) {
			return "callCenter"
		}
		return ""
	},
	getEntityUrl: function(b, a) {
		if (a == ENTITY_CUSTOMER) {
			return "/customer/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_CONTACT) {
			return "/contact/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_DEAL) {
			return "/deal/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_CONTRACT) {
			return "/contract/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_PAYMENT) {
			return "/payment/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_INVOICE) {
			return "/invoice/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_PRODUCT) {
			return "/product/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_PRODUCT_CATEGORY) {
			return "/product"
		}
		if (a == ENTITY_TASK) {
			return "/task/detail/" + encodeURIComponent(b)
		}
		if (a == ENTITY_WORKSHEET) {
			return "/worksheet/detail/" + encodeURIComponent(b)
		}
		return "#"
	},
	initPageSizeDropMenu: function(a) {
		$("#dropdown-menu-pageSize ul li a").click(function(b) {
			b.preventDefault();
			$("#dropdown-menu-pageSize span.pageSize").text($(this).text());
			a($(this).data("value"));
			var mypagesize=$(this).data("value");
			var url = '/myproject/customer/customerList2?mypagesize=';
			url += mypagesize;
//			alert(url);
			console.log(url);
			window.location.href = url;
		})
	},
	loadProductDialogInfo: function() {
		$("#productSelectModal").on("show.bs.modal", function(b) {
			var a = $(b.relatedTarget);
			$(this).find(".modal-body").load("/product/dialog")
		})
	},
	initChangeDealModal: function() {
		var a = this;
		a.initModalSearchCustomerSelect("entity-change-customerId");
		$("#changeDealModal").on("show.bs.modal", function(b) {
			a.clickLink = $(b.relatedTarget);
			$("#entity-change-customerId").val(null).trigger("change");
			$("#entity-change-dealId").val(null).trigger("change");
			$("#form-change-deal .form-group").removeClass("has-error");
			$("#form-change-deal .help-block").text("")
		});
		$("#change-deal-btn").click(function(b) {
			b.preventDefault();
			a.changeDeal($(this).data("name"))
		})
	},
	changeDeal: function(a) {
		if (!checkInput("form-change-deal")) {
			return
		}
		var e = this;
		var c = $("#change-deal-btn").button("loading");
		var b = $("#entity-change-customerId").val();
		var d = $("#entity-change-dealId").val();
		$.ajax({
			url: "/" + a + "/update/deal",
			type: "POST",
			data: {
				id: _targetId,
				customerId: b,
				dealId: d
			},
			dataType: "json",
			timeout: 60000,
			error: function(h, f, g) {
				c.button("reset");
				alertify.alert("所属销售机会更新失败，请稍后再试")
			},
			success: function(f) {
				c.button("reset");
				if (f.code <= 0) {
					alertify.alert(f.message);
					return
				}
				toastr.success("所属销售机会更新成功");
				$("#changeDealModal").modal("hide");
				$("#" + e.clickLink.data("customerlinkid")).text($("#entity-change-customerId :selected").text());
				$("#" + e.clickLink.data("deallinkid")).text($("#entity-change-dealId :selected").text())
			}
		})
	},
	initChangeContractModal: function() {
		var a = this;
		a.initModalSearchCustomerSelect("entity-change-customerId");
		$("#changeContractModal").on("show.bs.modal", function(b) {
			a.clickLink = $(b.relatedTarget);
			$("#entity-change-customerId").val(null).trigger("change");
			$("#entity-change-contractId").val(null).trigger("change");
			$("#form-change-contract .form-group").removeClass("has-error");
			$("#form-change-contract .help-block").text("")
		});
		$("#change-contract-btn").click(function(b) {
			b.preventDefault();
			a.changeContract($(this).data("name"))
		})
	},
	changeContract: function(a) {
		if (!checkInput("form-change-contract")) {
			return
		}
		var e = this;
		var c = $("#change-deal-btn").button("loading");
		var b = $("#entity-change-customerId").val();
		var d = $("#entity-change-contractId").val();
		$.ajax({
			url: "/" + a + "/update/contract",
			type: "POST",
			data: {
				id: _targetId,
				customerId: b,
				contractId: d
			},
			dataType: "json",
			timeout: 60000,
			error: function(h, f, g) {
				c.button("reset");
				alertify.alert("关联客户和合同更新失败，请稍后再试")
			},
			success: function(f) {
				c.button("reset");
				if (f.code <= 0) {
					alertify.alert(f.message);
					return
				}
				toastr.success("关联客户和合同更新成功");
				$("#changeContractModal").modal("hide");
				$("#" + e.clickLink.data("customerlinkid")).text($("#entity-change-customerId :selected").text());
				$("#" + e.clickLink.data("contractlinkid")).text($("#entity-change-contractId :selected").text())
			}
		})
	},
	initChangeContactModal: function() {
		var a = this;
		$("#entity-change-contactId").select2();
		$("#changeContactModal").on("show.bs.modal", function(d) {
			a.clickLink = $(d.relatedTarget);
			var c = a.clickLink.data("customerid");
			$("#entity-change-contact-customerId").val(c);
			var b = $("#entity-change-contactId");
			b.html("<option value=''>请选择客户联系人</option>");
			b.val(null).trigger("change");
			$("#form-change-contact .form-group").removeClass("has-error");
			a.initRelationSelectOption(c, "contact", b)
		});
		$("#change-contact-btn").click(function(b) {
			b.preventDefault();
			a.changeContact()
		})
	},
	changeContact: function() {
		var d = this;
		var b = $("#change-contact-btn").button("loading");
		var c = $("#entity-change-contactId").val();
		var a = $("#change-contact-btn").data("name");
		$.ajax({
			url: "/" + a + "/update",
			type: "POST",
			data: {
				id: _targetId,
				value: c,
				pk: "contactId"
			},
			dataType: "json",
			timeout: 60000,
			error: function(g, e, f) {
				b.button("reset");
				alertify.alert("客户联系人失败，请稍后再试")
			},
			success: function(e) {
				b.button("reset");
				if (e.code <= 0) {
					alertify.alert(e.message);
					return
				}
				toastr.success("客户联系人更新成功");
				$("#changeContactModal").modal("hide");
				d.clickLink.text($("#entity-change-contactId :selected").text())
			}
		})
	},
	initTaskModal: function() {
		$("#addUpdateTaskModal").on("shown.bs.modal", function(a) {
			$("#task-remark").focus()
		}).on("show.bs.modal", function(b) {
			var a = $(b.relatedTarget);
			$("#task-id").val(a.data("targetid"));
			if (a.data("targetid") == "") {
				$("#task-remark, #task-startDate").val("");
				$("#task-Modal-title").text("创建任务提醒");
				return
			}
			$("#task-Modal-title").text("修改任务提醒");
			$("#task-remark").val(a.data("remark"));
			$("#task-startDate").val(a.data("startdate"));
			$("#task-ownerUserId").val(a.data("owneruserid")).trigger("change")
		});
		$("#addUpdate-task-btn").click(function() {
			task.addUpdateTask()
		})
	},
	initChangeCustomerModal: function() {
		var a = this;
		a.initModalSearchCustomerSelect("entity-change-customerId");
		$("#changeCustomerModal").on("show.bs.modal", function(b) {
			a.clickLink = $(b.relatedTarget);
			$("#form-change-customer .form-group").removeClass("has-error")
		});
		$("#change-customer-btn").click(function() {
			a.changeCustomer()
		})
	},
	changeCustomer: function() {
		if (!checkInput("form-change-customer")) {
			return
		}
		var d = this;
		var c = $("#change-customer-btn").button("loading");
		var b = $("#entity-change-customerId").val();
		var a = $("#change-customer-btn").data("name");
		$.ajax({
			url: "/" + a + "/update",
			type: "POST",
			data: {
				id: _targetId,
				value: b,
				pk: "customerId"
			},
			dataType: "json",
			timeout: 60000,
			error: function(g, e, f) {
				c.button("reset");
				alertify.alert("所属客户失败，请稍后再试")
			},
			success: function(e) {
				c.button("reset");
				if (e.code <= 0) {
					alertify.alert(e.message);
					return
				}
				toastr.success("所属客户更新成功");
				$("#changeCustomerModal").modal("hide");
				d.clickLink.text($("#entity-change-customerId :selected").text());
				var f = d.clickLink.data("relationlinkid");
				if (f == "") {
					return
				}
				$("#" + f).data("customerid", b).text("点击设置")
			}
		})
	},
	transferCustomerToCommon: function() {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/totransfercommon';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
//			alert(url);
		    console.log(url);
		    window.location.href = url;

//		var a = $("#customer-publicGroupId").val();
//		if (a == "") {
//			alertify.alert("请选择公海");
//			return
//		}
//		var f = this;
//		var d = $("#transfer-common-customer-btn").data("isBatch");
//		var c = "/customer/transferCommon" + (d ? "/batch" : "");
//		var b = {
//			publicGroupId: a
//		};
//		if (d) {
//			b.ids = entity.selectEntityIds
//		} else {
//			b.id = _targetId
//		}
//		var e = $("#transfer-common-customer-btn").button("loading");
//		$.ajax({
//			url: c,
//			type: "POST",
//			data: b,
//			dataType: "json",
//			timeout: 60000,
//			error: function(i, g, h) {
//				e.button("reset");
//				alertify.alert("客户转移失败，请稍后再试")
//			},
//			success: function(g) {
//				e.button("reset");
//				if (g.code <= 0) {
//					alertify.alert(g.message);
//					return
//				}
//				toastr.success("客户转移成功");
//				$("#transferCommonCustomerModal").modal("hide");
//				if (_isSinglePage) {
//					location.reload();
//					return
//				}
//				if (!d) {
//					$.slidePanel.hide()
//				}
//				customerList.loadCustomer(customerList.currentPage)
//			}
//		})
	},
	initDeleteEntitiesButton: function(b) {
		var a = this;
		$("#entity-list-delete-btn").click(function() {
			a.deleteEntities($(this).data("name"), $(this).data("confirm"), $(this).data("containerid"), b)
		})
	},
	deleteEntities: function(a, b, c, e) {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));//通过$.makeArray将id放在数组中
		    var url = '/myproject/customer/todeleteBatch';//此url指向controller层的deleteBatch方法，需要id属性
		    var flag = true;
		    for(var i in ids){//遍历数组
		        if(i == 0){
		             url += "?unos=" + ids[i].value;//第一个id属性前加？拼接
		             flag = false;
		        } else {
		             url += "&unos=" + ids[i].value;//后面的id属性前加&拼接
		             flag = false;
		       }
		    }
		    console.log(url);
		    if(flag) {//如果没有选中商品
		    	alertify.alert("请选择需要删除的客户！");
		        return;
		    }
//		    if(confirm("确定这些客户删除记录吗？")){
		        window.location.href = url;
//		    }
//		var d = this;
//		d.selectEntityIds = $("#" + c + " input:checked[name=item-checkbox]").map(function() {
//			return $(this).data("id")
//		}).get().join();
//		if (d.selectEntityIds == "") {
//			alertify.alert("请选择需要删除的对象");
//			return
//		}
//		alertify.confirm(b, function() {
//			$.ajax({
//				url: "/" + a + "/delete/batch",
//				type: "POST",
//				data: {
//					ids: d.selectEntityIds
//				},
//				dataType: "json",
//				timeout: 60000,
//				error: function(h, f, g) {
//					alertify.alert("删除失败，请稍后再试")
//				},
//				success: function(f) {
//					if (f.code <= 0) {
//						alertify.alert(f.message);
//						return
//					}
//					toastr.success("删除成功");
//					if (e && typeof(e) === "function") {
//						e()
//					}
//				}
//			})
//		}, function() {})
	},
	initEntityCustomFieldToggle: function() {
		$(".toggle-entity-field-custom-link").click(function(a) {
			a.preventDefault();
			$(this).closest("form").find(".form-group").removeClass("hide");
			$(this).hide()
		})
	},
	initToggleAllButton: function() {
		$("table th input[type=checkbox]").click(function(b) {
			var a = $(this).prop("checked");
			$(this).closest("table").find("tbody .list-item input[name=item-checkbox]").prop("checked", a)
		})
	},
	initDeleteEntityButton: function(b) {
		var a = this;
		$("#entity-delete-btn").click(function(c) {
			c.preventDefault();
			a.deleteEntity($(this).data("name"), $(this).data("confirm"), b)
		})
	},
	deleteEntity: function(a, b, c) {
		alertify.confirm(b, function() {
			$.ajax({
				url: "/" + a + "/delete",
				type: "POST",
				data: {
					id: _targetId
				},
				dataType: "json",
				timeout: 60000,
				error: function(f, d, e) {
					alertify.alert("删除失败，请稍后再试")
				},
				success: function(d) {
					if (d.code <= 0) {
						alertify.alert(d.message);
						return
					}
					toastr.success("删除成功");
					if (!_isSinglePage) {
						$.slidePanel.hide();
						c();
						return
					}
					window.location = "/" + a
				}
			})
		}, function() {})
	},
	initDetailTabs: function() {
		$('#entity-detail-tabs a[data-toggle="tab"]').on("shown.bs.tab", function(e) {
			var _isLoaded = $(e.target).data("loaded");
			if (_isLoaded == "0") {
				$(e.target).data("loaded", "1");
				var _function = $(e.target).data("function");
				if (!isUndefined(_function)) {
					eval(_function);
					return
				}
			}
			if (!_isSinglePage) {
				$(".slidePanel-scrollable").asScrollable("update")
			}
		})
	},
	showEncodedUserName: function(a) {
		var b = this;
		$(".encodedUserId").each(function() {
			var c = $(this).data("value");
			if (c != "") {
				$(this).text(b.getUserName(b.getUser(a, c)))
			}
		})
	},
	showEncodedGroupName: function(a) {
		var b = this;
		$(".encodedGroupId").each(function() {
			var c = $(this).data("value");
			if (c != "") {
				$(this).text(getRecursiveArrayName(a, c))
			}
		})
	},
	initShareModal: function() {
		var a = this;
		$("#shareModal").on("show.bs.modal", function(b) {
			$("#entity-shareUserId").val(null).trigger("change");
			$("#form-share-entity .form-group").removeClass("has-error");
			$("#entity-share-add").prop("checked", true)
		});
		$("#share-entity-btn").click(function(b) {
			b.preventDefault();
			a.shareEntities()
		});
		$("#shareSingleModal").on("show.bs.modal", function(b) {
			$("#form-share-single-entity .form-group").removeClass("has-error");
			var c = new Array();
			$("#shareUser-link span.shareUser").each(function(d) {
				c.push($(this).data("value"))
			});
			$("#entity-single-shareUserId").val(c).trigger("change")
		});
		$("#share-single-entity-btn").click(function(b) {
			b.preventDefault();
			a.shareSingleEntity()
		})
	},
	shareEntities: function() {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/tosharecus';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
			var myuintroduction = $("#entity-shareUserId-tips").val();
			url += "&uintroduction=" + myuintroduction;
		    console.log(url);
		    window.location.href = url;
//		var e = $("#entity-shareUserId option:selected").map(function() {
//			return $(this).val()
//		}).get().join();
//		if (e == "") {
//			$("#entity-shareUserId-tips").text("请选择共享同事").closest(".form-group").addClass("has-error");
//			return
//		}
//		var d = this;
//		var b = $("input[name=entity-share-radio]:checked").val();
//		var c = $("#share-entity-btn").button("loading");
//		var a = c.data("name");
//		$.ajax({
//			url: "/" + a + "/share/batch",
//			type: "POST",
//			data: {
//				ids: d.selectEntityIds,
//				shareUserIds: e,
//				shareType: b
//			},
//			dataType: "json",
//			timeout: 60000,
//			error: function(h, f, g) {
//				c.button("reset");
//				alertify.alert("共享失败，请稍后再试")
//			},
//			success: function(f) {
//				c.button("reset");
//				if (f.code <= 0) {
//					alertify.alert(f.message);
//					return
//				}
//				$("#shareModal").modal("hide");
//				toastr.success("共享成功")
//			}
//		})
	},
	shareSingleEntity: function() {
		var d = "";
		var b = new Array();
		$("#entity-single-shareUserId option:selected").each(function() {
			b.push($("<span class='shareUser padding-right-10'></span>").text($(this).text()).data("value", $(this).val()));
			if (d == "") {
				d = $(this).val()
			} else {
				d = d + "," + $(this).val()
			}
		});
		var c = $("#share-single-entity-btn").button("loading");
		var a = c.data("name");
		$.ajax({
			url: "/" + a + "/share",
			type: "POST",
			data: {
				id: _targetId,
				shareUserIds: d
			},
			dataType: "json",
			timeout: 60000,
			error: function(g, e, f) {
				c.button("reset");
				alertify.alert("共享失败，请稍后再试")
			},
			success: function(e) {
				c.button("reset");
				if (e.code <= 0) {
					alertify.alert(e.message);
					return
				}
				toastr.success("共享成功");
				$("#shareSingleModal").modal("hide");
				if (b.length == 0) {
					$("#shareUser-link").html("<span>暂无</span>");
					return
				}
				$("#shareUser-link").html("");
				$.each(b, function(f, g) {
					g.appendTo($("#shareUser-link"))
				})
			}
		})
	},
	initTransferModal: function(b) {
		var a = this;
		$("#transferModal").on("show.bs.modal", function(d) {
			$("#form-transfer-entity .form-group").removeClass("has-error");
			var c = $(d.relatedTarget);
			if (isUndefined(c.data("target"))) {
				$("#transfer-entity-btn").data("batch", true)
			} else {
				$("#transfer-entity-btn").data("batch", false)
			}
		});
		$("#transfer-entity-btn").click(function() {
			a.transferEntity(b)
		})
	},
	transferEntity: function(h) {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/totransfer';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
			var mypersoncharge = $("#entity-transfer-tips").val();
			url += "&personcharge=" + mypersoncharge;
//			alert(url);
		    console.log(url);
		    window.location.href = url;
		
//		var c = $("#entity-newOwnerUserId").val();
//		if (c == "" || c == null) {
//			$("#entity-transfer-tips").text("请选择新的负责人").closest(".form-group").addClass("has-error");
//			return
//		}
//		var g = this;
//		var f = $("#transfer-entity-btn").button("loading");
//		var a = f.data("name");
//		var e = $("#transfer-entity-btn").data("batch");
//		var d = "/" + a;
//		if (a == "customer" && _visible == VISIBLE_PUBLIC) {
//			d = d + "/transferPrivate"
//		} else {
//			d = d + "/transfer"
//		}
//		d = d + (e ? "/batch" : "");
//		var b = {
//			ownerUserId: c
//		};
//		if (e) {
//			b.ids = g.selectEntityIds
//		} else {
//			b.id = _targetId
//		}
//		if (a == "customer") {
//			b.transferDeal = $("#customer-transfer-deal").is(":checked") ? "1" : "0";
//			b.transferContract = $("#customer-transfer-contract").is(":checked") ? "1" : "0"
//		}
//		$.ajax({
//			url: d,
//			type: "POST",
//			data: b,
//			dataType: "json",
//			timeout: 60000,
//			error: function(k, i, j) {
//				f.button("reset");
//				alertify.alert("转移失败，请稍后再试")
//			},
//			success: function(i) {
//				f.button("reset");
//				if (i.code <= 0) {
//					$("#entity-transfer-tips").text(i.message).closest(".form-group").addClass("has-error");
//					return
//				}
//				toastr.success("转移成功");
//				$("#transferModal").modal("hide");
//				if (!_isSinglePage && !e) {
//					$.slidePanel.hide()
//				}
//				h()
//			}
//		})
	},
	initChangeNextContactDateModal: function() {
		var a = this;
		$("#changeNextContactDateModal").on("show.bs.modal", function(b) {
			$("#form-changeNextContactDate-entity .form-group").removeClass("has-error")
		});
		$("#entity-changeNextContactDate-btn").click(function() {
			a.changeNextContactDate()
		})
	},
	changeNextContactDate: function() {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/tochangenexttime';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
			var mynexttime = $("#entity-changeNextContactDate").val();
			url += "&nexttime=" + mynexttime;
			alert(mynexttime);
			alert(url);
		    console.log(url);
		    window.location.href = url;

//		var c = $.trim($("#entity-changeNextContactDate").val());
//		if (c == "") {
//			$("#entity-changeNextContactDate-tips").text("请选择下次联系时间").closest(".form-group").addClass("has-error");
//			return
//		}
//		var d = this;
//		var b = $("#entity-changeNextContactDate-btn").button("loading");
//		var a = "";
//		if (_targetType == ENTITY_CUSTOMER) {
//			a = "/customer"
//		} else {
//			a = "/deal"
//		}
//		a = a + "/update/batch/nextContactDate";
//		$.ajax({
//			url: a,
//			type: "POST",
//			data: {
//				ids: entity.selectEntityIds,
//				nextContactDate: c
//			},
//			dataType: "json",
//			timeout: 60000,
//			error: function(g, e, f) {
//				b.button("reset");
//				$("#entity-changeNextContactDate-tips").text("下次联系时间设置失败，请稍后再试").closest(".form-group").addClass("has-error")
//			},
//			success: function(e) {
//				b.button("reset");
//				if (e.code <= 0) {
//					$("#entity-changeNextContactDate-tips").text(e.message).closest(".form-group").addClass("has-error");
//					return
//				}
//				toastr.success("下次联系时间设置成功");
//				$("#changeNextContactDateModal").modal("hide");
//				if (_targetType == ENTITY_CUSTOMER) {
//					customerList.loadCustomer(customerList.currentPage)
//				} else {
//					dealList.loadDealByList(dealList.currentPage)
//				}
//			}
//		})
	},
	initCustomModalButtons: function() {
		var a = this;
		$("[data-plugin='customModal']").click(function(b) {
			a.selectEntityIds = $("#entity-item-list input[name='item-checkbox']:checked").map(function() {
//				alert($(this).val());
//				return $(this).data("id")
				return $(this).val()
			}).get().join();
			if (a.selectEntityIds == "") {
				alertify.alert($(this).data("tips"));
				return
			}
			$("#" + $(this).data("modal")).modal("show");
		})
	},
	initSearchItem: function(c, b) {
		var a = this;
		
		$(".search-sort-menu a").click(function(d) {
			d.preventDefault();
			c.sortField = $(this).data("value");
			$(".search-sort-menu li").removeClass("active");
			$(this).parent().addClass("active");
			b()
		});
		$(".sort-title").click(function(d) {
			d.preventDefault();
			c.sortField = $(this).data("sortfield");
			c.sortOrder = $(this).data("sortorder");
			var f = $(this).closest("tr");
			f.find(".sort-title").removeClass("asc").removeClass("desc");
			if (c.sortOrder == "0") {
				$(this).data("sortorder", "1");
				$(this).addClass("asc")
			} else {
				$(this).data("sortorder", "0");
				$(this).addClass("desc")
			}
			a.updateCustomFieldSort(_targetType, c.sortField, c.sortOrder);
			b()
		});
		$(".search-item-condition-datetimepicker-dropdown-menu").click(function(d) {
			d.stopPropagation()
		});
		$(".search-item-condition a.item").click(function(d) {
			d.preventDefault();
			if ($(this).data("toggle") == "dropdown") {
				$(this).closest(".search-item-condition").find("a.item").removeClass("selected");
				$(this).addClass("selected");
				return
			}
			$(this).parent().find("a.item").removeClass("selected");
			$(this).addClass("selected");
			c[$(this).data("field")] = $(this).data("value");
			b()
		});
		$("button.search-date").click(function(h) {
			var f = $(this).data("field");
			var g = $("#search-" + f + "-start").val();
			var d = $("#search-" + f + "-end").val();
			c[f] = g + "~" + d;
			$(this).closest("span.dropdown").removeClass("open");
			b()
		})
	},
	initTableDragger: function(a) {
		var c = this;
		var b = $("#" + a + " .handle").length;
		if (b == 0) {
			return
		}
		tableDragger(document.getElementById(a), {
			dragHandler: ".handle"
		}).on("drop", function(h, g, d, f) {
			var e = new Array();
			$("#" + d.id + " th").each(function() {
				if ($(this).hasClass("hide")) {
					return true
				}
				var i = $(this).data("field");
				if (isUndefined(i)) {
					return true
				}
				e.push(i)
			});
			c.updateCustomFields(_targetType, e.join(), "")
		})
	},
	loadEntityExtInfo: function(b, a, c) {
		$.ajax({
			url: "/" + a + "/detail/" + b + "/extInfo",
			type: "POST",
			dataType: "json",
			timeout: 60000,
			error: function(f, d, e) {
				alertify.alert("加载详细信息失败，请稍后再试")
			},
			success: function(d) {
				if (d.code <= 0) {
					alertify.alert(d.message);
					return
				}
				$.each(d.items.extInfos, function(e, g) {
					var i = $("#" + a + "-field-" + g.fieldId).text(g.value);
					i.data("pk", i.data("pk") + "_" + g.id);
					if (i.data("type") == "select" || i.data("type") == "checklist") {
						i.data("value", g.value)
					}
					if (i.data("field-website")) {
						var f = g.value;
						if (f.indexOf("http") < 0) {
							f = "http://" + f
						}
						i.next().attr("href", f).removeClass("hide")
					}
					if (i.data("field-qq")) {
						var h = g.value;
						i.next().attr("href", "https://wpa.qq.com/msgrd?v=3&uin=" + h + "&site=qq&menu=yes").removeClass("hide").html(
							"<img border='0' src='/images/qq_talk.gif' alt='点击这里给我发消息' title='点击这里给我发消息'/>")
					}
				});
				c()
			}
		})
	},
	initEditablePlugin: function(a) {
		$.fn.editable.defaults.url = a;
		$("[data-plugin='editable']").editable({
			validate: function(e) {
				var d = $.trim(e);
				if ($(this).data("field-required")) {
					if (d == "") {
						return $(this).data("title") + "必须输入"
					}
				}
				if ($(this).data("field-number")) {
					if (d != "" && !$.isNumeric(d)) {
						return $(this).data("title") + "必须为数字"
					}
				}
				if ($(this).data("field-tel")) {
					if (d != "" && !isMobile(d) && !isTel(d)) {
						return $(this).data("title") + "电话格式不正确"
					}
				}
				if ($(this).data("field-email")) {
					if (d != "" && !isEmail(d)) {
						return $(this).data("title") + "邮箱格式不正确"
					}
				}
				if ($(this).data("field-website")) {
					if (d != "" && !isURL(d)) {
						return $(this).data("title") + "网址格式不正确，正确格式: http://www.qikebao.com"
					}
				}
				if (typeof $(this).data("field-date") !== "undefined") {
					if ($.trim(e) != "") {
						var c = $(this).data("field-date");
						var b = $("#" + c).text();
						if ($.trim(b) != "") {
							if (c.indexOf("start") > 0) {
								if (moment($.trim(e)).isBefore(b)) {
									return "结束日期必须大于开始日期"
								}
							} else {
								if (moment(b).isBefore($.trim(e))) {
									return "开始日期必须小于结束日期"
								}
							}
						}
					}
				}
			},
			datepicker: {
				language: "zh-CN"
			},
			combodate: {
				firstItem: "name",
				minYear: moment().year() - 20,
				maxYear: moment().year() + 20,
				minuteStep: 1
			},
			ajaxOptions: {
				dataType: "json"
			},
			success: function(b, c) {
				if (!b) {
					return "更新过程中出现异常，请稍后再试"
				}
				if (b.code == 0) {
					return b.message
				}
				var d = $(this).data("callback");
				if (typeof window[d] === "function") {
					window[d](c)
				}
			},
			error: function(b) {}
		})
	},
	loadSlidePanel: function(a) {
		$.slidePanel.show({
			url: a,
			settings: {
				method: "GET"
			}
		}, {
			direction: "right",
			closeSelector: ".slidePanel-close",
			mouseDrag: false,
			touchDrag: false,
			pointerDrag: false,
			template: function(b) {
				return '<div class="' + b.classes.base + " " + b.classes.base + "-" + b.direction + '"><div class="' + b.classes
					.base + '-scrollable"><div><div class="' + b.classes.content + '"></div></div></div><div class="' + b.classes
					.base + '-handler"></div></div>'
			},
			afterLoad: function(b, c) {
				$(".slidePanel-scrollable").asScrollable({
					contentSelector: ">",
					containerSelector: ">"
				})
			},
			loading: {
				template: function(b) {
					return '<div class="slidePanel-loading height-350 vertical-align text-center"><div class="loader-default loader vertical-align-middle" data-type="default"></div></div>'
				}
			}
		})
	},
	loadExtInfo: function(b, e, c, a) {
		if (b == "") {
			return
		}
		if (e.length == 0) {
			return
		}
		var d = new Array();
		$.each(b.split(","), function(f, g) {
			if (!isNaN(g)) {
				d.push(g)
			}
		});
		if (d.length == 0) {
			return
		}
		$.ajax({
			url: c,
			type: "POST",
			data: {
				ids: e.join(),
				fieldIds: d.join()
			},
			dataType: "json",
			timeout: 60000,
			error: function(h, f, g) {},
			success: function(f) {
				if (f.code <= 0) {
					return
				}
				$.each(f.items.extInfos, function(g, h) {
					$("tr[id='" + a + h.encodedTargetId + "']").find(".item-" + h.fieldId).text(h.value)
				})
			}
		})
	},
	initIndentSelect: function(c, d, a, b) {
		if (d.length == 0) {
			return
		}
		var g = this;
		d.html("");
		var f = {
			encodedId: b,
			name: "全部",
			level: -1,
			children: c
		};
		if (c !== null) {
			g.addIndentSelectOption(d, f)
		}
		var e = {
			dropdownAutoWidth: true,
			templateResult: function(k, h) {
				var j = $(k.element).data("level");
				if (isUndefined(j) || j == "0") {
					return k.text
				}
				var i = $('<span><span class="padding-left-' + j + '0">' + k.text + "</span>");
				return i
			}
		};
		if (a != "") {
			e.dropdownParent = $("#" + a)
		}
		d.select2(e)
	},
	addIndentSelectOption: function(b, a) {
		var c = this;
		$("<option></option>").val(a.encodedId).text(a.name).data("level", a.level + 1).appendTo(b);
		$.each(a.children, function(d, e) {
			c.addIndentSelectOption(b, e)
		})
	},
	initSearchCustomerSelect: function(a) {
		var b = this;
		$("#" + a).select2(b.getSearchCustomerSelectOption())
	},
	initModalSearchCustomerSelect: function(d) {
		var h = this;
		var f = $("#" + d);
		var b = h.getSearchCustomerSelectOption();
		b.dropdownParent = f.closest(".modal");
		var a = f.select2(b);
		var c = f.data("relation-select-id");
		if (isUndefined(c)) {
			return
		}
		var g = $("#" + c);
		if (!(g.is("select"))) {
			return
		}
		var e = f.data("relation-select-type");
		a.on("select2:select", function(k) {
			g.html("<option value=''>请选择</option>");
			var j = k.params.data;
			var i = j.id;
			h.initRelationSelectOption(i, e, g)
		})
	},
	initRelationSelectOption: function(b, a, c) {
		if (b && b.length > 0) {
			$.ajax({
				type: "POST",
				data: {
					customerId: b,
					name: "**"
				},
				url: "/" + a + "/search/name"
			}).then(function(d) {
				if (d.code <= 0) {
					return
				}
				$.each(d.items.names, function(e, g) {
					var f = new Option(g.text, g.id, false, false);
					c.append(f)
				})
			})
		}
	},
	getSearchCustomerSelectOption: function() {
		return {
			allowClear: true,
			ajax: {
				url: "/customer/search/name",
				type: "POST",
				dataType: "json",
				delay: 250,
				data: function(a) {
					return {
						name: a.term,
						page: a.page
					}
				},
				processResults: function(a, b) {
					b.page = b.page || 1;
					return {
						results: a.items.names
					}
				},
				cache: true
			},
			placeholder: "请输入客户名检索",
			escapeMarkup: function(a) {
				return a
			},
			minimumInputLength: 2,
			templateResult: function(a) {
				return a.text
			},
			templateSelection: function(a) {
				return a.text
			}
		}
	},
	getUser: function(b, c) {
		if (b === null) {
			return ""
		}
		var a = "";
		$.each(b, function(d, e) {
			if (e.encodedId == c) {
				a = e;
				return false
			}
		});
		return a
	},
	getUserName: function(a) {
		if (a == "") {
			return ""
		}
		return a.name
	},
	getUserAvatar: function(a) {
		if (a == "") {
			return "/images/person-avatar.png"
		}
		return a.imgPath
	},
	initUpdateNoteModal: function() {
		$("#updateNoteModal").on("show.bs.modal", function(b) {
			var a = $(b.relatedTarget);
			$(this).find(".modal-body").load("/note/update?id=" + encodeURIComponent(a.data("noteid")))
		});
		$("#update-note-btn").click(function(a) {
			note.startUploadUpdateFiles()
		})
	},
	initFieldSearch: function() {
		$("#search-dropdown").on("shown.bs.dropdown", function() {
			$(this).find(".dropdown-menu-list").asScrollable({
				contentSelector: ">",
				containerSelector: ">"
			})
		});
		$("#search-dropdown-list .dropdown-menu-item a").click(function(c) {
			c.preventDefault();
			$("#search-dropdown-label").text($(this).text()).data("id", $(this).data("id")).data("type", $(this).data("type"));
			$("#search-control-container .search-control").addClass("hide");
			var b = $(this).data("type");
			if (b == "1") {
				var a = $(this).data("description");
				if (a == "3") {
					$("#search-field-min, #search-field-max").val("");
					$("#search-field-number").removeClass("hide");
					$("#search-dropdown-label").data("type", "6");
					return
				}
				$("#search-field-keyword").val("").removeClass("hide");
				return
			}
			if (b == "2" || b == "3") {
				var a = $(this).data("description");
				$("#search-field-select").html("").removeClass("hide");
				$.each(a, function(d, e) {
					$("#search-field-select").append(new Option(e, e, true, true))
				});
				return
			}
			if (b == "4" || b == "5") {
				$("#search-field-start, #search-field-end").val("");
				$("#search-field-datepicker").removeClass("hide")
			}
		})
	},
	setFiledSearchKey: function(a) {
		var b = $("#search-dropdown-label").data("type");
		a.searchFieldType = b;
		a.searchFieldId = $("#search-dropdown-label").data("id");
		a.searchKey = $("#search-field-keyword").val();
		var url = '/myproject/customer/tosearch';
//		alert(a.searchFieldId);
//		alert(a.searchKey);
		url += "?checktype=" + a.searchFieldId + "&checkvalue=" + a.searchKey;
//		alert(url);
		console.log(url);
		window.location.href = url;
//		if (b == "1") {
//			a.searchKey = $("#search-field-keyword").val();
//			alert("1"+a.searchKey);
//			return true
//		}
//		if (b == "6") {
//			a.searchKey = $("#search-field-min").val() + "," + $("#search-field-max").val();
//			return true
//		}
//		if (b == "2" || b == "3") {
//			a.searchKey = $("#search-field-select").val();
//			return true
//		}
//		if (b == "4" || b == "5") {
//			a.searchKey = $("#search-field-start").val() + "," + $("#search-field-end").val();
//			return true
//		}
		return false
	},
	checkDuplicate: function(a, b) {
		$("#" + a + " [data-duplicate='true']").blur(function() {
			var e = $(this);
			e.closest(".form-group").removeClass("has-error").removeClass("has-error-duplicate");
			var c = $.trim(e.val());
			if (c == "") {
				return
			}
			var d = e.data("duplicate-key");
			$.ajax({
				url: b,
				type: "POST",
				data: {
					key: d,
					value: c
				},
				dataType: "json",
				timeout: 60000,
				success: function(f) {
					if (f.code <= 0) {
						var g = e.closest(".form-group").addClass("has-error").addClass("has-error-duplicate");
						g.find(".help-block").text(g.find("label.control-label").text() + "已经存在")
					}
				}
			})
		})
	},
	groupSelectChange: function(b, c, a) {
		$("#" + b).on("change", function(f) {
			$("#" + c).html("<option value=''>全部</option>");
			if (a != null) {
				var d = $("#" + b).val();
				$.each(a, function(e, h) {
					if (d == "" || h.encodedGroupId == d) {
						var g = new Option(h.name, h.encodedId, false, false);
						$("#" + c).append(g)
					}
				})
			}
			$("#" + c).val(null).trigger("change")
		})
	}
};
