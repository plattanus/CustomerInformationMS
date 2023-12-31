var customerList = {
	currentPage: 1,
	totalNum: 0,
	totalPage: 0,
	ids: new Array(),
	noteIds: new Array(),
	searchParams: {
		searchType: _searchType,
		visible: _visible,
		ownerUserId: "",
		groupId: "",
		offset: 0,
		pageSize: _pageSize,
		sortField: _sortField,
		sortOrder: _sortOrder,
		categoryId: -1,
		publicGroupId: "",
		startCategoryChangeDate: "",
		endCategoryChangeDate: ""
	},
	init: function() {
		var a = this;
		if (_visible == VISIBLE_PUBLIC) {
			a.searchParams.publicGroupId = $("#customer-item-list-tab li.active a").data("value")
		}
		a.searchParams.ownerUserId = $("#search-ownerUser").val();
		a.searchParams.startNextContactDate = $("#search-startNextContactDate").val();
		a.searchParams.endNextContactDate = $("#search-endNextContactDate").val();
		a.searchParams.startCreateDate = $("#search-startCreateDate").val();
		a.searchParams.endCreateDate = $("#search-endCreateDate").val();
		a.searchParams.startStatusChangeDate = $("#search-startStatusChangeDate").val();
		a.searchParams.endStatusChangeDate = $("#search-endStatusChangeDate").val();
		a.searchParams.categoryId = $("#search-basic-categoryId").val();
		a.searchParams.contactDate = $("#search-contactDate-condition a.selected").data("value");
		a.searchParams.startAssignDate = $("#search-startAssignDate").val();
		a.searchParams.endAssignDate = $("#search-endAssignDate").val();
		a.searchParams.status = $("#search-basic-status").val();
		entity.initSearchItem(a.searchParams, function() {
			a.loadCustomer(1)
		});
		if (!_hideCustomerDetail) {
			entity.initTableDragger("entity-list-table")
		}
		area.initArea("customer-province", "customer-city", "", "");
		entity.initIndentSelect(_groups, $("#search-group"), "", "");
		entity.groupSelectChange("search-group", "search-ownerUser", _searchUsers);
		entity.initCustomModalButtons();
		entity.initEntityCustomFieldToggle();
		entity.initDeleteEntitiesButton(function() {
			a.loadCustomer(a.currentPage)
		});
		entity.initToggleAllButton();
		entity.initPageSizeDropMenu(function(b) {
			a.searchParams.pageSize = b;
			a.loadCustomer(1)
		});
		importExport.initExportModal(a.searchParams, "customer");
		importExport.initImportModal("customer");
		$("#search-customer-basic-form [data-plugin='select2']").select2({
			dropdownAutoWidth: true
		});
		if (_visible == VISIBLE_PRIVATE) {
			$("#search-basic-nextContactDate").datepicker({
				format: "yyyy-mm-dd",
				autoclose: true,
				todayBtn: "linked",
				clearBtn: true
			});
			$("#search-nextContactDate").datepicker({
				format: "yyyy-mm-dd",
				autoclose: true,
				todayBtn: "linked",
				clearBtn: true
			}).on("hide", function(b) {
				a.searchParams.startNextContactDate = $("#search-startNextContactDate").val();
				a.searchParams.endNextContactDate = $("#search-endNextContactDate").val();
				a.loadCustomer(1)
			});
			$("#search-statusChangeDate").datepicker({
				format: "yyyy-mm-dd",
				autoclose: true,
				todayBtn: "linked",
				clearBtn: true
			}).on("hide", function(b) {
				a.searchParams.startStatusChangeDate = $("#search-startStatusChangeDate").val();
				a.searchParams.endStatusChangeDate = $("#search-endStatusChangeDate").val();
				a.loadCustomer(1)
			});
			$("#search-group").change(function() {
				a.searchParams.groupId = $(this).val();
				a.loadCustomer(1)
			});
			$("#search-ownerUser").select2({
				dropdownAutoWidth: true
			});
			$("#search-ownerUser").change(function() {
				a.searchParams.ownerUserId = $(this).val();
				a.loadCustomer(1)
			})
		}
		$('#customer-item-list-tab a[data-toggle="tab"]').on("shown.bs.tab", function(b) {
			a.searchParams[$(b.target).data("field")] = $(b.target).data("value");
			a.loadCustomer(1)
		});
		$("#search-createDate").datepicker({
			format: "yyyy-mm-dd",
			autoclose: true,
			todayBtn: "linked",
			clearBtn: true
		}).on("hide", function(b) {
			a.searchParams.startCreateDate = $("#search-startCreateDate").val();
			a.searchParams.endCreateDate = $("#search-endCreateDate").val();
			a.loadCustomer(1)
		});
		$("#search-assignDate").datepicker({
			format: "yyyy-mm-dd",
			autoclose: true,
			todayBtn: "linked",
			clearBtn: true
		}).on("hide", function(b) {
			a.searchParams.startAssignDate = $("#search-startAssignDate").val();
			a.searchParams.endAssignDate = $("#search-endAssignDate").val();
			a.loadCustomer(1)
		});
		$(
			"#search-basic-tag-dropdown-menu-container .dropdown-menu-checkbox-list, #search-adv-tag-dropdown-menu-container .dropdown-menu-checkbox-list"
		).click(function(b) {
			b.stopPropagation()
		});
		$("#search-basic-tag-dropdown, #search-adv-tag-dropdown").on("shown.bs.dropdown", function() {
			$(this).find(".dropdown-menu-checkbox-list").asScrollable({
				contentSelector: ">",
				containerSelector: ">"
			})
		});
		$("#search-categoryChangeDate").datepicker({
			format: "yyyy-mm-dd",
			autoclose: true,
			todayBtn: "linked",
			clearBtn: true
		}).on("hide", function(b) {
			a.searchParams.startCategoryChangeDate = $("#search-startCategoryChangeDate").val();
			a.searchParams.endCategoryChangeDate = $("#search-endCategoryChangeDate").val();
			a.loadCustomer(1)
		});
		$("#search-adv-tag-btn").click(function(b) {
			a.searchParams.tagIds = $("#search-adv-tag-dropdown-menu-container input:checked").map(function() {
				return $(this).val()
			}).get().join();
			a.loadCustomer(1)
		});
		$("#search-contactDate-menu a").click(function(c) {
			c.preventDefault();
			var b = $(this).data("value");
			if (b == "") {
				a.searchParams.contactDate = "none"
			} else {
				a.searchParams.contactDate = "~" + b
			}
			$("#search-contactDate-condition-title").text($(this).text());
			a.loadCustomer(1)
		});
		$("#customerModal").on("shown.bs.modal", function(b) {
			$("#customer-name").focus()
		}).on("hidden.bs.modal", function(b) {
			$("#customer-province").val(null).trigger("change");
			$("#customer-ownerUserId").val(_loginUserId).trigger("change");
			$("#customer-categoryId").val("0").trigger("change");
			$("#form-add-customer")[0].reset();
			$("#form-add-customer .form-group").removeClass("has-error");
			$("#form-add-customer .help-block").text("")
		});
		$("#add-customer-btn").click(function(b) {
			a.addCustomer()
		});
		entity.checkDuplicate("form-add-customer", "/customer/checkDuplicate");
		$("#duplicateSearchModal").on("shown.bs.modal", function(b) {
			$("#duplicate-item-name").focus()
		});
		$("#duplicate-search-btn").click(function(b) {
			a.duplicateSearch()
		});
		$(".page-main-container").click(function(b) {
			if ($(b.target).closest(".item-name").length) {
				return
			}
			if ($(b.target).closest("table input[type=checkbox]").length) {
				return
			}
			$.slidePanel.hide()
		});
		entity.initChangeNextContactDateModal();
		$("#customer-changeCategory-btn").click(function(b) {
			a.changeCategory()
		});
		$("#batchChangeTagModal").on("show.bs.modal", function(b) {
			$("#customer-batchChangeTagId").val(null).trigger("change");
			$("#form-batchChangeCustomerTag .form-group").removeClass("has-error");
			$("#customer-batchChangeTag-add").prop("checked", true)
		});
		$("#customer-batchChangeTag-btn").click(function(b) {
			b.preventDefault();
			a.batchChangeTag()
		});
		entity.initFieldSearch();
		$("#search-field-form").submit(function(b) {
			entity.setFiledSearchKey(a.searchParams);
			a.loadCustomer(1);
			return false
		});
		$("#search-customer-basic-form").submit(function(b) {
			a.searchParams.status = $("#search-basic-statusmy option:selected").val();
			a.searchParams.categoryId = $("#search-basic-categoryIdmy option:selected").val();
			a.searchParams.startNextContactDate = $("#search-basic-startNextContactDate").val();
			a.searchParams.endNextContactDate = $("#search-basic-endNextContactDate").val();
			a.searchParams.ownerUserId = $("#search-basic-ownerUserId").val();
			url = '/myproject/customer/toallsearch';
			url += "?ulabel=" + a.searchParams.status;
			url += "&utype=" + a.searchParams.categoryId;
			url += "&nexttimebg=" + a.searchParams.startNextContactDate;
			url += "&nexttimeed=" + a.searchParams.endNextContactDate;
			url += "&personcharge=" + a.searchParams.ownerUserId;
//			alert(url);
			console.log(url);
			window.location.href = url;
//			if (_visible == VISIBLE_PRIVATE) {
//				a.searchParams.startNextContactDate = $("#search-basic-startNextContactDate").val();
//				a.searchParams.endNextContactDate = $("#search-basic-endNextContactDate").val();
//				a.searchParams.ownerUserId = $("#search-basic-ownerUserId").val()
//			}
//			a.searchParams.tagIds = $("#search-basic-tag-dropdown-menu-container input:checked").map(function() {
//				return $(this).val()
//			}).get().join();
//			a.loadCustomer(1);
			return false
		});
		$("#search-customer-basic-form2").submit(function(b) {
			
			a.searchParams.status = $("#search-basic-status a.selected").data("value");
			a.searchParams.categoryId = $("#search-basic-categoryId a.selected").data("value");
			a.searchParams.startCreateDate = $("#search-startCreateDate").val();
			a.searchParams.endCreateDate = $("#search-endCreateDate").val();
			a.searchParams.startAssignDate = $("#search-startAssignDate").val();
			a.searchParams.endAssignDate = $("#search-endAssignDate").val();
			a.searchParams.startNextContactDate = $("#search-startNextContactDate").val();
			a.searchParams.endNextContactDate = $("#search-endNextContactDate").val();
			a.searchParams.startStatusChangeDate = $("#search-startStatusChangeDate").val();
			a.searchParams.endStatusChangeDate = $("#search-endStatusChangeDate").val();
			
			var myDateCondition = $("#search-contactDate-condition a.selected").data("value");
			if(null==myDateCondition) {
				a.searchParams.startContactDate = $("#search-contactDate-start").val();
				a.searchParams.endContactDate = $("#search-contactDate-end").val();
			}
			else {
				if(myDateCondition=="yesterday") {
					var mytoday = new Date();
					a.searchParams.endContactDate = mytoday.getFullYear() + "-" + (mytoday.getMonth()+1) + "-" + mytoday.getDate();
					mytoday.setTime(mytoday.getTime()-24*60*60*1000);
					a.searchParams.startContactDate = mytoday.getFullYear() + "-" + (mytoday.getMonth()+1) + "-" + mytoday.getDate();
				}
				else if(myDateCondition=="today") {
					var mytoday = new Date();
					a.searchParams.startContactDate = mytoday.getFullYear() + "-" + (mytoday.getMonth()+1) + "-" + mytoday.getDate();
					a.searchParams.endContactDate = mytoday.getFullYear() + "-" + (mytoday.getMonth()+1) + "-" + mytoday.getDate();
				}
				else if(myDateCondition=="thisweek") {
					var date = new Date();
  					date.setDate(date.getDate() - date.getDay() + 1);
  					a.searchParams.startContactDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() ;
  					date.setDate(date.getDate() + 6);
  					a.searchParams.endContactDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
				}
				else if(myDateCondition=="lastweek") {
  					var date = new Date();
  					date.setDate(date.getDate()-7 - date.getDay() + 1);
  					a.searchParams.startContactDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() ;
 				 	date.setDate(date.getDate() +6);
  					a.searchParams.endContactDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
				}
				else if(myDateCondition=="thismonth") {
					var date=new Date();
    			    date.setDate(1);
					a.searchParams.startContactDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() ;
					date=new Date();
    				var currentMonth=date.getMonth();
      				var nextMonth=++currentMonth;
     	 			var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
					var mytoday=new Date(nextMonthFirstDay-1000*60*60*24);
					a.searchParams.endContactDate = mytoday.getFullYear() + "-" + (mytoday.getMonth()+1) + "-" + mytoday.getDate();
				}
				else if(myDateCondition=="lastmonth") {
					let nowdays = new Date();
    			 	let year = nowdays.getFullYear();
     				let month = nowdays.getMonth();
     				if(month==0) {
         				month=12;
         				year=year-1;
     				}
     				if (month < 10) {
         				month = "0" + month;
     				}
     				let firstDayOfPreMonth = year + "-" + month + "-" + "01";
     				let lastDay = new Date(year, month, 0);
     				let lastDayOfPreMonth = year + "-" + month + "-" + lastDay.getDate();
     				a.searchParams.startContactDate = firstDayOfPreMonth.toString();
     				a.searchParams.endContactDate = lastDayOfPreMonth.toString();
				}
			}
//			alert(a.searchParams.status);
//			alert(a.searchParams.categoryId);
//			alert(a.searchParams.startCreateDate);
//			alert(a.searchParams.endCreateDate);
//			alert(a.searchParams.startAssignDate);
//			alert(a.searchParams.endAssignDate);
//			alert(a.searchParams.startNextContactDate);
//			alert(a.searchParams.endNextContactDate);
//			alert(a.searchParams.startStatusChangeDate);
//			alert(a.searchParams.endStatusChangeDate);
//			alert(a.searchParams.startContactDate);
//			alert(a.searchParams.endContactDate);
//			alert(myDateCondition);
			url = '/myproject/customer/toallsearch2';
			url += "?ulabel=" + a.searchParams.status;
			url += "&utype=" + a.searchParams.categoryId;
			url += "&createtimebg=" + a.searchParams.startCreateDate;
			url += "&createtimeed=" + a.searchParams.endCreateDate;
			url += "&allocatetimebg=" + a.searchParams.startAssignDate;
			url += "&allocatetimeed=" + a.searchParams.endAssignDate;
			url += "&nexttimebg=" + a.searchParams.startNextContactDate;
			url += "&nexttimeed=" + a.searchParams.endNextContactDate;
//			url += "&ChangeDatebg=" + a.searchParams.startStatusChangeDate;
//			url += "&ChangeDateed=" + a.searchParams.endStatusChangeDate;
			url += "&lasttimebg=" + a.searchParams.startContactDate;
			url += "&lasttimeed=" + a.searchParams.endContactDate;
//			alert(url);
			console.log(url);
			window.location.href = url;
			return false
		});
		entity.initToggleAdvSearchMode();
		entity.initCustomFields(_targetType, function() {
			a.loadCustomer(1)
		});
		a.loadCustomer(1)
	},
	addCustomer: function() {
		if (!checkInput("form-add-customer")) {
			return;
		}
		var data = {};
		var results = $("#form-add-customer").serializeArray();
		var url = '/myproject/customer/save';
		var i = 0;
		$.each(results, function(index, item) {
//			alert(item.name + ',' + item.value);
			if (i == 0) {
				if(item.value)
					url += "?" + item.name + "=" + item.value; //第一个id属性前加？拼接
				else
					url += "?" + item.name + "=null"; //第一个id属性前加？拼接
				i = 1;
			} else {
				if(item.value)
					url += "&" + item.name + "=" + item.value; //后面的id属性前加&拼接
				else
					url += "&" + item.name + "=null"; //第一个id属性前加？拼接
			}
		});
		console.log(url);
//		alert("新客户添加成功！");
		window.location.href = url;
		
//	var form = document.getElementById('form-add-customer1');
//	alert("创建客户");
//	var elements = new Array();
//	var tagElements = form.getElementsByTagName('input');
//	for (var j = 0; j < tagElements.length; j++) {
//		elements.push(tagElements[j]);
//		alert(tagElements[j]);
//	}
//	var queryComponents = new Array();
//	for (var i = 0; i < elements.length; i++) {
//
//		var method = elements[i].tagName.toLowerCase();
//		var parameter = [elements[i].name, elements[i].value];
//		var queryComponent = [];
//		if (parameter) {
//			var key = encodeURIComponent(parameter[0]);
//			if (key.length == 0) return;
//			if (parameter[1].constructor != Array)
//				parameter[1] = [parameter[1]];
//			var values = parameter[1];
//			for (var i = 0; i < values.length; i++) {
//				queryComponent.push(key + '=' + encodeURIComponent(values[i]));
//			}
//			return queryComponent.join('&');
//		}
//		if (queryComponent)
//			queryComponents.push(queryComponent);
//	}
//	var params = queryComponents.join('&');
//	alert(params);
		
//		if ($("#form-add-customer .has-error-duplicate").length > 0) {
//			return
//		}
//		if (!checkInput("form-add-customer")) {
//			return
//		}
//		var b = this;
//		var a = $("#add-customer-btn").button("loading");
//		$.ajax({
//			url: "/customer/add",
//			type: "POST",
//			data: $("#form-add-customer").serialize(),
//			dataType: "json",
//			timeout: 60000,
//			error: function(e, c, d) {
//				a.button("reset");
//				alertify.alert("客户创建失败，请稍后再试")
//			},
//			success: function(c) {
//				a.button("reset");
//				if (c.code <= 0) {
//					alertify.alert(c.message);
//					return
//				}
//				toastr.success("客户创建成功");
//				$("#customerModal").modal("hide");
//				b.showCustomerItem(-1, c.items.customer)
//			}
//		})
	},
	loadCustomer: function(a) {
//		$("#search-loading").show();
//		$("#item-pageNavi, #customer-blank, #dropdown-menu-pageSize").hide();
//		$("#entity-item-list .list-item").remove();
//		var b = this;
//		b.currentPage = parseInt(a);
//		b.searchParams.offset = (b.currentPage - 1) * b.searchParams.pageSize;
//		$.ajax({
//			url: "/customer/list",
//			type: "POST",
//			data: b.searchParams,
//			dataType: "json",
//			timeout: 60000,
//			error: function(e, c, d) {
//				$("#search-loading").hide();
//				alertify.alert("加载客户信息失败，请稍后再试")
//			},
//			success: function(c) {
//				$("#search-loading").hide();
//				if (c.code <= 0) {
//					alertify.alert(c.message);
//					return
//				}
//				if (b.searchParams.offset == 0) {
//					b.totalNum = c.items.totalNum;
//					b.totalPage = Math.ceil(b.totalNum / b.searchParams.pageSize);
//					$("#exportModal").data("totalnum", b.totalNum)
//				}
//				if (b.totalNum == 0) {
//					$("#customer-blank").show();
//					return
//				}
//				b.ids.length = 0;
//				b.noteIds.length = 0;
//				$.each(c.items.customers, function(d, e) {
//					b.showCustomerItem(d, e)
//				});
//				if (!_hideCustomerDetail) {
//					entity.loadExtInfo(_showFieldIds, b.ids, "/customer/list/extInfo", "customer-item-");
//					b.loadLastNotes();
//					if (!$("#header-field-tag").hasClass("hide")) {
//						b.loadTagIds()
//					}
//				}
//				$("#item-pageNavi, #dropdown-menu-pageSize").show();
//				createPageNavi(a, b.totalPage, b.totalNum, "item-pageNavi", function(d) {
//					b.loadCustomer(d)
//				})
//			}
//		})
	},
	showCustomerItem: function(a, i) {
		this.ids.push(i.encodedId);
		var j = $("#customer-item-clone").clone(true).removeClass("hide").addClass("list-item").attr("id", "customer-item-" +
			i.encodedId);
		var b = true;
		if (_intervalDays > 0 && i.encodedOwnerUserId == _loginUserId) {
			var g = moment(i.assignDate).add(_intervalDays, "day");
			var e = moment();
			if (g.isAfter(e)) {
				b = false
			}
		}
		if (b) {
			j.find(".checkbox-custom input").data("id", i.encodedId)
		} else {
			j.find(".idx").html("")
		}
		j.find(".item-phone").data("customerid", i.encodedId).data("customername", i.name);
		var h = j.find(".item-name");
		if (!_hideCustomerDetail) {
			h.click(function(k) {
				k.preventDefault();
				_targetId = i.encodedId;
				entity.loadSlidePanel("/customer/detail/" + encodeURIComponent(_targetId) + "?isListDetailPage=1")
			})
		}
		h.find(".name").text(i.name);
		if (i.status == STATUS_SUCCESS) {
			h.find("span.label").removeClass("hide")
		}
		j.find(".item-ownerUser").text(entity.getUserName(entity.getUser(_users, i.encodedOwnerUserId)));
		var d = getDictionary(_customerCategories, i.categoryId);
		if (d != "") {
			var f = $("<span class='label'></span>");
			f.text(d.name).css("background-color", d.color);
			f.appendTo(j.find(".item-category"))
		}
		j.find(".item-province").text(i.province);
		j.find(".item-city").text(i.city);
		j.find(".item-nextContactDate").text(getFormatDate(i.nextContactDate, "YYYY-MM-DD HH:mm"));
		j.find(".item-createDate").text(getFormatDate(i.createDate, "YYYY-MM-DD HH:mm"));
		j.find(".item-createUser").text(entity.getUserName(entity.getUser(_users, i.encodedCreateUserId)));
		j.find(".item-assignDate").text(getFormatDate(i.assignDate, "YYYY-MM-DD HH:mm"));
		if (i.encodedLastContactUserId != "") {
			j.find(".item-lastContactUser").text(entity.getUserName(entity.getUser(_users, i.encodedLastContactUserId)))
		}
		j.find(".item-lastContactDate").text(getFormatDate(i.lastContactDate, "YYYY-MM-DD HH:mm"));
		if (a == -1) {
			j.prependTo($("#customer-body"));
			$("#customer-blank").hide()
		} else {
			j.appendTo($("#customer-body"))
		}
		if (i.encodedLastNoteId != "" && $("#customer-item-ext-clone").length > 0) {
			var c = $("#customer-item-ext-clone").clone(true).addClass("list-item").attr("id", "customer-item-ext-" + i.encodedId);
			c.find(".item-ext-note").attr("id", "customer-item-ext-note-" + i.encodedLastNoteId);
			this.noteIds.push(i.encodedLastNoteId);
			j.after(c)
		}
	},
	getCustomerIdIdx: function(b) {
		for (var a = 0; a < this.ids.length; a++) {
			if (this.ids[a] == b) {
				return a
			}
		}
		return -1
	},
	navi: function(a) {
		if (a < 0) {
			return
		}
		if (a >= this.ids.length) {
			return
		}
		_targetId = this.ids[a];
		entity.loadSlidePanel("/customer/detail/" + encodeURIComponent(_targetId) + "?isListDetailPage=1")
	},
	changeCategory: function() {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/tochangetype';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
			var myutype = $("#customer-changeCategory").val();
			url += "&utype=" + myutype;
		    console.log(url);
		    window.location.href = url;

//		var b = this;
//		var a = $("#customer-changeCategory-btn").button("loading");
//		$.ajax({
//			url: "/customer/update/batch/category",
//			type: "POST",
//			data: {
//				ids: entity.selectEntityIds,
//				categoryId: $("#customer-changeCategory").val()
//			},
//			dataType: "json",
//			timeout: 60000,
//			error: function(e, c, d) {
//				a.button("reset");
//				alertify.alert("客户分类修改失败，请稍后再试")
//			},
//			success: function(c) {
//				a.button("reset");
//				if (c.code <= 0) {
//					alertify.alert(c.message);
//					return
//				}
//				toastr.success("客户分类修改成功");
//				$("#changeCategoryModal").modal("hide");
//				b.loadCustomer(b.currentPage)
//			}
//		})
	},
	batchChangeTag: function() {
			var ids = $.makeArray($("input[name='item-checkbox']:checked"));
		    var url = '/myproject/customer/tochangelabel';
		    for(var i in ids){
		        if(i == 0){
		             url += "?unos=" + ids[i].value;
		        } else {
		             url += "&unos=" + ids[i].value;
		       }
		    }
			var myulabel = $("#customer-batchChangeTagId").val();
			url += "&ulabel=" + myulabel;
		    console.log(url);
		    window.location.href = url;

//		var e = $("#customer-batchChangeTagId option:selected").map(function() {
//			return $(this).val()
//		}).get().join();
//		if (e == "") {
//			$("#customer-batchChangeTag-tips").text("请选择客户标签").closest(".form-group").addClass("has-error");
//			return
//		}
//		var d = this;
//		var b = $("input[name=customer-batchChangeTag-radio]:checked").val();
//		var c = $("#customer-batchChangeTag-btn").button("loading");
//		var a = c.data("name");
//		$.ajax({
//			url: "/customer/update/tag/batch",
//			type: "POST",
//			data: {
//				ids: entity.selectEntityIds,
//				tagIds: e,
//				type: b
//			},
//			dataType: "json",
//			timeout: 60000,
//			error: function(h, f, g) {
//				c.button("reset");
//				alertify.alert("设置标签失败，请稍后再试")
//			},
//			success: function(f) {
//				c.button("reset");
//				if (f.code <= 0) {
//					alertify.alert(f.message);
//					return
//				}
//				$("#batchChangeTagModal").modal("hide");
//				toastr.success("标签设置成功")
//			}
//		})
	},
	loadLastNotes: function() {
		var a = this;
		if (a.noteIds.length == 0) {
			return
		}
		$.ajax({
			url: "/note/latest",
			type: "POST",
			data: {
				noteIds: a.noteIds.join()
			},
			dataType: "json",
			timeout: 60000,
			error: function(d, b, c) {},
			success: function(b) {
				if (b.code <= 0) {
					return
				}
				$.each(b.items.notes, function(c, d) {
					$("span[id='customer-item-ext-note-" + d.encodedId + "']").text(d.remark).parent().parent().removeClass(
						"hide")
				})
			}
		})
	},
	loadTagIds: function() {
		var a = this;
		if (a.ids.length == 0) {
			return
		}
		$.ajax({
			url: "/customer/list/tag",
			type: "POST",
			data: {
				ids: a.ids.join()
			},
			dataType: "json",
			timeout: 60000,
			error: function(d, b, c) {},
			success: function(b) {
				if (b.code <= 0) {
					return
				}
				if (b.items.totalNum == 0) {
					return
				}
				$.each(b.items.tags, function(c, f) {
					var g = $("tr[id='customer-item-" + f.encodedCustomerId + "']").find("td.item-tag");
					var e = $("<span class='label label-info margin-right-5'></span>");
					var d = getArrayName(_customerTags, f.id);
					if (d != "") {
						e.text(d).appendTo(g)
					}
				})
			}
		})
	},
	duplicateSearch: function() {
		var b = this;
		var a = $("#duplicate-search-btn").button("loading");
		$("#duplicate-body .list-item").remove();
		$.ajax({
			url: "/customer/duplicate",
			type: "POST",
			data: $("#form-duplicate-customer").serialize(),
			dataType: "json",
			timeout: 60000,
			error: function(e, c, d) {
				a.button("reset");
				alertify.alert("检索失败，请稍后再试")
			},
			success: function(c) {
				a.button("reset");
				if (c.code <= 0) {
					alertify.alert(c.message);
					return
				}
				if (c.items.totalNum == 0) {
					$("<tr class='list-item'><td colspan='5'>没有找到匹配的客户信息</td></tr>").appendTo($("#duplicate-body"));
					return
				}
				$.each(c.items.customers, function(d, f) {
					var e = $("#duplicate-item-clone").clone(true).removeClass("hide").addClass("list-item");
					e.find(".item-name").text(f.name);
					var g = getArrayName(_customerCategories, f.categoryId);
					if (g == "") {
						g = "无分类"
					}
					e.find(".item-category").text(g);
					if (f.visible == VISIBLE_PRIVATE) {
						e.find(".item-type").text("个人客户");
						e.find(".item-ownerUser").text(entity.getUserName(entity.getUser(_users, f.encodedOwnerUserId)))
					} else {
						if (f.visible == VISIBLE_PUBLIC) {
							e.find(".item-type").text("公海客户");
							e.find(".item-ownerUser").text(getEncodedArrayName(_commonCustomerGroups, f.encodedPublicGroupId))
						}
					}
					e.find(".item-assignDate").text(getFormatDate(f.assignDate, "YYYY-MM-DD HH:mm"));
					e.appendTo($("#duplicate-body"))
				})
			}
		})
	}
};
$(function() {
	customerList.init()
});
