<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<head>
<base href="<%=basePath%>" >
<script language="javascript" type="text/javascript"
  src="js/My97DatePicker/WdatePicker.js"></script>
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date currentTime = new java.util.Date();
  String str_date = formatter.format(currentTime);
%>
<script language="javascript">
	function confirmDel(str) {
		return confirm(str);
	}
</script>

<style type="textcss" id="alertifyCSS">/* style.css */</style>
<title>企客宝客户管理系统-客户一览</title>
<link rel="stylesheet" href="css/vendor/bootstrap.min.css">
<link rel="stylesheet" href="css/vendor/alertify.min.css">
<link rel="stylesheet" href="css/vendor/toastr.min.css">
<link rel="stylesheet" href="css/vendor/bootstrap-treeview.min.css">
<link rel="stylesheet" href="css/vendor/asScrollable.min.css">
<link rel="stylesheet" href="css/vendor/asProgress.min.css">
<link rel="stylesheet" href="css/iconfont.css">
<link rel="stylesheet" href="css/bootstrap-extend.css">
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="script/vendor/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="script/vendor/jquery-migrate-3.0.0.min.js"></script>
<script type="text/javascript" src="script/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="script/vendor/alertify.min.js"></script>
<script type="text/javascript" src="script/vendor/toastr.min.js"></script>
<script type="text/javascript" src="script/vendor/bootstrap-treeview.min.js"></script>
<script type="text/javascript" src="script/vendor/jquery-asScrollbar.min.js"></script>
<script type="text/javascript" src="script/vendor/jquery-asScrollable.min.js"></script>
<script type="text/javascript" src="script/vendor/jquery-asProgress.min.js"></script>
<script type="text/javascript" src="script/vendor/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="script/vendor/handlebars.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="script/entity.js"></script>
<!-- <script type="text/javascript" src="script/ltt/mynew.js"></script>  -->
<script type="text/javascript">
// 全选框
function chgAll(t)
{
// 	第一个复选框选中或取消选中，则下面的复选框为全选或取消全选；
    $("input[name='item-all-checkbox']").attr('checked',t.checked);
    if(t.checked == true){
    	var ids = $.makeArray($("input[name='item-checkbox']"));
        for(var i in ids){
            if(ids[i].checked==false){
                $("input[name='item-checkbox']").attr('checked', true);
            }
        }
    }
}
// 单选框
function chg()
{
// 	当下面的复选框全部选中时，则将第一个复选框设置为选中，当下面的复选框中有一个没有被选中时，则第一个复选框取消选中；
    var ids = $.makeArray($("input[name='item-checkbox']"));
    for(var i in ids){
        if(ids[i].checked==false){
            $("input[name='item-all-checkbox']").attr('checked', false);
            System.out.println(ids[i].value);
            return;
        }
    }
    $("input[name='item-all-checkbox']").attr('checked', true);//全部选中的情况下，则第一个复选框选中
}
</script>
<style type="textcss">
.sindu_dragger{list-style:none;margin:0;padding:0;overflow:hidden;box-sizing:border-box}
.sindu_handle{cursor:move}.sindu_dragger li{margin:0;padding:0;list-style:none;text-align:inherit}
.sindu_dragger li table,.sindu_dragger td,.sindu_dragger th,.sindu_dragger tr{box-sizing:border-box}
.gu-mirror{list-style:none}
.sindu_dragger.sindu_column li{float:left}
.sindu_dragging .sindu_origin_table{visibility:hidden}
.gu-mirror{position:fixed!important;margin:0!important;z-index:9999!important;opacity:.8}
.gu-mirror li{margin:0;padding:0;list-style:none;text-align:inherit}
.gu-mirror li table,.gu-mirror td,.gu-mirror th,.gu-mirror tr{box-sizing:border-box}
.gu-hide{display:none!important}
.gu-unselectable{-webkit-user-select:none!important;-moz-user-select:none!important;-ms-user-select:none!important;user-select:none!important}
.gu-transit{opacity:.5}
</style>
</head>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="renderer" content="webkit"/>

<body class="app-customer">
<div class="page narrow">
  <div class="aside">
    <div class="aside-header"> <a href="#"><img class="brand-img" src="/images/logo-72.png"></a> </div>
    <div class="aside-navi-container">
      <div id="aside-navi-wrap" class="aside-navi-wrap asScrollable is-enabled asScrollable-vertical">
        <div class="asScrollable-container" style="height: 539px; width: 87px;">
          <div class="asScrollable-content" style="width: 70px;">
            <ul class="aside-navi">
              <li> <a id="aside-navi-workbench" href="workbench.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="工作台"> <i class="iconfont icon-workbench"></i> <span>工作台</span></a> </li>
              <li> <a class="selected" id="aside-navi-customer" href="customer.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="客户"> <i class="iconfont icon-company"></i> <span>客户</span></a> </li>
              <li> <a id="aside-navi-publicCustomer" href="publicCustomer.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="公海"> <i class="iconfont icon-publicGroup"></i> <span>公海</span></a> </li>
              <li> <a id="aside-navi-contact" href="contact.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="联系人"> <i class="iconfont icon-contacts"></i> <span>联系人</span></a> </li>
              <li> <a id="aside-navi-weixin" href="weixin.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="微信"> <i class="iconfont icon-weixin"></i> <span>微信</span></a> </li>
              <li> <a id="aside-navi-deal" href="deal.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="销售机会"> <i class="iconfont icon-deal"></i> <span>销售机会</span></a> </li>
              <li> <a id="aside-navi-contract" href="contract.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="合同"> <i class="iconfont icon-contract"></i> <span>合同</span></a> </li>
              <li> <a id="aside-navi-payment" href="payment.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="款项"> <i class="iconfont icon-payment"></i> <span>款项</span></a> </li>
              <li> <a id="aside-navi-note" href="note.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="跟进记录"> <i class="iconfont icon-note2"></i> <span>跟进记录</span></a> </li>
              <li> <a id="aside-navi-worksheet" href="worksheet.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="工单"> <i class="iconfont icon-worksheet"></i> <span>工单</span></a> </li>
              <li> <a id="aside-navi-workReport" href="workReport.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="工作汇报"> <i class="iconfont icon-workReport"></i> <span>工作汇报</span></a> </li>
              <li> <a id="aside-navi-product" href="product.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="产品"> <i class="iconfont icon-product"></i> <span>产品</span></a> </li>
              <li> <a id="aside-navi-callCenter" href="records.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="呼叫中心/短信"> <i class="iconfont icon-tel-busy"></i> <span>呼叫中心</span></a> </li>
              <li> <a id="aside-navi-statistics" href="customer.html" data-tooltip="tooltip" data-placement="right" data-container="body" data-original-title="统计分析"> <i class="iconfont icon-statistics"></i> <span>统计分析</span></a> </li>
            </ul>
          </div>
        </div>
        <div class="asScrollable-bar asScrollable-bar-vertical asScrollable-bar-hide" draggable="false">
          <div class="asScrollable-bar-handle" style="height: 407.33px;"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="page-main">
    <div class="page-main-header">
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="narrow"><a href="#" id="navi-narrow-link" data-narrow="1"><i class="iconfont"></i></a></div>
          <div class="navbar-header">客户一览</div>
          <div class="collapse navbar-collapse navbar-collapse-toolbar">
            <div class="navbar-search">
              <form>
                <div class="form-group">
                  <div class="input-search"> <i class="search-icon iconfont icon-search"></i> <span class="twitter-typeahead" style="position: relative; display: inline-block;">
                    <input type="text" class="form-control typeahead tt-hint" data-step="1" data-intro="快捷高效的模糊检索功能，帮您快速找到想要查看的客户" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0);" dir="ltr">
                    <input type="text" class="form-control typeahead tt-input" id="navbar-search-term" placeholder="输入客户名快速检索..." data-step="1" data-intro="快捷高效的模糊检索功能，帮您快速找到想要查看的客户" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;">
                    <pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Microsoft YaHei&quot;, simsun; font-size: 18px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre>
                    <div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;">
                      <div class="tt-dataset tt-dataset-search-cutomers"></div>
                    </div>
                    </span>
                  </div>
                </div>
              </form>
            </div>
            <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
              <li class="dropdown web-phone-dialpad-container"> <a data-toggle="dropdown" href="javascript:void(0)" title="呼叫中心" aria-expanded="false" data-animation="slide-bottom" role="button"> <i class="font-size-22 iconfont icon-tel" aria-hidden="true"></i> </a>
                <div class="dropdown-menu dropdown-menu-right web-phone-panel" role="menu" id="web-phone-panel">
                  <div class="web-phone-header" role="presentation">
                    <div class="pull-right margin-top-10"><span data-status="0" id="callcenter-seat-status" class="offline">离线</span> </div>
                    <h5>呼叫中心 <span id="callcenter-phone"></span></h5>
                  </div>
                  <div class="web-phone-dialpad">
                    <div class="web-phone-dialpad-input-container">
                      <input pattern="\d*" type="tel" placeholder="" id="dialpad-number-input">
                      <a class="dialpad-number-backspace" id="dialpad-number-backspace" href="#"> <i class="font-size-26 iconfont icon-backspace"></i> </a> </div>
                    <ul class="web-phone-dialpad-number-container" id="web-phone-dialpad-number-container">
                      <li data-value="1">1</li>
                      <li data-value="2">2</li>
                      <li data-value="3">3</li>
                      <li data-value="4">4</li>
                      <li data-value="5">5</li>
                      <li data-value="6">6</li>
                      <li data-value="7">7</li>
                      <li data-value="8">8</li>
                      <li data-value="9">9</li>
                      <li data-value="*">*</li>
                      <li data-value="0">0</li>
                      <li data-value="#">#</li>
                    </ul>
                    <div class="text-center padding-bottom-20"> <a id="dialpad-call-btn" class="dialpad-call-btn disabled" href="#"> <i class="iconfont icon-tel"></i> </a>
                      <div id="dialpad-message" class="margin-top-10 text-danger"></div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="dropdown notification"> <a data-toggle="dropdown" href="javascript:void(0)" title="通知提醒" aria-expanded="false" data-animation="slide-bottom" role="button"> <i class="font-size-22 iconfont icon-bell-black" aria-hidden="true"></i> <span class="badge badge-danger up hide" id="notificationNum"></span> </a>
                <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
                  <li class="dropdown-menu-header" role="presentation">
                    <h5>通知提醒</h5>
                  </li>
                  <li class="list-group" role="presentation">
                    <div data-role="container">
                      <div data-role="content"> <a class="list-group-item" role="menuitem" href="/customer?ownerUserId=QVtaSg%3D%3D&amp;endNextContactDate=2018-09-10">
                        <div class="media">
                          <div class="media-left padding-right-10"> <i class="icon iconfont icon-company bg-red-600 white icon-circle" aria-hidden="true"></i> </div>
                          <div class="media-body">
                            <h6 class="media-heading">截至到今天需要需要联系的客户</h6>
                            <time class="media-meta">合计 <span id="needContactCustomerNum">0</span></time>
                          </div>
                        </div>
                        </a> <a class="list-group-item" role="menuitem" href="/task?startDate=2018-09-10">
                        <div class="media">
                          <div class="media-left padding-right-10"> <i class="icon iconfont icon-task bg-red-600 white icon-circle" aria-hidden="true"></i> </div>
                          <div class="media-body">
                            <h6 class="media-heading">截至到今天未完成的任务</h6>
                            <time class="media-meta">合计 <span id="unfinishedTaskNum">0</span></time>
                          </div>
                        </div>
                        </a> <a class="list-group-item" href="/contract?expireDay=30" role="menuitem">
                        <div class="media">
                          <div class="media-left padding-right-10"> <i class="icon iconfont icon-contract bg-red-600 white icon-circle" aria-hidden="true"></i> </div>
                          <div class="media-body">
                            <h6 class="media-heading">30天内到期的合同</h6>
                            <time class="media-meta">合计 <span id="expiredContractNum">0</span></time>
                          </div>
                        </div>
                        </a> </div>
                    </div>
                  </li>
                  <li class="dropdown-menu-footer" role="presentation"> <a href="/task" role="menuitem">查看所有任务提醒</a> </li>
                </ul>
              </li>
              <li class="dropdown"> <a class="navbar-avatar dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" data-step="2" data-position="left" data-intro="点击这里可以进行系统设置(比如创建部门，员工等)以及个人设置(比如修改登录密码，头像等)"> <span class="avatar avatar-online"> <img class="brand-img" src="images/adminimg.png"> <i></i> </span> </a>
                <ul class="dropdown-menu" role="menu">
                  <li role="presentation"> <a href="/myproject/admin/adinformation" role="menuitem"> <i class="icon iconfont icon-me" aria-hidden="true"></i> 个人信息</a></li>
                  <li role="presentation"> <a href="/setting" role="menuitem"> <i class="icon iconfont icon-system-setting" aria-hidden="true"></i>系统设置</a> </li>
                  <li role="presentation"> <a href="https://qikebao.kf5.com/forum/view/1047193/" role="menuitem" target="_blank"> <i class="icon iconfont icon-help" aria-hidden="true"></i> 在线帮助</a> </li>
                  <li role="presentation"> <a href="#" data-toggle="modal" data-target="#downloadAppModal" role="menuitem"> <i class="icon iconfont icon-app" aria-hidden="true"></i> 下载手机App</a> </li>
                  <li class="divider" role="presentation"></li>
                  <li role="presentation"> <a href="/myproject/admin/login" role="menuitem"> <i class="icon iconfont icon-logout" aria-hidden="true"></i> 退出</a> </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <script type="text/javascript">
    /*<![CDATA[*/
    $(function () {
      loadNotification();
      $("#aside-navi-wrap").asScrollable({
        contentSelector: ">",
        containerSelector: ">"
      });
      $("#navi-narrow-link").click(function (e) {
        e.preventDefault();
        $("#aside-navi-wrap").asScrollable('destroy');
        var _narrow = $(this).data("narrow");
        if (_narrow == "1") {
          $(this).data("narrow", "0");
          $("body>div.page").removeClass("narrow");
        } else {
          $(this).data("narrow", "1");
          $("body>div.page").addClass("narrow");
        }
        setTimeout(function () {
          $("#aside-navi-wrap").asScrollable({
            contentSelector: ">",
            containerSelector: ">"
          });
        }, 500);
      });

      $('.navbar .notification').on('shown.bs.dropdown', function () {
        $(this).find('li.list-group').asScrollable({
          contentSelector: ">",
          containerSelector: ">"
        });
        loadNotification();
      });

      var customersBloodhound = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
          url: '/customer/search/all?term=%QUERY',
          wildcard: '%QUERY'
        }
      });
      customersBloodhound.initialize();

      $('#navbar-search-term').typeahead({
        minLength: 2
      }, {
        name: 'search-cutomers',
        display: 'text',
        limit: 20,
        source: customersBloodhound,
        templates: {
          empty: [
            '<div class="tt-suggestion empty-message">',
            '没有找到符合条件的客户信息',
            '</div>'
          ].join('\n'),
          suggestion: Handlebars.compile('<div><i class="iconfont icon-{{icon}} font-size-18"></i> {{text}}</div>')
        }
      });

      $('#navbar-search-term').bind('typeahead:select', function (ev, suggestion) {
        var _url = "";
        if (suggestion.type == ENTITY_CUSTOMER) {
          _url = "/customer/detail/";
        } else {
          _url = "/contact/detail/";
        }
        _url = _url + suggestion.id;
        window.location = _url;
      });

      callcenter.init();
    });

    function loadNotification() {
      $.ajax({
        url: '/notification?random=' + Math.random(),
        type: 'GET',
        dataType: 'json',
        timeout: 60000,
        success: function (json) {
          if (json.code <= 0) {
            return;
          }
          $("#needContactCustomerNum").text(json.items.needContactCustomerNum);
          $("#unfinishedTaskNum").text(json.items.unfinishedTaskNum);
          $("#expiredContractNum").text(json.items.expiredContractNum);
          var _totalNum = json.items.needContactCustomerNum + json.items.unfinishedTaskNum + json.items.expiredContractNum;
          if (_totalNum > 0) {
            $("#notificationNum").removeClass("hide").text(_totalNum);
          } else {
            $("#notificationNum").addClass("hide");
          }
        }
      });
    }
    
    /*]]>*/
  </script> 
    
      <div class="modal fade" id="downloadAppModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
        <div class="modal-dialog modal-center">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
              <h4 class="modal-title">下载安装企客宝旗舰版App</h4>
            </div>
            <div class="modal-body padding-horizontal-20">
              <div class="padding-20"> <img src="/images/appqrcode.png?ver=1.11.0.1" width="200" height="200">
                <p class="padding-top-10 text-muted">微信扫一扫下载</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page-main-container">
      <div>
        <div class="nav-tabs-horizontal">
          <div class="pull-right page-main-actions" data-step="3" data-intro="这里可以创建客户，以及通过客户名，电话等进行撞单查询">
