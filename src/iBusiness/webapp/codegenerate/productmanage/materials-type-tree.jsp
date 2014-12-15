<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
    <!--
	var setting = {
    		// 采用异步方式获取子节点数据,默认false  
    		async: {
    			enable: true,
    			url: "${scopePrefix}/materials_type/materials-type-tree.do"
    		},
			view: {selectedMulti: false},
			edit: {enable: true, showRemoveBtn: false, showRenameBtn: false},
			data: {
				keep: {parent:true, leaf:true},
				simpleData: {enable: true}
			},
			callback: {beforeDrag: beforeDrag, 
				beforeRemove: beforeRemove, 
				beforeRename: beforeRename,
				onRemove: onRemove}
	};

	var zNodes =[
	];
	var log, className = "dark";
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}
	function onRemove(e, treeId, treeNode) {
		showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	}
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
		return true;
	}
	function showLog(str) {
		if (!log) log = $("#log");
		log.append("<li class='"+className+"'>"+str+"</li>");
		if(log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		}
	}
	function getTime() {
		var now= new Date(),
		h=now.getHours(),
		m=now.getMinutes(),
		s=now.getSeconds(),
		ms=now.getMilliseconds();
		return (h+":"+m+":"+s+ " " +ms);
	}

	var newCount = 1;
	// 添加父节点, 子节点
	function add(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		isParent = e.data.isParent,
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		
		alert("treeNode:"+treeNode);
		if (treeNode) {
			treeNode = zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, isParent:isParent, name:"new node" + (newCount++)});
		} else {
			treeNode = zTree.addNodes(null, {id:(100 + newCount), pId:0, isParent:isParent, name:"new node" + (newCount++)});
		}
		if (treeNode) {
			zTree.editName(treeNode[0]);
		} else {
			alert("叶子节点被锁定，无法增加子节点");
		}
	};
	// 编辑
	function edit() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		zTree.editName(treeNode);
	};
	// 删除
	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		var callbackFlag = $("#callbackTrigger").attr("checked");
		zTree.removeNode(treeNode, callbackFlag);
	};
	// 清空子节点
	function clearChildren(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0 || !nodes[0].isParent) {
			alert("请先选择一个父节点");
			return;
		}
		zTree.removeChildNodes(treeNode);
	};
	
	$(document).ready(function(){
		// 
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$("#addParent").bind("click", {isParent:true}, add);
		$("#addLeaf").bind("click", {isParent:false}, add);
		$("#edit").bind("click", edit);
		$("#remove").bind("click", remove);
		$("#clearChildren").bind("click", clearChildren);
	});

    </script>
  </head>

  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10">
	<!-- 查询条件 -->
	   <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
		        <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
		        <a id="addParent" href="#" title="增加父节点" onclick="return false;" class="btn btn-default btn-sm">增加父节点</a>
		        <a id="addLeaf" href="#" title="增加叶子节点" onclick="return false;" class="btn btn-default btn-sm">增加叶子节点</a>
		        <a id="edit" href="#" title="编辑名称" onclick="return false;" class="btn btn-default btn-sm">编辑名称</a>
		        <a id="remove" href="#" title="删除节点" onclick="return false;" class="btn btn-default btn-sm">删除节点</a>
		        <a id="clearChildren" href="#" title="清空子节点" onclick="return false;" class="btn btn-default btn-sm">清空子节点</a>
			</div>
		    <div class="m-clear"></div>
	   </div>
	   <div class="content">
			    <div class="col-lg-2">
				    <div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree"></ul>
					</div>
				</div>
	  </div>
	  </div>
	<!-- end of main -->
	</div>
  </body>
</html>
