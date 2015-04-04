<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/center.jsp"%>
    <!-- tree -->
    <link rel="stylesheet" href="${ctx}/plugin/ztree/zTreeStyle/zTreeStyle.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/plugin/ztree/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/ibusiness/flowchart/js/uuid.js"></script>
    <script type="text/javascript">
    <!--
	var setting = {
    		// 采用异步方式获取子节点数据,默认false  
    		async: {
    			enable: true,
    			url: "${ctx}/deviceTypeTree/show-tree.do",
    			// 通过autoParam指定查询时要提交父节点的哪些属性作为查询条件
    			autoParam:["id"],
    		},
    		// 是否同时选择多个节点
			view: {selectedMulti: false 
			},
			edit: {enable: true, showRemoveBtn: false, showRenameBtn: false},
			data: {
				keep: {parent:true, leaf:true},
				simpleData: {enable: true}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove
			}
	};

	var zNodes =[
	];
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "":"dark");
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}
	function onRemove(e, treeId, treeNode) {
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

	// 添加父节点, 子节点
	function add(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var isParent = e.data.isParent;
		var nodes = zTree.getSelectedNodes();
		var treeNode = nodes[0];
		
		if (treeNode) {
			// 在指定节点下创建文件夹或者叶子节点
			treeNode = zTree.addNodes(treeNode, {id:(Math.uuid()), pId:treeNode.id, isParent:isParent, name:"new node"});
		} else {
			// 创建一个根节点
			treeNode = zTree.addNodes(null, {id:(Math.uuid()), pId:0, isParent:isParent, name:"new node"});
		}
		if (treeNode) {
			zTree.editName(treeNode[0]);
		} else {
			alert("叶子节点被锁定，无法增加子节点");
		}
	};
	// 编辑
	function edit() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = zTree.getSelectedNodes();
		var treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		zTree.editName(treeNode);
	};
	// 删除
	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = zTree.getSelectedNodes();
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		var treeNode = nodes[0];
		var callbackFlag = $("#callbackTrigger").attr("checked");
		zTree.removeNode(treeNode, callbackFlag);
		$.ajax({
			url: "${ctx}/deviceTypeTree/remove-tree.do",
			data: {
				id : treeNode.id
    		},
			success:function(responseText){
				alert("删除成功"+responseText);
			}
		});
	};
	// 提交保存
	function saveTree() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var nodesArray = zTree.transformToArray(zTree.getNodes());
		var jsonStr = JSON.stringify(zTree.getNodes());
		jsonStr = encodeURI(jsonStr , "utf-8");
		$.ajax({
			url: "${ctx}/deviceTypeTree/save-tree.do",
			data: {
				nodes : jsonStr
    		},
			success:function(responseText){
				alert("保存成功"+responseText);
			}
		});
	};

	// 自动加载
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$("#addParent").bind("click", {isParent:true}, add);
		$("#addLeaf").bind("click", {isParent:false}, add);
		$("#edit").bind("click", edit);
		$("#remove").bind("click", remove);
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
	   <div class="panel-heading"><h4 class="panel-title">物料类型树列表</h4></div>
	   <div class="panel-body">
	       <div class="pull-left">
		        <button id="submitButton" class="btn btn-default btn-sm" onclick="saveTree()" >保存</button>
		        <a id="addParent" href="#" title="增加父节点" onclick="return false;" class="btn btn-default btn-sm">增加父节点</a>
		        <a id="addLeaf" href="#" title="增加叶子节点" onclick="return false;" class="btn btn-default btn-sm">增加叶子节点</a>
		        <a id="edit" href="#" title="编辑名称" onclick="return false;" class="btn btn-default btn-sm">编辑名称</a>
		        <a id="remove" href="#" title="删除节点" onclick="return false;" class="btn btn-default btn-sm">删除节点</a>
			</div>
        </div>
        <div class="content">
		        <div class="form-group">
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