<!--             <button type="button" data-toggle="modal" data-target="#duplicateSearchModal" class="btn btn-info btn-sm"> 撞单查询 </button> -->
            <button type="button" data-toggle="modal" data-target="#customerModal" class="btn btn-success btn-sm"> 创建客户 </button>
          </div>
          <c:choose>
		   <c:when test="${mymode eq '1' }">
		    <ul class="nav nav-tabs nav-tabs-line" id="customer-item-list-tab">
              <li > <a href="/myproject/customer/customerList" data-field="searchType" data-value="0">全部客户</a></li>
              <li class="active"> <a href="/myproject/customer/customerList3?mymode=1" data-field="searchType" data-value="1">我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=2" data-field="searchType" data-value="2">共享给我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=3" data-field="searchType" data-value="3">我共享的客户</a></li>
            </ul>
 		   </c:when>
 		   <c:when test="${mymode eq '2' }">
		    <ul class="nav nav-tabs nav-tabs-line" id="customer-item-list-tab">
              <li > <a href="/myproject/customer/customerList" data-field="searchType" data-value="0">全部客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=1" data-field="searchType" data-value="1">我的客户</a></li>
              <li class="active"> <a href="/myproject/customer/customerList3?mymode=2" data-field="searchType" data-value="2">共享给我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=3" data-field="searchType" data-value="3">我共享的客户</a></li>
            </ul>
 		   </c:when>
 		   <c:when test="${mymode eq '3' }">
		    <ul class="nav nav-tabs nav-tabs-line" id="customer-item-list-tab">
              <li > <a href="/myproject/customer/customerList" data-field="searchType" data-value="0">全部客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=1" data-field="searchType" data-value="1">我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=2" data-field="searchType" data-value="2">共享给我的客户</a></li>
              <li class="active"> <a href="/myproject/customer/customerList3?mymode=3" data-field="searchType" data-value="3">我共享的客户</a></li>
            </ul>
 		   </c:when>
  		   <c:otherwise>
		    <ul class="nav nav-tabs nav-tabs-line" id="customer-item-list-tab">
              <li class="active"> <a href="/myproject/customer/customerList" data-field="searchType" data-value="0">全部客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=1" data-field="searchType" data-value="1">我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=2" data-field="searchType" data-value="2">共享给我的客户</a></li>
              <li > <a href="/myproject/customer/customerList3?mymode=3" data-field="searchType" data-value="3">我共享的客户</a></li>
            </ul>
 		   </c:otherwise>
		 </c:choose>
<!--           <ul class="nav nav-tabs nav-tabs-line" id="customer-item-list-tab"> -->
<!--             <li class="active"> <a href="/myproject/customer/customerList" data-field="searchType" data-value="0">全部客户</a></li> -->
<!--             <li > <a href="/myproject/customer/customerList3?mymode=1" data-field="searchType" data-value="1">我的客户</a></li> -->
<!--             <li > <a href="/myproject/customer/customerList3?mymode=2" data-field="searchType" data-value="2">共享给我的客户</a></li> -->
<!--             <li > <a href="/myproject/customer/customerList3?mymode=3" data-field="searchType" data-value="3">我共享的客户</a></li> -->
<!--           </ul> -->
          <div>
            <div class="padding-top-20 search-item-container ">
              <div class="search-item-adv-container">
              <form class="form-inline" id="search-customer-basic-form2">
                <div class="search-item"> <span class="search-item-title pull-left">客户状态</span>
                  <div class="search-item-condition" id="search-basic-status"> <a href="#" class="selected item" data-field="status" data-value="-1">全部</a> <a href="#" class="item" data-field="status" data-value="0">未成交</a> <a href="#" class="item" data-field="status" data-value="1">已成交</a> <a href="#" class="item" data-field="status" data-value="2">即将转移到公海</a> </div>
                </div>
                <div class="search-item"> <span class="search-item-title pull-left">客户分类</span>
                  <div class="search-item-condition" id="search-basic-categoryId"> <a href="#" class="selected item" data-field="categoryId" data-value="-1">全部</a> <a href="#" data-field="categoryId" class="item" data-value="A">A(重点客户)</a><a href="#" data-field="categoryId" class="item" data-value="B">B(普通客户)</a><a href="#" data-field="categoryId" class="item" data-value="C">C(低价值客户)</a> <a href="#" data-field="categoryId" data-value="0" class="item">未分类</a> </div>
                </div>
                <div class="search-item"> <span class="search-item-title pull-left">联系时间</span>
                  <div class="search-item-condition" id="search-contactDate-condition"> <a href="#" class="selected item" data-field="contactDate" data-value="all">全部</a> 
