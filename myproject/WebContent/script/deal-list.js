var dealList={ids:new Array(),totalNum:0,totalPage:0,currentPage:1,searchParams:{searchType:_searchType,ownerUserId:"",offset:0,pageSize:_pageSize,sortField:_sortField,sortOrder:_sortOrder,customerId:"",phase:0,status:-1},initCommon:function(){var a=this;entity.initCustomModalButtons();entity.initSearchItem(a.searchParams,function(){a.loadDeal()});entity.initTableDragger("entity-list-table");$('#deal-item-list-tab a[data-toggle="tab"]').on("shown.bs.tab",function(b){a.searchParams[$(b.target).data("field")]=$(b.target).data("value");a.loadDeal()});$("#search-ownerUser").select2({dropdownAutoWidth:true});$("#search-ownerUser").change(function(){a.searchParams.ownerUserId=$(this).val();a.loadDeal()});$(".page-main-container").click(function(b){if($(b.target).closest("li.stage").length){return}if($(b.target).closest("article.stage-item").length){return}if($(b.target).closest("a.item-name").length){return}$.slidePanel.hide()})},initList:function(){var b=this;b.initCommon();b.searchParams.startCreateDate=$("#search-startCreateDate").val();b.searchParams.endCreateDate=$("#search-endCreateDate").val();b.searchParams.phase=$("#search-item-condition-phase a.selected").data("value");b.searchParams.ownerUserId=$("#search-ownerUser").val();var a=$("#search-closeDate-start").val();if(a!=""){b.searchParams.closeDate=a+"~"+$("#search-closeDate-end").val()}entity.initDeleteEntitiesButton(function(){b.loadDealByList(b.currentPage)});entity.initToggleAllButton();entity.initToggleAdvSearchMode();entity.initPageSizeDropMenu(function(c){b.searchParams.pageSize=c;b.loadDealByList(1)});importExport.initExportModal(b.searchParams,"deal");$("#search-createDate").datepicker({format:"yyyy-mm-dd",autoclose:true,todayBtn:"linked",clearBtn:true}).on("hide",function(c){b.searchParams.startCreateDate=$("#search-startCreateDate").val();b.searchParams.endCreateDate=$("#search-endCreateDate").val();b.loadDeal()});$("#search-deal-basic-form [data-plugin='select2']").select2({dropdownAutoWidth:true});$("#search-basic-closeDate").datepicker({format:"yyyy-mm-dd",autoclose:true,todayBtn:"linked",clearBtn:true});entity.initSearchCustomerSelect("search-customerId");$("#search-customerId").change(function(){b.searchParams.customerId=$(this).val();b.loadDeal()});entity.initFieldSearch();$("#search-field-form").submit(function(c){entity.setFiledSearchKey(b.searchParams);b.loadDealByList(1);return false});$("#search-deal-basic-form").submit(function(c){b.searchParams.status=$("#search-basic-status").val();b.searchParams.categoryId=$("#search-basic-categoryId").val();b.searchParams.phase=$("#search-basic-phase").val();b.searchParams.closeDate=$("#search-basic-startCloseDate").val()+"~"+$("#search-basic-endCloseDate").val();b.searchParams.ownerUserId=$("#search-basic-ownerUserId").val();b.loadDealByList(1);return false});entity.initCustomFields(_targetType,function(){b.loadDealByList(1)});entity.initChangeNextContactDateModal()},initPhase:function(){var a=this;a.initCommon();$("li.stage a.btn-loadmore").click(function(d){d.preventDefault();var b=$(this).data("page");var c=$(this).data("totalPage");if(b>c){return}a.loadDealByPhase($(this).data("value"),(b+1))});$("li.stage button.icon-refresh").click(function(b){b.preventDefault();a.loadDealByPhase($(this).data("value"),1)})},initDate:function(){var a=this;a.initCommon();$("div.timeline-stage a.btn-loadmore").click(function(d){d.preventDefault();var b=$(this).data("page");var c=$(this).data("totalPage");if(b>c){return}a.loadDealByMonth($(this).data("value"),(b+1))})},loadDeal:function(){if(_viewType==LIST_VIEW_TYPE_LIST){this.loadDealByList(1);return}if(_viewType==LIST_VIEW_TYPE_STAGE){this.loadDealByBoard();return}if(_viewType==LIST_VIEW_TYPE_DATE){this.loadDealByDate();return}},loadDealByList:function(a){var b=this;$("#search-loading").show();$("#item-pageNavi, #deal-blank, #dropdown-menu-pageSize").hide();$("#entity-item-list .list-item").remove();b.searchParams.offset=(a-1)*b.searchParams.pageSize;b.currentPage=a;$.ajax({url:"/deal/list",type:"POST",data:b.searchParams,dataType:"json",timeout:60000,error:function(e,c,d){$("#search-loading").hide();alertify.alert("加载销售机会失败，请稍后再试")},success:function(c){$("#search-loading").hide();if(c.code==0){alertify.alert(c.message);return}if(b.searchParams.offset==0){b.totalNum=c.items.totalNum;b.totalPage=Math.ceil(b.totalNum/b.searchParams.pageSize);$("#exportModal").data("totalnum",b.totalNum);if(c.items.totalAmount>0){$("#page-bottom-tips").text("合计金额:"+c.items.totalAmount+" / 成单:"+c.items.totalWonAmount+" / 进行中:"+c.items.totalDoingAmount)}if(b.totalNum==0){$("#deal-blank").show();return}}b.ids.length=0;$.each(c.items.deals,function(d,e){b.showDealItemByList(d,e)});entity.loadExtInfo(_showFieldIds,b.ids,"/deal/list/extInfo","deal-item-");$("#item-pageNavi, #dropdown-menu-pageSize").show();createPageNavi(a,b.totalPage,b.totalNum,"item-pageNavi",function(d){b.loadDealByList(d)})}})},showDealItemByList:function(b,c){this.ids.push(c.encodedId);var f=$("#deal-body");var e=$("#item-clone").clone(true);e.removeClass("hide").addClass("list-item").attr("id","deal-item-"+c.encodedId);e.find(".idx input").data("id",c.encodedId);e.find("a.item-name").click(function(g){g.preventDefault();_targetId=c.encodedId;entity.loadSlidePanel("/deal/detail/"+encodeURIComponent(_targetId)+"?isListDetailPage=1")});e.find("a.item-name span.name").text(c.name);var d=c.status;if(d==DEAL_STATUS_LOST){$("<span class='label label-danger margin-right-5'>失败</span>").prependTo(e.find("a.item-name"))}else{if(d==DEAL_STATUS_WON){$("<span class='label label-success margin-right-5'>成功</span>").prependTo(e.find("a.item-name"))}}e.find("a.item-customerName").text(c.customerName).attr("href","/customer/detail/"+c.encodedCustomerId);e.find(".item-contactName").text(c.contactName);var a=entity.getUser(_users,c.encodedOwnerUserId);e.find("td.item-ownerUser").text(a.name);e.find("td.item-amount").text(c.formatAmount);e.find("td.item-phase").text(getArrayName(_dealPhases,c.phase));e.find("td.item-category").text(getArrayName(_dealCategories,c.categoryId));e.find("td.item-source").text(getArrayName(_dealSources,c.source));e.find("td.item-createDate").text(getFormatDate(c.createDate,"YYYY-MM-DD HH:mm"));e.find("td.item-closeDate").text(getFormatDate(c.closeDate,"YYYY-MM-DD"));e.find("td.item-lastContactDate").text(getFormatDate(c.lastContactDate,"YYYY-MM-DD HH:mm"));e.find("td.item-nextContactDate").text(getFormatDate(c.nextContactDate,"YYYY-MM-DD HH:mm"));if(b==-1){$("#deal-blank").hide();e.prependTo(f)}else{e.appendTo(f)}},loadDealByBoard:function(){var a=this;$("#deal-stages li").each(function(b){a.loadDealByPhase($(this).data("value"),1)})},loadDealByPhase:function(d,a){var f=this;var e=$("#deal-stage-"+d);var c=e.find("a.btn-loadmore");c.data("page",a);if(a==1){e.find("div.stage-body").addClass("is-loading");e.find("article").remove();c.addClass("hide")}else{var b=c.data("totalPage");if(a>=b){c.addClass("hide")}else{c.button("loading")}}f.searchParams.phase=d;f.searchParams.offset=(a-1)*_pageSize;$.ajax({url:"/deal/list",type:"POST",data:f.searchParams,dataType:"json",timeout:60000,error:function(i,g,h){e.find("div.stage-body").removeClass("is-loading");c.button("reset");alertify.alert("加载销售机会失败，请稍后再试")},success:function(g){e.find("div.stage-body").removeClass("is-loading");c.button("reset");if(g.code==0){alertify.alert(g.message);return}if(f.searchParams.offset==0){var i=g.items.totalNum;var h=Math.ceil(i/_pageSize);c.data("totalPage",h);e.find("header span.value span").text(g.items.totalAmount);e.find("header span.count span").text(g.items.totalNum);if(i==0){f.showDealBlankItem(d);return}if(h>1){c.removeClass("hide")}}$.each(g.items.deals,function(j,k){f.showDealItemByBoard(d,j,k)})}})},showDealBlankItem:function(b){var a=$("#deal-stage-item-blank-clone").clone(true).removeClass("hide").attr("id","").addClass("list-deal-item-blank");a.appendTo($("#deal-stage-body-"+b))},showDealItemByBoard:function(f,b,c){var e=$("#deal-stage-item-clone").clone(true).removeClass("hide").attr("id","deal-stage-item-"+c.encodedId);e.find(".stage-item-body a").click(function(g){g.preventDefault();_targetId=c.encodedId;entity.loadSlidePanel("/deal/detail/"+encodeURIComponent(_targetId)+"?isListDetailPage=1")});var a=entity.getUser(_users,c.encodedOwnerUserId);e.find(".avatar img").attr("src",entity.getUserAvatar(a));e.find("h4.title").text(c.name);e.find("span.amount").text(c.formatAmount);e.find("span.closeDate").text(getFormatDate(c.closeDate,"YYYY-MM-DD"));e.find("span.ownerUser").text(a.name);e.find("span.customerName").text(c.customerName);var d=c.status;if(d==DEAL_STATUS_LOST){e.find("span.status-badge").text("失败");e.addClass("status-lost")}else{if(d==DEAL_STATUS_WON){e.find("span.status-badge").text("成功");e.addClass("status-won")}else{}}e.appendTo($("#deal-stage-body-"+f))},loadDealByDate:function(){var a=this;$("#deal-stages div.timeline-stage").each(function(b){a.loadDealByMonth($(this).data("value"),1)})},loadDealByMonth:function(a,b){var f=this;var e=$("#deal-stage-"+a);var d=e.find("a.btn-loadmore");d.data("page",b);if(b==1){e.find("div.stage-body").addClass("is-loading");e.find("article").remove();d.addClass("hide")}else{var c=d.data("totalPage");if(b>=c){d.addClass("hide")}else{d.button("loading")}}f.searchParams.startCloseDate=a;f.searchParams.offset=(b-1)*_pageSize;$.ajax({url:"/deal/list",type:"POST",data:f.searchParams,dataType:"json",timeout:60000,error:function(i,g,h){e.find("div.stage-body").removeClass("is-loading");d.button("reset");alertify.alert("加载销售机会失败，请稍后再试")},success:function(g){e.find("div.stage-body").removeClass("is-loading");d.button("reset");if(g.code==0){alertify.alert(g.message);return}if(f.searchParams.offset==0){var i=g.items.totalNum;var h=Math.ceil(i/_pageSize);d.data("totalPage",h);e.find("header div.stage-title span.dotValue").text(i+" 个销售机会");e.find("header div.won-value span").text(g.items.totalWonAmount);e.find("header div.doing-value span").text(g.items.totalDoingAmount);e.find("header div.total-value span").text(g.items.totalAmount);if(i==0){f.showDealBlankItem(a);return}if(h>1){d.removeClass("hide")}}$.each(g.items.deals,function(j,k){f.showDealItemByBoard(a,j,k)})}})}};$(function(){if(_viewType==LIST_VIEW_TYPE_LIST){dealList.initList()}else{if(_viewType==LIST_VIEW_TYPE_STAGE){dealList.initPhase()}else{dealList.initDate()}}dealList.loadDeal()});