<!--                   <span class="dropdown">  -->
<!--                   <a href="#" data-toggle="dropdown" class="item" data-field="contactDate" data-value="none"> <span id="search-contactDate-condition-title">未联系</span>  -->
<!--                   <span class="caret"></span></a> -->
<!--                     <ul class="dropdown-menu" role="menu" id="search-contactDate-menu"> -->
<!--                       <li role="presentation"><a href="#" data-value="0" role="menuitem">所有未联系</a></li> -->
<!--                       <li role="presentation"><a href="#" role="menuitem" data-value="1">超过一周未联系</a></li> -->
<!--                       <li role="presentation"><a href="#" role="menuitem" data-value="2">超过两周未联系</a></li> -->
<!--                       <li role="presentation"><a href="#" role="menuitem" data-value="3">超过一月未联系</a></li> -->
<!--                     </ul> -->
<!--                     </span>  -->
                    <a href="#" class="item" data-field="contactDate" data-value="yesterday">昨天</a> 
                    <a href="#" class="item" data-field="contactDate" data-value="today">今天</a> 
                    <a href="#" class="item" data-field="contactDate" data-value="thisweek">本周</a> 
                    <a href="#" class="item" data-field="contactDate" data-value="lastweek">上周</a> 
                    <a href="#" class="item" data-field="contactDate" data-value="thismonth">本月</a> 
                    <a href="#" class="item" data-field="contactDate" data-value="lastmonth">上月</a> 
                    <span class="dropdown"> <a href="#" data-toggle="dropdown" class="item">指定时间 <span class="caret"></span></a>
                    <div class="dropdown-menu search-item-condition-datetimepicker-dropdown-menu" role="menu">
                      <div class="padding-bottom-10">设置指定时间段</div>
                      <div class="input-daterange clearfix" data-plugin="datepicker">
                        <div class="input-group"> <span class="input-group-addon"> <i class="icon iconfont icon-calendar" aria-hidden="true"></i> </span>
                          <input type="text" class="form-control" value="" name="search-contactDate-start" id="search-contactDate-start">
                        </div>
                        <div class="input-group"> <span class="input-group-addon">到</span>
                          <input type="text" class="form-control" value="" name="search-contactDate-end" id="search-contactDate-end">
                        </div>
                      </div>
                      <div class="padding-top-10">
                        <button type="button" class="btn btn-primary btn-sm search-date" data-field="contactDate">搜索</button>
                      </div>
                    </div>
                    </span> </div>
                </div>
<!--                 <div class="search-item clearfix"> <span class="search-item-title pull-left">客户标签</span> -->
<!--                   <div class="pull-left"> <span class="dropdown" id="search-adv-tag-dropdown"> -->
<!--                     <button type="button" style="width:300px" class="btn btn-sm btn-default btn-inverse dropdown-toggle padding-vertical-8" data-toggle="dropdown" href="#" aria-expanded="false">请选择标签 <span class="caret"></span></button> -->
<!--                     <div class="dropdown-menu dropdown-menu-checkbox-container" role="menu" id="search-adv-tag-dropdown-menu-container"> -->
<!--                       <div class="dropdown-menu-checkbox-list"> -->
<!--                         <div data-role="container"> -->
<!--                           <div data-role="content"> <span role="presentation" class="padding-horizontal-20 checkbox-item"> -->
<!--                             <div class="checkbox-custom checkbox-dark"> -->
<!--                               <input type="checkbox" name="tag-item-checkbox" value="-1" id="search-adv-customer-tag-item-0"> -->
<!--                               <label for="search-adv-customer-tag-item-0">无标签</label> -->
<!--                             </div> -->
<!--                             </span> </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <p class="padding-horizontal-20"> -->
<!--                         <button id="search-adv-tag-btn" type="button" class="btn btn-primary btn-sm btn-block">搜索</button> -->
<!--                       </p> -->
<!--                     </div> -->
<!--                     </span> </div> -->
<!--                   <span class="margin-left-20 search-item-title pull-left">分类修改时间</span> -->
<!--                   <div class="pull-left" style="width:300px"> -->
<!--                     <div class="input-group input-daterange" id="search-categoryChangeDate"> -->
<!--                       <input type="text" class="form-control" value="" name="search-startCategoryChangeDate" id="search-startCategoryChangeDate"> -->
<!--                       <div class="input-group-addon">到</div> -->
<!--                       <input type="text" class="form-control" value="" name="search-endCategoryChangeDate" id="search-endCategoryChangeDate"> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
                <div class="search-item clearfix"> <span class="search-item-title pull-left">创建时间</span>
                  <div class="pull-left" style="width:300px">
                    <div class="input-group input-daterange" id="search-createDate">
                      <input type="text" class="form-control" value="" name="search-startCreateDate" id="search-startCreateDate">
                      <div class="input-group-addon">到</div>
                      <input type="text" class="form-control" value="" name="search-endCreateDate" id="search-endCreateDate">
                    </div>
                  </div>
                  <span class="margin-left-20 search-item-title pull-left">分配时间</span>
                  <div class="pull-left" style="width:300px">
                    <div class="input-group input-daterange" id="search-assignDate">
                      <input type="text" class="form-control" value="" name="search-startAssignDate" id="search-startAssignDate">
                      <div class="input-group-addon">到</div>
                      <input type="text" class="form-control" value="" name="search-endAssignDate" id="search-endAssignDate">
                    </div>
                  </div>
                </div>
                <div class="search-item clearfix"> <span class="search-item-title pull-left">下次联系时间</span>
                  <div class="pull-left" style="width:300px">
                    <div class="input-group input-daterange" id="search-nextContactDate">
                      <input type="text" class="form-control" value="" name="search-startNextContactDate" id="search-startNextContactDate">
                      <div class="input-group-addon">到</div>
                      <input type="text" class="form-control" value="" name="search-endNextContactDate" id="search-endNextContactDate">
                    </div>
                  </div>
                  <span class="margin-left-20 search-item-title pull-left">成交时间</span>
                  <div class="pull-left" style="width:300px">
                    <div class="input-group input-daterange" id="search-statusChangeDate">
                      <input type="text" class="form-control" value="" name="search-startStatusChangeDate" id="search-startStatusChangeDate">
                      <div class="input-group-addon">到</div>
                      <input type="text" class="form-control" value="" name="search-endStatusChangeDate" id="search-endStatusChangeDate">
                    </div>
                  </div>
                </div>
                <p class="text-center">
                 <button type="submit" class="btn btn-success btn-sm">搜索</button>
                  <button type="button" id="show-basic-search-btn" class="btn btn-default btn-xs"><i class="icon iconfont icon-arrow-up"></i>精简模式 </button>
                </p>
                </form>
              </div>
              <div class="search-item-basic-container">
                <form class="form-inline" id="search-customer-basic-form">
                  <div class="form-group">
                    <label class="control-label padding-right-10" for="search-basic-status">状态</label>
                    <select class="form-control select2-hidden-accessible" name="search-basic-status" id="search-basic-statusmy" data-plugin="select2" data-language="zh-CN" style="width:180px;" tabindex="-1" aria-hidden="true">
                      <option value="-1">全部</option>
                      <option value="0">未成交</option>
                      <option value="1">已成交</option>
                      <option value="2">即将转移到公海</option>
                    </select>
<!--                     <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 180px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-search-basic-status-container"><span class="select2-selection__rendered" id="select2-search-basic-status-container" title="全部">全部</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>  -->
                  </div>
                  <div class="form-group padding-left-10">
                    <label class="control-label padding-right-10" for="search-basic-categoryId">分类</label>
                    <select class="form-control select2-hidden-accessible" name="search-basic-categoryId" id="search-basic-categoryIdmy" data-plugin="select2" data-language="zh-CN" style="width:180px;" tabindex="-1" aria-hidden="true">
                      <option value="-1">全部</option>
                      <option value="0">未分类</option>
                      <option value="A">A(重点客户)</option>
                      <option value="B">B(普通客户)</option>
                      <option value="C">C(低价值客户)</option>
                    </select>
<!--                     <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 180px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-search-basic-categoryId-container"><span class="select2-selection__rendered" id="select2-search-basic-categoryId-container" title="全部">全部</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>  -->
                  </div>
<!--                   <div class="form-group padding-left-10"> -->
<!--                     <label class="control-label padding-right-10" for="search-basic-tagId">标签</label> -->
<!--                     <select class="form-control select2-hidden-accessible" name="search-basic-tag-dropdown-menu-container" id="search-basic-tag-dropdown-menu-container" data-plugin="select2" data-language="zh-CN" style="width:180px;" tabindex="-1" aria-hidden="true"> -->
<!--                       <option value="-1">全部</option> -->
<!--                       <option value="0">未成交</option> -->
<!--                       <option value="1">已成交</option> -->
<!--                       <option value="2">即将转移到公海</option> -->
<!--                     </select> -->
<!--                     <span class="dropdown" id="search-basic-tag-dropdown"> -->
<!--                     <button type="button" class="btn btn-sm btn-default btn-inverse dropdown-toggle padding-vertical-8" data-toggle="dropdown" href="#" aria-expanded="false">请选择标签 <span class="caret"></span></button> -->
<!--                     <div class="dropdown-menu dropdown-menu-checkbox-container" role="menu" id="search-basic-tag-dropdown-menu-container"> -->
<!--                       <div class="dropdown-menu-checkbox-list"> -->
<!--                         <div data-role="container"> -->
<!--                           <div data-role="content"> <span role="presentation" class="padding-horizontal-20 checkbox-item"> -->
<!--                             <div class="checkbox-custom checkbox-dark"> -->
<!--                               <input type="checkbox" name="tag-item-checkbox" value="-1" id="search-basic-customer-tag-item-0"> -->
<!--                               <label for="search-basic-customer-tag-item-0">无标签</label> -->
<!--                             </div> -->
<!--                             </span> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     </span> -->
<!--                   </div> -->
                  <div class="form-group padding-left-10">
                    <label class="control-label padding-right-10" for="search-basic-nextContactDate">下次联系时间</label>
                    <div class="input-group input-daterange" id="search-basic-nextContactDate">
                      <input type="text" class="form-control" value="" name="search-basic-startNextContactDate" id="search-basic-startNextContactDate">
                      <div class="input-group-addon">到</div>
                      <input date-id="nexttimeed" type="text" class="form-control" value="" name="search-basic-endNextContactDate" id="search-basic-endNextContactDate">
                    </div>
                  </div>
                  <div class="form-group padding-left-10">
                    <label class="control-label padding-right-10" for="search-basic-ownerUserId">负责人</label>
                    <input type="text" class="form-control" value="" name="search-basic-ownerUserId" id="search-basic-ownerUserId">
<!--                     <select class="form-control select2-hidden-accessible" name="search-basic-ownerUserId" id="search-basic-ownerUserId" data-plugin="select2" data-language="zh-CN" style="width:180px;" tabindex="-1" aria-hidden="true"> -->
<!--                       <option value="">全部</option> -->
<!--                       <option value="">孙伟</option> -->
<!--                     </select> -->
<!--                     <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 180px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-search-basic-ownerUserId-container"><span class="select2-selection__rendered" id="select2-search-basic-ownerUserId-container" title="全部">全部</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> -->
                  </div>
                  <div class="form-group padding-left-10" data-step="4" data-intro="高级搜索中包含更丰富的搜索条件">
                    <button type="submit" class="btn btn-success btn-sm">搜索</button>
                    <a class="font-size-12 padding-left-5" id="show-adv-search-link" href="#">高级搜索</a> 
                  </div>
                </form>
              </div>
            </div>
            <hr>
            <div class="action-bar padding-top-10 clearfix">
              <div class="pull-right" data-step="6" data-intro="可以按客户名，电话等各个字段进行详细检索">
                <div>
                  <form id="search-field-form">
                    <div class="form-group">
                      <div class="input-group">
                      
                        <div class="input-group-btn auto-width dropdown" id="search-dropdown">
                          <button class="btn btn-default btn-inverse" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span id="search-dropdown-label" data-id="uname" data-description="1" data-type="1">公司名</span> <span class="caret"></span> </button>
                          
                          <div class="dropdown-menu" role="menu">
                            <div class="dropdown-menu-list" style="max-height:400px;" id="search-dropdown-list">
                              <div data-role="container">
                                <div data-role="content">
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uname" data-type="1"  data-description="1">公司名</a></div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uprovince" data-type="1" data-description="1">省份</a></div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="ucity" data-type="1" data-description="1">城市</a></div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="umobile" data-type="1" data-description="4">手机</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="ulandline" data-type="1" data-description="4">座机</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="umailbox" data-type="1" data-description="5">邮箱</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uqq" data-type="1" data-description="6">QQ</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uwebsite" data-type="1" data-description="7">官网</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uaddress" data-type="1" data-description="1">地址</a> </div>
                                  <div role="presentation" class="dropdown-menu-item"> <a href="#" role="menuitem" data-id="uintroduction" data-type="1" data-description="2">简介</a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                        </div>
                        
                        <span id="search-control-container">
                        <input type="text" class="form-control search-control" id="search-field-keyword" placeholder="检索..." >
                        <div class="input-daterange clearfix search-control hide" data-plugin="datepicker" id="search-field-datepicker">
                          <div class="input-group">
                            <input type="text" class="form-control" id="search-field-start" style="width:120px">
                          </div>
                          <div class="input-group">
                            <input type="text" class="form-control" id="search-field-end" style="width:120px">
                          </div>
                        </div>
                        <div class="input-daterange clearfix search-control hide" id="search-field-number">
                          <div class="input-group">
                            <input type="text" class="form-control" id="search-field-min" style="width:120px">
                          </div>
                          <div class="input-group">
                            <input type="text" class="form-control" id="search-field-max" style="width:120px">
                          </div>
                        </div>
                        <select class="form-control search-control hide" id="search-field-select"></select>
                        </span>
                        <span class="input-group-btn auto-width">
                          <button type="submit" id="search-field-button" class="btn btn-success"><i class="icon iconfont icon-search" aria-hidden="true"></i></button>
                        </span>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="shareModal" data-tips="请选择需要共享的客户"> <i class="icon iconfont icon-share" aria-hidden="true"></i>共享客户 </button>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="transferModal" data-tips="请选择需要转移的客户"> <i class="icon iconfont icon-transfer" aria-hidden="true"></i>转移客户 </button>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="transferCommonCustomerModal" data-tips="请选择需要转移的客户"> <i class="icon iconfont icon-publicCustomer" aria-hidden="true"></i>转移到公海 </button>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="changeCategoryModal" data-tips="请选择需要修改的客户"> <i class="icon iconfont icon-category" aria-hidden="true"></i>修改分类 </button>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="batchChangeTagModal" data-tips="请选择需要修改的客户"> <i class="icon iconfont icon-tag-black" aria-hidden="true"></i>修改标签 </button>
              <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="changeNextContactDateModal" data-tips="请选择需要修改的客户"> <i class="icon iconfont icon-bell" aria-hidden="true"></i>设置下次联系时间 </button>
<!--               <button type="button" class="btn btn-sm btn-default" data-plugin="customModal" data-modal="smsModal" data-tips="请选择需要发送短信的客户"> <i class="icon iconfont icon-sms" aria-hidden="true"></i>发短信 </button> -->
              <button type="button" class="btn btn-sm btn-default" id="entity-list-delete-btn" data-name="customer" data-containerid="entity-item-list"> <i class="icon iconfont icon-trash" aria-hidden="true"></i>删除 </button>

<!--               <div class="btn-group"> -->
<!--                 <button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#importModal"> <i class="icon iconfont icon-import" aria-hidden="true"></i>导入 </button> -->
<!--                 <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="caret"></span> <span class="sr-only">导入客户</span> </button> -->
<!--                 <ul class="dropdown-menu" role="menu"> -->
<!--                   <li role="presentation"> <a href="javascript:void(0)" data-toggle="modal" data-templateurl="/customer/import/template" data-title="导入客户" data-uploadurl="/customer/import/upload" data-importsaveurl="/customer/import/save" data-target="#importModal" role="menuitem">导入客户</a></li> -->
<!--                   <li role="presentation"> <a href="javascript:void(0)" data-toggle="modal" data-templateurl="/customer/importAll/template" data-title="同时导入客户和联系人" data-uploadurl="/customer/importAll/upload" data-importsaveurl="/customer/importAll/save" data-target="#importModal" role="menuitem">同时导入客户和联系人</a></li> -->
<!--                   <li role="presentation"> <a href="javascript:void(0)" data-toggle="modal" data-target="#importHistoryRecordModal" role="menuitem">查看导入记录</a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="btn-group"> -->
<!--                 <button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#exportModal"> <i class="icon iconfont icon-export" aria-hidden="true"></i> 导出 </button> -->
<!--                 <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="caret"></span> <span class="sr-only">导出客户</span> </button> -->
<!--                 <ul class="dropdown-menu" role="menu"> -->
<!--                   <li role="presentation"><a href="javascript:void(0)" id="export-select-item-link" role="menuitem">只导出当前选择客户</a></li> -->
<!--                   <li role="presentation"><a href="javascript:void(0)" data-toggle="modal" data-target="#exportModal" role="menuitem">导出全部</a></li> -->
<!--                 </ul> -->
<!--               </div> -->
              <span class="dropdown" id="dropdown-entity-fields" data-step="5" data-intro="点击这里可以设置需要显示的列">
              <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">显示列 <span class="caret"></span></button>
              <div class="dropdown-menu dropdown-menu-checkbox-container" role="menu" id="entity-fields-container">
                <div class="dropdown-menu-checkbox-list">
                  <div data-role="container">
                    <div data-role="content"> <span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="tag" id="entity-setting-field-item-tag" checked="checked">
                        <label for="entity-setting-field-item-tag">标签</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="ownerUser" id="entity-setting-field-item-ownerUser" checked="checked">
                        <label for="entity-setting-field-item-ownerUser">负责人</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="category" id="entity-setting-field-item-category" checked="checked">
                        <label for="entity-setting-field-item-category">客户类型</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="province" id="entity-setting-field-item-province" checked="checked">
                        <label for="entity-setting-field-item-province">省份</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="city" id="entity-setting-field-item-city" checked="checked">
                        <label for="entity-setting-field-item-city">城市</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="nextContactDate" id="entity-setting-field-item-nextContactDate" checked="checked">
                        <label for="entity-setting-field-item-nextContactDate">下次联系时间</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="createDate" id="entity-setting-field-item-createDate" checked="checked">
                        <label for="entity-setting-field-item-createDate">创建时间</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="createUser" id="entity-setting-field-item-createUser" checked="checked">
                        <label for="entity-setting-field-item-createUser">创建人</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="assignDate" id="entity-setting-field-item-assignDate" checked="checked">
                        <label for="entity-setting-field-item-assignDate">客户分配时间</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="lastContactDate" id="entity-setting-field-item-lastContactDate" checked="checked">
                        <label for="entity-setting-field-item-lastContactDate">最后联系时间</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="lastContactUser" id="entity-setting-field-item-lastContactUser" checked="checked">
                        <label for="entity-setting-field-item-lastContactUser">最后联系人</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="lastRemark" id="entity-setting-field-item-lastRemark" checked="checked">
                        <label for="entity-setting-field-item-lastRemark">最新跟进记录</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="mobilePhone" id="entity-setting-field-item-mobilePhone">
                        <label for="entity-setting-field-item-mobilePhone">手机</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerLandline" id="entity-setting-field-item-customerLandline">
                        <label for="entity-setting-field-item-customerLandline">座机</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerMailbox" id="entity-setting-field-item-customerMailbox">
                        <label for="entity-setting-field-item-customerMailbox">邮箱</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerQQ" id="entity-setting-field-item-customerQQ">
                        <label for="entity-setting-field-item-customerQQ">QQ</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerWebsite" id="entity-setting-field-item-customerWebsite">
                        <label for="entity-setting-field-item-customerWebsite">官网</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerAddress" id="entity-setting-field-item-customerAddress">
                        <label for="entity-setting-field-item-customerAddress">地址</label>
                      </div>
                      </span><span role="presentation" class="padding-horizontal-20 checkbox-item">
                      <div class="checkbox-custom checkbox-dark">
                        <input type="checkbox" name="field-checkbox" value="customerIntroduction" id="entity-setting-field-item-customerIntroduction">
                        <label for="entity-setting-field-item-customerIntroduction">简介</label>
                      </div>
                      </span> </div>
                  </div>
                </div>
                <p class="padding-horizontal-20">
                  <button id="change-fields-btn" type="button" class="btn btn-primary btn-sm btn-block">保存设置</button>
                </p>
              </div>
              </span> </div>
            <div class="table-responsive page-content-table padding-top-20" id="entity-item-list">
              <table class="table table-pointer table-hover nowrap sindu_origin_table" id="entity-list-table">
                <thead>
                  <tr>
                    <th class="cell-80"> <div class="checkbox-custom checkbox-primary">
                        <input type="checkbox" name="item-all-checkbox" onchange="chgAll(this)">
                        <label></label>
                      </div>
                    </th>
                    <th class="cell-80 text-center"> <i class="iconfont icon-tel"></i> </th>
                    <th class="cell-250" data-step="7" data-intro="如同Excel一般，点击表头可以进行排序，也可以拖拽表头，调整各个列之间的显示顺序"> <a class="sort-title asc" href="#" data-sortfield="customerName" data-sortorder="1">客户名称</a> </th>
                    <th id="header-field-tag" class="handle cell-180 sindu_handle" data-field="tag"> <span>标签</span> </th>
                    <th id="header-field-ownerUser" class="handle cell-180 sindu_handle" data-field="ownerUser"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="ownerUser">负责人</a> </th>
                    <th id="header-field-category" class="handle cell-180 sindu_handle" data-field="category"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="category">客户类型</a> </th>
                    <th id="header-field-province" class="handle cell-180 sindu_handle" data-field="province"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="province">省份</a> </th>
                    <th id="header-field-city" class="handle cell-180 sindu_handle" data-field="city"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="city">城市</a> </th>
                    <th id="header-field-nextContactDate" class="handle cell-180 sindu_handle" data-field="nextContactDate"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="nextContactDate">下次联系时间</a> </th>
                    <th id="header-field-createDate" class="handle cell-180 sindu_handle" data-field="createDate"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="createDate">创建时间</a> </th>
                    <th id="header-field-createUser" class="handle cell-180 sindu_handle" data-field="createUser"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="createUser">创建人</a> </th>
                    <th id="header-field-assignDate" class="handle cell-180 sindu_handle" data-field="assignDate"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="assignDate">客户分配时间</a> </th>
                    <th id="header-field-lastContactDate" class="handle cell-180 sindu_handle" data-field="lastContactDate"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="lastContactDate">最后联系时间</a> </th>
                    <th id="header-field-lastContactUser" class="handle cell-180 sindu_handle" data-field="lastContactUser"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="lastContactUser">最后联系人</a> </th>
                    <th id="header-field-mobilePhone" class="handle cell-180 hide sindu_handle" data-field="mobilePhone"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="mobilePhone">手机</a> </th>
                    <th id="header-field-customerLandline" class="handle cell-180 hide sindu_handle" data-field="customerLandline"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerLandline">座机</a> </th>
                    <th id="header-field-customerMailbox" class="handle cell-180 hide sindu_handle" data-field="customerMailbox"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerMailbox">邮箱</a> </th>
                    <th id="header-field-customerQQ" class="handle cell-180 hide sindu_handle" data-field="customerQQ"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerQQ">QQ</a> </th>
                    <th id="header-field-customerWebsite" class="handle cell-180 hide sindu_handle" data-field="customerWebsite"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerWebsite">官网</a> </th>
                    <th id="header-field-customerAddress" class="handle cell-180 hide sindu_handle" data-field="customerAddress"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerAddress">地址</a> </th>
                    <th id="header-field-customerIntroduction" class="handle cell-180 hide sindu_handle" data-field="customerIntroduction"> <a href="#" data-sortorder="0" class="sort-title" data-sortfield="customerIntroduction">简介</a> </th>
                    <th></th>
                  </tr>
                </thead>
                <c:forEach items="${customers}" var="cus">
                <tbody id="customer-body">
                  <tr id="customer-item-clone">
					<!-- class="hide" -->
                    <td class="idx">
                      <div class="checkbox-custom checkbox-primary">
                        <input type="checkbox" name="item-checkbox" value="${cus.uno}" onclick="chg()">
                        <label></label>
                      </div>
                    </td>
                    <td class="text-center"><a href="#" class="item-phone" data-toggle="modal" data-target="#customerPhoneModal"><i class="iconfont icon-tel"></i></a></td>
                    <td><a href="#" class="item-name">
                    <c:choose>
					  <c:when test="${cus.ulabel eq '1' }">
					    <span class="label label-success margin-right-5">已成交</span>
 					  </c:when>
  					  <c:when test="${cus.ulabel eq '0' }">
					    <span class="label label-danger margin-right-5">未成交</span>
 					  </c:when>
 					  <c:when test="${cus.ulabel eq '2' }">
					    <span class="label label-default margin-right-5">即将转移到公海</span>
 					  </c:when>
 					  <c:otherwise>
					    <span class="label label-primary margin-right-5"></span>
 					  </c:otherwise>
					</c:choose>
                    <span class="name"></span> </a>${cus.uname}</td>
                    <td class="item-tag">${cus.ulabel}</td>
		    		<td class="item-ownerUser">${cus.personcharge}</td>
		    		<c:choose>
					  <c:when test="${cus.utype eq 'A' }">
					    <td class="item-category">A(重点客户)</td>
 					  </c:when>
  					  <c:when test="${cus.utype eq 'B' }">
					    <td class="item-category">B(普通客户)</td>
 					  </c:when>
 					  <c:when test="${cus.utype eq 'C' }">
					    <td class="item-category">C(低价值客户)</td>
 					  </c:when>
 					  <c:when test="${cus.utype eq '0' }">
					    <td class="item-category">未分类</td>
 					  </c:when>
 					  <c:otherwise>
					    <td class="item-category"></td>
 					  </c:otherwise>
					</c:choose>
					<td class="item-province">${cus.uprovince}</td>
					<td class="item-city">${cus.ucity}</td>
					<td class="item-nextContactDate"><fmt:formatDate value="${cus.nexttime}" type="date" pattern="yyyy-MM-dd" /></td>
					<td class="item-createDate"><fmt:formatDate value="${cus.createtime}" type="date" pattern="yyyy-MM-dd" /></td>
					<td class="item-createUser">${cus.ufounder}</td>
					<td class="item-assignDate"><fmt:formatDate value="${cus.allocatetime}" type="date" pattern="yyyy-MM-dd" /></td>
					<td class="item-lastContactDate"><fmt:formatDate value="${cus.lasttime}" type="date" pattern="yyyy-MM-dd" /></td>
					<td class="item-lastContactUser">${cus.lastperson}</td>
					<td class="item-mobilePhone hide">${cus.umobile}</td>
					<td class="item-customerLandline hide">${cus.ulandline}</td>
					<td class="item-customerMailbox hide">${cus.umailbox}</td>
					<td class="item-customerQQ hide">${cus.uqq}</td>
					<td class="item-customerWebsite hide">${cus.uwebsite}</td>
					<td class="item-customerAddress hide">${cus.uaddress}</td>
					<td class="item-customerIntroduction hide">${cus.uintroduction}</td>
					<td class="suf-cell">
<%-- 					<a href="/myproject/customer/todelete?uno=${cus.uno}" onclick="javascript:return confirmDel('确定要删除${cus.uname}吗')" >删除</a> --%>
					</td>
                  </tr>
                </tbody>
                </c:forEach>
              </table>
            </div>
            <div>
              <div class="pull-right"> <span id="page-bottom-tips" class="pull-left"></span> <span class="dropup" id="dropdown-menu-pageSize" style="">
                <button type="button" class="btn btn-pure" data-toggle="dropdown" aria-expanded="false"> <span class="pageSize">全部</span> <span class="caret"></span> </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                  <li role="presentation"> <a href="javascript:void(0)" data-value="10" role="menuitem">10条/页</a></li>
                  <li role="presentation"> <a href="javascript:void(0)" data-value="20" role="menuitem">20条/页</a></li>
                  <li role="presentation"> <a href="javascript:void(0)" data-value="50" role="menuitem">50条/页</a></li>
                  <li role="presentation"> <a href="javascript:void(0)" data-value="100" role="menuitem">100条/页</a></li>
                  <li role="presentation"> <a href="javascript:void(0)" data-value="-1" role="menuitem">全部</a></li>
                </ul>
                </span> </div>
              <div class="pagination">
                <div class="page-bottom" id="item-pageNavi" style=""></div>
              </div>
            </div>
            <div class="loading" id="search-loading" style="display: none;">
              <div class="liner">
                <h3>加载中...</h3>
                <img alt="加载中" src="/images/dots-white.gif"> </div>
            </div>
            <div id="customer-blank" class="loading" style="display: none;">
              <div class="liner">
                <h3>没有找到相关客户信息</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="customerModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">创建客户</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form class="form-horizontal" id="form-add-customer" name="form-add-customer">
<!--           <div class="form-group"> -->
<!--             <label class="col-sm-3 control-label required" for="customer-uno">客户编号</label> -->
<!--             <div class="col-sm-9"> -->
<!--               <input class="form-control" id="customer-uno" name="uno" data-field-required="true" value="" data-duplicate-key="uno" data-duplicate="true"> -->
<!--               <small class="help-block"></small> </div> -->
<!--           </div> -->
          <div class="form-group">
            <label class="col-sm-3 control-label required" for="customer-name">客户名称</label>
            <div class="col-sm-9">
              <input class="form-control" id="customer-name" name="uname" data-field-required="true" value="" data-duplicate-key="name" data-duplicate="true">
              <small class="help-block"></small> </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="customer-ownerUserId">负责人</label>
            <div class="col-sm-9">
              <input class="form-control" data-field-required="true" id="customer-ownerUserId" name="personcharge" value="" data-duplicate-key="ownerUser" data-duplicate="false">
<!--               <select class="form-control select2-hidden-accessible" name="personcharge" id="customer-ownerUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" data-field-required="true" tabindex="-1" aria-hidden="true"> -->
<!--                 <option value="QVtaSg==" selected="selected">孙伟</option> -->
<!--               </select> -->
<!--               <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"> -->
<!--               <span class="selection"> -->
<!--               <span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-ownerUserId-container"> -->
<!--               <span class="select2-selection__rendered" id="select2-customer-ownerUserId-container" title="孙伟">孙伟 -->
<!--               </span> -->
<!--               <span class="select2-selection__arrow" role="presentation"> -->
<!--               <b role="presentation"></b> -->
<!--               </span> -->
<!--               </span> -->
<!--               </span> -->
<!--               <span class="dropdown-wrapper" aria-hidden="true"> -->
<!--               </span> -->
<!--               </span>  -->
              <small class="help-block"></small>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="customer-categoryId">客户类型</label>
            <div class="col-sm-9">
              <select class="form-control select2-hidden-accessible" name="utype" id="customer-categoryId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
                <option value="0">无分类</option>
                <option value="A">A(重点客户)</option>
                <option value="B">B(普通客户)</option>
                <option value="C">C(低价值客户)</option>
              </select>
<!--               <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"> -->
<!--               <span class="selection"> -->
<!--               <span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-categoryId-container"> -->
<!--               <span class="select2-selection__rendered" id="select2-customer-categoryId-container" title="无分类">无分类 -->
<!--               </span> -->
<!--               <span class="select2-selection__arrow" role="presentation"> -->
<!--               <b role="presentation"></b> -->
<!--               </span> -->
<!--               </span> -->
<!--               </span> -->
<!--               <span class="dropdown-wrapper" aria-hidden="true"> -->
<!--               </span> -->
<!--               </span> -->
              </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="customer-province">地区</label>
            <div class="col-sm-4">
              <select class="form-control select2-hidden-accessible" id="customer-province" name="uprovince" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
                <option value="">省份</option>
                <option value="安徽">安徽</option>
                <option value="北京">北京</option>
                <option value="福建">福建</option>
                <option value="甘肃">甘肃</option>
                <option value="广东">广东</option>
                <option value="广西">广西</option>
                <option value="贵州">贵州</option>
                <option value="海南">海南</option>
                <option value="河北">河北</option>
                <option value="河南">河南</option>
                <option value="黑龙江">黑龙江</option>
                <option value="湖北">湖北</option>
                <option value="湖南">湖南</option>
                <option value="吉林">吉林</option>
                <option value="江苏">江苏</option>
                <option value="江西">江西</option>
                <option value="辽宁">辽宁</option>
                <option value="内蒙古">内蒙古</option>
                <option value="宁夏">宁夏</option>
                <option value="青海">青海</option>
                <option value="山东">山东</option>
                <option value="山西">山西</option>
                <option value="陕西">陕西</option>
                <option value="上海">上海</option>
                <option value="四川">四川</option>
                <option value="天津">天津</option>
                <option value="西藏">西藏</option>
                <option value="新疆">新疆</option>
                <option value="云南">云南</option>
                <option value="浙江">浙江</option>
                <option value="重庆">重庆</option>
                <option value="香港">香港</option>
                <option value="台湾">台湾</option>
                <option value="澳门">澳门</option>
              </select>
              <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-province-container"><span class="select2-selection__rendered" id="select2-customer-province-container" title="省份">省份</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> 
            </div>
            <div class="col-sm-5">
              <select class="form-control select2-hidden-accessible" id="customer-city" name="ucity" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
                <option value="">城市</option>
              </select>
              <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-city-container"><span class="select2-selection__rendered" id="select2-customer-city-container" title="城市">城市</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> 
            </div>
          </div>
          <div id="entity-field-custom">
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124558">手机</label>
              <div class="col-sm-9">
                <input class="form-control" data-field-tel="true" name="umobile" value="" data-field-required="false" data-duplicate-key="124558" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124559">座机</label>
              <div class="col-sm-9">
                <input class="form-control" data-field-tel="true" name="ulandline" value="" data-field-required="false" data-duplicate-key="124559" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124560">邮箱</label>
              <div class="col-sm-9">
                <input class="form-control" data-field-email="true" name="umailbox" value="" data-field-required="false" data-duplicate-key="124560" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124561">QQ</label>
              <div class="col-sm-9">
                <input class="form-control" data-field-qq="true" name="uqq" value="" data-field-required="false" data-duplicate-key="124561" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group hide">
              <label class="col-sm-3 control-label" for="customer-field-custom-124562">官网</label>
              <div class="col-sm-9">
                <input class="form-control" data-field-website="true" name="uwebsite" value="" data-field-required="false" data-duplicate-key="124562" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124563">地址</label>
              <div class="col-sm-9">
                <input class="form-control" value="" name="uaddress" data-field-required="false" data-duplicate-key="124563" data-duplicate="false">
                <small class="help-block"></small> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="customer-field-custom-124564">简介</label>
              <div class="col-sm-9">
                <textarea class="form-control" name="uintroduction" data-field-required="false" data-duplicate-key="124564" data-duplicate="false"></textarea>
                <small class="help-block"></small> </div>
            </div>
          </div>
          <div class="form-group"> <a class="col-sm-12 toggle-entity-field-custom-link" href="#"><i class="icon iconfont icon-plus"></i> 显示更多</a> </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="add-customer-btn" type="button">确定</button>
      <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="attachmentModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">上传附件</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-add-attachment">
          <div class="form-group">
            <label class="control-label">附件</label>
            <div> <span id="attachment-fileupload-btn-container">
              <button type="button" id="attachment-fileupload-btn" class="btn btn-pure btn-dark icon iconfont icon-attachment"> 添加附件 </button>
              </span>
              <div id="attachment-upload-attachments" class="upload-attachments">
                <div class="upload-attachment-item hide" id="attachment-upload-attachment-item-clone"> <i class="icon iconfont icon-attachment"></i> <span class="file-name padding-right-5"></span>(<span class="file-size"></span>) <span class="file-progress padding-left-10"></span> <a href="#" class="file-remove-link">删除</a> </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="attachment-remark">备注</label>
            <textarea class="form-control" id="attachment-remark" name="attachment-remark"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="add-attachment-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="transferModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">转移客户</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-transfer-entity">
          <div class="form-group">
            <label class="control-label" for="entity-newOwnerUserId">负责人</label>
<!--             <select class="form-control select2-hidden-accessible" name="entity-newOwnerUserId" id="entity-newOwnerUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true"> -->
              <input type="text"  class="form-control" value="" id="entity-transfer-tips">
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-entity-newOwnerUserId-container"><span class="select2-selection__rendered" id="select2-entity-newOwnerUserId-container" title="孙伟">孙伟</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> <small class="help-block" id="entity-transfer-tips"></small> -->
          </div>
          <div>
            <div class="checkbox-custom checkbox-primary">
              <input type="checkbox" name="customer-transfer-deal" id="customer-transfer-deal" value="1">
              <label for="customer-transfer-deal">同时转移客户名下的销售机会</label>
            </div>
            <div class="checkbox-custom checkbox-primary">
              <input type="checkbox" name="customer-transfer-contract" id="customer-transfer-contract" value="1">
              <label for="customer-transfer-contract">同时转移客户名下的合同</label>
            </div>
          </div>
          <div>提示：不是自己负责的客户转移无效</div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="transfer-entity-btn" type="button" data-name="customer">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="transferCommonCustomerModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">转移到公海</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-transfer-customer">
          <div class="form-group">
            <label class="control-label" for="customer-publicGroupId">公海</label>
<!--             <select class="form-control select2-hidden-accessible" name="customer-publicGroupId" id="customer-publicGroupId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true"> -->
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-publicGroupId-container"><span class="select2-selection__rendered" id="select2-customer-publicGroupId-container"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>  -->
          </div>
          <div>提示：公海中的客户数据只能查看，无法修改</div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="transfer-common-customer-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="shareModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">共享客户</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-share-entity">
        	
          <div class="form-group">
            <label class="control-label" for="entity-shareUserId">共享同事</label>
            <input type="text"  class="form-control" value="" id="entity-shareUserId-tips">
<!--             <select class="form-control select2-hidden-accessible" name="entity-shareUserId" id="entity-shareUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" multiple="" tabindex="-1" aria-hidden="true"> -->
<!--               <option value="QVtaSg==">孙伟</option> -->
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"> -->
<!--             <ul class="select2-selection__rendered"> -->
<!--               <li class="select2-search select2-search--inline"> -->
<!--                 <input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="none" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"> -->
<!--               </li> -->
<!--             </ul> -->
<!--             </span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> <small class="help-block" id="entity-shareUserId-tips"></small> </div> -->
<!--           <div class="clearfix"> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="entity-share-radio" id="entity-share-add" checked="checked" value="1"> -->
<!--               <label for="entity-share-add" data-container="#shareModal" data-tooltip="tooltip" data-original-title="新增加共享同事" data-placement="bottom">新增</label> -->
<!--             </div> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="entity-share-radio" id="entity-share-replace" value="2"> -->
<!--               <label for="entity-share-replace" data-container="#shareModal" data-tooltip="tooltip" data-original-title="将原来共享的同事替换为新的同事" data-placement="bottom">替换</label> -->
<!--             </div> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="entity-share-radio" id="entity-share-remove" value="3"> -->
<!--               <label for="entity-share-remove" data-container="#shareModal" data-tooltip="tooltip" data-original-title="从原有共享同事中删除本次选择同事" data-placement="bottom">移除</label> -->
<!--             </div> -->
          </div>
          <div>提示：不是自己负责的客户共享无效</div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="share-entity-btn" type="button" data-name="customer">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<!-- <div class="modal fade" id="shareSingleModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1"> -->
<!--   <div class="modal-dialog modal-center"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button> -->
<!--         <h4 class="modal-title">共享客户</h4> -->
<!--       </div> -->
<!--       <div class="modal-body padding-horizontal-20"> -->
<!--         <form id="form-share-single-entity"> -->
<!--           <div class="form-group"> -->
<!--             <label class="control-label" for="deal-single-shareUserId">共享同事</label> -->
<!--             <select class="form-control select2-hidden-accessible" name="entity-single-shareUserId" id="entity-single-shareUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" multiple="" tabindex="-1" aria-hidden="true"> -->
<!--               <option value="QVtaSg==">孙伟</option> -->
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"> -->
<!--             <ul class="select2-selection__rendered"> -->
<!--               <li class="select2-search select2-search--inline"> -->
<!--                 <input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="none" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"> -->
<!--               </li> -->
<!--             </ul> -->
<!--             </span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div> -->
<!--         </form> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button class="btn btn-primary" id="share-single-entity-btn" type="button" data-name="customer">确定 </button> -->
<!--         <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<div class="modal fade" id="changeNextContactDateModal" aria-hidden="true" data-backdrop="static" data-keyboard="false" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">设置下次联系时间</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-changeNextContactDate-entity">
          <div class="form-group">
            <label class="control-label" for="entity-changeNextContactDate">下次联系时间</label>
            <input class="form-control" id="entity-changeNextContactDate" name="entity-changeNextContactDate" data-plugin="datetimepicker" value="">
            <small class="help-block" id="entity-changeNextContactDate-tips"></small> </div>
        </form>
        <div>提示：已转移到公海的客户操作无效</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="entity-changeNextContactDate-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="changeCategoryModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">修改客户分类</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-changeCategory-customer">
          <div class="form-group">
            <label class="control-label" for="customer-changeCategory">客户分类</label>
            <select class="form-control select2-hidden-accessible" name="customer-changeCategory" id="customer-changeCategory" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
              <option value="0">无分类</option>
              <option value="A">A(重点客户)</option>
              <option value="B">B(普通客户)</option>
              <option value="C">C(低价值客户)</option>
            </select>
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer-changeCategory-container"><span class="select2-selection__rendered" id="select2-customer-changeCategory-container" title="无分类">无分类</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>  -->
          </div>
          <div>提示：已转移到公海的客户操作无效</div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="customer-changeCategory-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<!-- <div class="modal fade" id="changeTagModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1"> -->
<!--   <div class="modal-dialog modal-center"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button> -->
<!--         <h4 class="modal-title">修改客户标签</h4> -->
<!--       </div> -->
<!--       <div class="modal-body padding-horizontal-20"> -->
<!--         <form id="form-changeTag-customer"> -->
<!--           <div class="form-group"> -->
<!--             <label class="control-label" for="customer-changeTag">标签</label> -->
<!--             <select class="form-control select2-hidden-accessible" name="customer-changeTag" id="customer-changeTag" data-plugin="select2" data-language="zh-CN" data-width="100%" multiple="" tabindex="-1" aria-hidden="true"> -->
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"> -->
<!--             <ul class="select2-selection__rendered"> -->
<!--               <li class="select2-search select2-search--inline"> -->
<!--                 <input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="none" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"> -->
<!--               </li> -->
<!--             </ul> -->
<!--             </span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div> -->
<!--         </form> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button class="btn btn-primary" id="customer-changeTag-btn" type="button">确定</button> -->
<!--         <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<div class="modal fade" id="batchChangeTagModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">修改客户标签</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-batchChangeCustomerTag">
        <div class="form-group">
            <label class="control-label" for="customer-changeCategory">客户分类</label>
            <select class="form-control select2-hidden-accessible" name="customer-batchChangeTagId" id="customer-batchChangeTagId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
              <option value="0">未成交</option>
              <option value="1">已成交</option>
              <option value="2">即将转移到公海</option>
            </select>
        </div>
        <div>提示：已转移到公海的客户操作无效</div>
<!--           <div class="form-group"> -->
<!--             <label class="control-label" for="customer-batchChangeTagId">标签</label> -->
<!--             <select class="form-control select2-hidden-accessible" name="customer-batchChangeTagId" id="customer-batchChangeTagId" data-plugin="select2" data-language="zh-CN" data-width="100%" multiple="" tabindex="-1" aria-hidden="true"> -->
<!--             </select> -->
<!--             <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"> -->
<!--             <ul class="select2-selection__rendered"> -->
<!--               <li class="select2-search select2-search--inline"> -->
<!--                 <input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="none" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"> -->
<!--               </li> -->
<!--             </ul> -->
<!--             </span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> <small class="help-block" id="customer-batchChangeTag-tips"></small> </div> -->
<!--           <div class="clearfix"> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="customer-batchChangeTag-radio" id="customer-batchChangeTag-add" checked="checked" value="1"> -->
<!--               <label for="customer-batchChangeTag-add" data-container="#batchChangeTagModal" data-tooltip="tooltip" data-original-title="新增加标签" data-placement="bottom">新增</label> -->
<!--             </div> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="customer-batchChangeTag-radio" id="customer-batchChangeTag-replace" value="2"> -->
<!--               <label for="customer-batchChangeTag-replace" data-container="#batchChangeTagModal" data-tooltip="tooltip" data-original-title="将原来的标签替换为新的标签" data-placement="bottom">替换</label> -->
<!--             </div> -->
<!--             <div class="radio-custom radio-primary pull-left padding-horizontal-20"> -->
<!--               <input type="radio" name="customer-batchChangeTag-radio" id="customer-batchChangeTag-remove" value="3"> -->
<!--               <label for="customer-batchChangeTag-remove" data-container="#batchChangeTagModal" data-tooltip="tooltip" data-original-title="从原有的标签中删除本次选择标签" data-placement="bottom">移除</label> -->
<!--             </div> -->
<!--           </div> -->
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="customer-batchChangeTag-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="addUpdateTaskModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title" id="task-Modal-title">创建任务提醒</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="form-addUpdate-task">
          <input type="hidden" value="" id="task-id">
          <div class="form-group">
            <label class="control-label required" for="task-remark">提醒内容</label>
            <input class="form-control" id="task-remark" name="task-remark" data-field-required="true" value="">
            <small class="help-block"></small> </div>
          <div class="form-group">
            <label class="control-label required" for="task-startDate">开始时间</label>
            <input class="form-control" id="task-startDate" data-plugin="datetimepicker" name="task-startDate" data-field-required="true" value="">
            <small class="help-block"></small> </div>
          <div class="form-group">
            <label class="control-label" for="task-remindAmount">提醒时间</label>
            <select class="form-control select2-hidden-accessible" name="task-remindAmount" id="task-remindAmount" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
              <option value="0">准时</option>
              <option value="5">提前5分钟</option>
              <option value="15">提前15分钟</option>
              <option value="30">提前30分钟</option>
              <option value="60">提前1个小时</option>
              <option value="120">提前2个小时</option>
              <option value="1440">提前1天</option>
            </select>
            <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-task-remindAmount-container"><span class="select2-selection__rendered" id="select2-task-remindAmount-container" title="准时">准时</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div>
          <div class="form-group">
            <label class="control-label" for="task-ownerUserId">负责人</label>
            <select class="form-control select2-hidden-accessible" name="task-ownerUserId" id="task-ownerUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
              <option value="QVtaSg==" selected="selected">孙伟</option>
            </select>
            <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-task-ownerUserId-container"><span class="select2-selection__rendered" id="select2-task-ownerUserId-container" title="孙伟">孙伟</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="addUpdate-task-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exportModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1" data-totalnum="0">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">导出客户</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <h5>合计导出数量：<span id="export-total-num"></span></h5>
        <ul id="export-list">
        </ul>
      </div>
      <div class="modal-footer"> <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">关闭</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="importModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title" id="importModal-title">导入客户</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <div class="pearls pearls-xs row">
          <div class="pearl current col-md-4" id="pearls-step-1"> <span class="pearl-number">1</span> <span class="pearl-title">上传文件</span> </div>
          <div class="pearl col-md-4" id="pearls-step-2"> <span class="pearl-number">2</span> <span class="pearl-title">开始导入</span> </div>
          <div class="pearl col-md-4" id="pearls-step-3"> <span class="pearl-number">3</span> <span class="pearl-title">导入完成</span> </div>
        </div>
        <div id="import-step-1-container">
          <form class="form-horizontal padding-right-30" id="form-import-entity">
            <input type="hidden" value="1" id="entity-import-visible">
            <div class="form-group">
              <label class="col-sm-3 control-label" for="entity-import-fileupload">上传文件</label>
              <div class="col-sm-9"> <span id="entity-import-fileupload-container" style="position: relative;">
                <button id="entity-import-fileupload" type="button" data-fileitem="" class="btn btn-success btn-sm icon iconfont icon-plus" style="z-index: 1;"> 上传文件 </button>
                <div id="html5_1cn12r5c3d8u1ttv1s33361gmd4_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 0px; height: 0px; overflow: hidden; z-index: 0;">
                  <input id="html5_1cn12r5c3d8u1ttv1s33361gmd4" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" accept=".xls,.xlsx" tabindex="-1">
                </div>
                </span>
                <div id="entity-import-upload-attachments" class="upload-attachments padding-top-10">
                  <div class="upload-attachment-item hide" id="entity-import-upload-attachment-item-clone"> <i class="icon iconfont icon-attachment"></i> <span class="file-name padding-right-5"></span>(<span class="file-size"></span>) <span class="file-progress padding-left-10"></span> <a href="#" class="file-remove-link">删除</a> </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="entity-import-ownerUserId">负责人</label>
              <div class="col-sm-9">
                <select class="form-control select2-hidden-accessible" name="entity-import-ownerUserId" id="entity-import-ownerUserId" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
                  <option value="QVtaSg==" selected="selected">孙伟</option>
                </select>
                <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-entity-import-ownerUserId-container"><span class="select2-selection__rendered" id="select2-entity-import-ownerUserId-container" title="孙伟">孙伟</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">导入模板</label>
              <div class="col-sm-9 control-value"> <a href="/customer/import/template" id="link_templateUrl" target="_blank"><i class="icon iconfont icon-download"></i> 下载导入模板</a> </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">说明</label>
              <div class="col-sm-9 control-value">每次导入上限为3000条，导入大量数据的情况下，请分批导入</div>
            </div>
            <div class="form-group hide">
              <label class="col-sm-3 control-label" for="entity-upload-type">重复数据</label>
              <div class="col-sm-9">
                <div class="radio-custom radio-primary pull-left padding-horizontal-20">
                  <input type="radio" name="entity-upload-type" id="entity-upload-type-skip" checked="checked" value="1">
                  <label for="entity-upload-type-skip" data-container="form#form-import-entity" data-tooltip="tooltip" data-original-title="重复数据不处理" data-placement="bottom">忽略</label>
                </div>
                <div class="radio-custom radio-primary pull-left padding-horizontal-20">
                  <input type="radio" name="entity-upload-type" id="entity-upload-type-replace" value="2">
                  <label for="entity-upload-type-replace" data-container="form#form-import-entity" data-tooltip="tooltip" data-original-title="直接覆盖导入数据" data-placement="bottom">覆盖</label>
                </div>
                <div class="radio-custom radio-primary pull-left padding-horizontal-20">
                  <input type="radio" name="entity-upload-type" id="entity-upload-type-add" value="3">
                  <label for="entity-upload-type-add" data-container="form#form-import-entity" data-tooltip="tooltip" data-original-title="补齐没有值的字段" data-placement="bottom">补齐</label>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div id="import-step-2-container" class="hide">
          <form class="form-horizontal padding-right-30">
            <div class="form-group">
              <label class="col-sm-3 control-label">导入进度</label>
              <div class="col-sm-9 control-value">
                <div class="progress" role="progressbar" data-goal="100" id="entity-import-progress" aria-valuenow="0">
                  <div class="progress__bar" style="width: 0%;"></div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">总数量</label>
              <div class="col-sm-9 control-value" id="import-totalNum"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">成功导入数量</label>
              <div class="col-sm-9 control-value" id="import-successNum"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">导入失败数量</label>
              <div class="col-sm-9 control-value" id="import-failedNum"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-12 control-value padding-left-40">提示：导入过程中请不要关闭该窗口</label>
            </div>
          </form>
          <iframe width="0px" height="0px" class="hide" id="import-iframe" name="import-iframe" src="about:blank"></iframe>
        </div>
        <div id="import-step-3-container" class="hide">
          <h4 class="text-center">导入完成</h4>
          <form class="form-horizontal padding-right-30">
            <div class="form-group">
              <label class="col-sm-3 control-label">总数量</label>
              <div class="col-sm-9 control-value" id="import-totalNum2"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">成功导入数量</label>
              <div class="col-sm-9 control-value" id="import-successNum2"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">导入失败数量</label>
              <div class="col-sm-9 control-value" id="import-failedNum2"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">导出详细</label>
              <div class="col-sm-9 control-value"> <a href="#" target="_blank" id="import-result-excel-link"><i class="icon iconfont icon-download"></i> 下载导入结果详细</a></div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer"> <span id="entity-import-tips" class="text-danger padding-right-20"></span>
        <button class="btn btn-primary" id="entity-import-btn" type="button">导入</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">关闭</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="importHistoryRecordModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">导入历史查询</h4>
      </div>
      <div class="modal-body padding-bottom-20">
        <form class="form-inline padding-horizontal-10" id="entity-import-history-form">
          <div class="form-group">
            <label class="control-label padding-right-10" for="import-history-ownerUserId">员工</label>
            <select class="form-control select2-hidden-accessible" name="import-history-ownerUserId" id="import-history-ownerUserId" data-plugin="select2" data-language="zh-CN" style="width:180px;" tabindex="-1" aria-hidden="true">
              <option value="">全部</option>
              <option value="QVtaSg==">孙伟</option>
            </select>
            <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 180px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-import-history-ownerUserId-container"><span class="select2-selection__rendered" id="select2-import-history-ownerUserId-container" title="全部">全部</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div>
          <div class="form-group padding-left-10">
            <label class="control-label padding-right-10" for="import-history-createDate">导入时间</label>
            <div class="input-group input-daterange" id="import-history-createDate">
              <input type="text" class="form-control" value="" name="import-history-startCreateDate" id="import-history-startCreateDate">
              <div class="input-group-addon">到</div>
              <input type="text" class="form-control" value="" name="import-history-endCreateDate" id="import-history-endCreateDate">
            </div>
          </div>
          <div class="form-group padding-left-10">
            <button type="submit" class="btn btn-success btn-sm">搜索</button>
          </div>
        </form>
        <div class="table-responsive page-content-table padding-horizontal-10 padding-top-20">
          <table class="table table-pointer table-hover" id="import-history-table">
            <thead>
              <tr>
                <th class="cell-80">编号</th>
                <th class="cell-100">数据类型</th>
                <th class="cell-100">负责人</th>
                <th class="cell-100">成功数</th>
                <th class="cell-100">失败数</th>
                <th class="cell-100">导入员工</th>
                <th class="cell-180">导入时间</th>
                <th class="cell-120">下载</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="import-history-body">
              <tr id="import-history-item-clone" class="hide">
                <td class="item-idx"></td>
                <td class="item-type"></td>
                <td class="item-owner"></td>
                <td class="item-successNum"></td>
                <td class="item-failedNum"></td>
                <td class="item-createUser"></td>
                <td class="item-createDate"></td>
                <td><a type="button" class="btn btn-sm btn-icon btn-flat btn-default btn-download" target="_blank" href="#" data-tooltip="tooltip" data-original-title="下载"> <i class="icon iconfont icon-download" aria-hidden="true"></i> </a></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="pagination">
          <div class="page-bottom" id="import-history-item-pageNavi"></div>
        </div>
        <div class="loading" id="import-history-search-loading">
          <div class="liner">
            <h3>加载中...</h3>
            <img alt="加载中" src="/images/dots-white.gif"> </div>
        </div>
        <div id="import-history-blank" class="loading">
          <div class="liner">
            <h3>没有找到相关导入记录</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="contactModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content"></div>
  </div>
</div>
<div class="modal fade" id="dealModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content"></div>
  </div>
</div>
<div class="modal fade" id="contractModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content"></div>
  </div>
</div>
<div class="modal fade" id="paymentModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content"></div>
  </div>
</div>
<div class="modal fade" id="invoiceModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content"></div>
  </div>
</div>
<div class="modal fade" id="updateNoteModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">修改跟进记录</h4>
      </div>
      <div class="modal-body padding-horizontal-20"> </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="update-note-btn" type="button">确定</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="customerPhoneModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">拨打电话</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <div class="media">
          <div class="media-left"><i class="icon iconfont icon-company font-size-40"></i></div>
          <div class="media-body padding-left-10">
            <h4 class="media-heading"></h4>
          </div>
        </div>
        <div class="padding-20" id="customerPhoneModal-container"></div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="smsModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">发送短信</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <form id="sms-form">
          <div class="form-group">
            <label class="control-label" for="sms-mobiles">发送对象(合计:<span id="sms-mobiles-num">0</span>)</label>
            <div>
              <input type="text" class="form-control" id="sms-mobiles" value="">
              <small class="help-block" id="sms-mobiles-tips"></small> </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="sms-template">短信模版</label>
            <div>
              <select class="form-control select2-hidden-accessible" id="sms-template" data-plugin="select2" data-language="zh-CN" data-width="100%" tabindex="-1" aria-hidden="true">
                <option value="">请选择短信模版</option>
              </select>
              <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-sms-template-container"><span class="select2-selection__rendered" id="select2-sms-template-container" title="请选择短信模版">请选择短信模版</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span> </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="sms-preview">短信预览</label>
            <div id="sms-preview"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer"> 剩余短信数: <span id="sms-surplus" class="red-600 padding-right-10">0</span>
        <button class="btn btn-primary" id="send-sms-btn" type="button">发送</button>
        <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">取消</a> </div>
    </div>
  </div>
</div>
<div class="modal fade" id="duplicateSearchModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">撞单查询</h4>
      </div>
      <div class="modal-body padding-bottom-20">
        <form class="form-horizontal" id="form-duplicate-customer">
          <div class="form-group padding-horizontal-20"> <span>
            <label class="col-sm-1 control-label padding-bottom-10" for="duplicate-item-name">客户名</label>
            <div class="col-sm-5 padding-bottom-10">
              <input class="form-control" id="duplicate-item-name" name="duplicate-item-name" value="">
            </div>
            </span>
            <div class="col-sm-12 padding-left-10">
              <button class="btn btn-primary" id="duplicate-search-btn" type="button">搜索</button>
            </div>
          </div>
        </form>
        <div class="table-responsive page-content-table padding-horizontal-10">
          <table class="table table-pointer table-hover" id="duplicate-list-table">
            <thead>
              <tr>
                <th class="cell-250">客户名</th>
                <th class="cell-200">客户分类</th>
                <th class="cell-120">客户类型</th>
                <th class="cell-120">客户所属</th>
                <th class="cell-180">分配时间</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="duplicate-body">
              <tr id="duplicate-item-clone" class="hide">
                <td class="item-name"></td>
                <td class="item-category"></td>
                <td class="item-type"></td>
                <td class="item-ownerUser"></td>
                <td class="item-assignDate"></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="recordModal" aria-hidden="true" role="dialog" data-backdrop="static" data-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
        <h4 class="modal-title">通话录音</h4>
      </div>
      <div class="modal-body padding-horizontal-20">
        <div id="recordModal-audio" class="padding-vertical-20"></div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  /*<![CDATA[*/
  var _visible = 1;
  var _searchType = 0;
  var _loginUserId = "QVtaSg==";
  var _pageSize = 10;

  var _customerCategories = [{"id":124681,"name":"A(\u91CD\u70B9\u5BA2\u6237)","color":"#000000"},{"id":124682,"name":"B(\u666E\u901A\u5BA2\u6237)","color":"#000000"},{"id":124683,"name":"C(\u4F4E\u4EF7\u503C\u5BA2\u6237)","color":"#000000"}];
  var _noteCategories = [{"id":124684,"name":"\u7535\u8BDD","color":"#000000"},{"id":124685,"name":"QQ","color":"#000000"},{"id":124686,"name":"\u5FAE\u4FE1","color":"#000000"},{"id":124687,"name":"\u4F1A\u8BAE","color":"#000000"},{"id":124688,"name":"\u4E0A\u95E8\u62DC\u8BBF","color":"#000000"}];
  var _customerTags = [];
  var _users = [{"name":"\u5B59\u4F1F","imgPath":"images/adminimg.png","valid":true,"encodedGroupId":"","encodedId":"QVtaSg=="}];
  var _searchUsers = [{"name":"\u5B59\u4F1F","imgPath":"images/adminimg.png","valid":true,"encodedGroupId":"","encodedId":"QVtaSg=="}];

  var _targetType = 2;
  var _targetId = "";

  //部门信息
  var _groups = [];
  var _commonCustomerGroups = [];
  var _showFieldIds = "tag,ownerUser,category,province,city,nextContactDate,createDate,createUser,assignDate,lastContactDate,lastContactUser,lastRemark";
  var _sortField = "";
  var _sortOrder = 0;
  var _hideCustomerDetail = false;
  var _intervalDays = 0;

  var _fields = [{"id":124558,"name":"\u624B\u673A","required":false,"phoneField":true,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":4},{"id":124559,"name":"\u5EA7\u673A","required":false,"phoneField":true,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":4},{"id":124560,"name":"\u90AE\u7BB1","required":false,"phoneField":false,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":5},{"id":124561,"name":"QQ","required":false,"phoneField":false,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":6},{"id":124562,"name":"\u5B98\u7F51","required":false,"phoneField":false,"extend":true,"defaultShow":false,"wxfield":false,"descriptionIntValue":7},{"id":124563,"name":"\u5730\u5740","required":false,"phoneField":false,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":1},{"id":124564,"name":"\u7B80\u4ECB","required":false,"phoneField":false,"extend":true,"defaultShow":true,"wxfield":false,"descriptionIntValue":2}];

  // 销售机会阶段
  var _dealPhases = [{"id":124693,"name":"\u9700\u6C42\u63D0\u6848","color":"#000000"},{"id":124694,"name":"\u6295\u6807","color":"#000000"},{"id":124695,"name":"\u5546\u52A1\u8C08\u5224","color":"#000000"},{"id":124696,"name":"\u8D62\u5355","color":"#000000"}];

  var _isSinglePage = false;

  $(function () {
    var _guide = Cookies.get('guide');
    if ("1" == _guide) {
      Cookies.set('guide', '1', { expires: 365 });
    } else {
      Cookies.set('guide', '1', { expires: 365 });
      introJs().setOptions({'nextLabel': '下一条', 'prevLabel': '上一条', 'skipLabel': '<i class="icon iconfont icon-close"></i>', 'doneLabel': '<i class="icon iconfont icon-close"></i>' }).start();
    }
  });
  /*]]>*/
</script>
<link rel="stylesheet" href="css/vendor/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/vendor/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="css/vendor/bootstrap-select2.min.css">
<link rel="stylesheet" href="css/vendor/slidePanel.min.css">
<link rel="stylesheet" href="css/vendor/bootstrap-editable.min.css?">
<link rel="stylesheet" href="css/vendor/magnific-popup.min.css">
<link rel="stylesheet" href="css/vendor/audioplayer.css">
<link rel="stylesheet" href="css/vendor/introjs.min.css">
<script type="text/javascript" src="script/vendor/moment.min.js"></script> 
<script type="text/javascript" src="script/vendor/bootstrap-datepicker.min.js"></script> 
<script type="text/javascript" src="script/vendor/bootstrap-datetimepicker.min.js"></script> 
<script type="text/javascript" src="script/vendor/bootstrap-select2.min.js"></script> 
<script type="text/javascript" src="script/vendor/jquery-slidePanel.min.js"></script> 
<script type="text/javascript" src="script/vendor/bootstrap-editable.min.js"></script> 
<script type="text/javascript" src="script/vendor/plupload.full.min.js"></script> 
<script type="text/javascript" src="script/vendor/jquery.magnific-popup.min.js"></script> 
<script type="text/javascript" src="script/vendor/table-dragger.min.js"></script> 
<script type="text/javascript" src="script/vendor/audioplayer.min.js"></script> 
<script type="text/javascript" src="script/vendor/intro.min.js"></script> 
<script type="text/javascript" src="script/vendor/js.cookie.js"></script> 
<script type="text/javascript" src="script/uploader.js"></script> 
<script type="text/javascript" src="script/importExport.js"></script> 
<script type="text/javascript" src="script/customer.js"></script> 
<script type="text/javascript" src="script/customer-list.js"></script> 
<script type="text/javascript" src="script/importHistory-list.js"></script> 
<script type="text/javascript" src="script/area.js"></script> 
<script type="text/javascript" src="script/pageNavi.js"></script> 
<script type="text/javascript" src="script/sms.js"></script>
</body>
</html>