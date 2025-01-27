<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>相册管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/star/starAlbum/">相册列表</a></li>
		<li class="active"><a href="${ctx}/star/starAlbum/form?id=${starAlbum.id}">相册<shiro:hasPermission name="star:starAlbum:edit">${not empty starAlbum.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="star:starAlbum:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="starAlbum" action="${ctx}/star/starAlbum/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">所属用户：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id" value="${starAlbum.user.id}" labelName="user.name" labelValue="${starAlbum.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">相册名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<script>
			$("#starMessage").adda
		</script>
		<div class="control-group">
			<label class="control-label">所属star：</label>
			<div class="controls">
				<sys:treeselect id="starMessage" name="starIds" value="${starAlbum.starIds}" labelName="starName" labelValue="${fnz:getStarName(starAlbum.starIds)}"
								title="用户" url="/star/starStarmessage/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">相册封面：</label>
			<div class="controls">
				<form:hidden id="url" path="url" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="url" type="images" uploadPath="/star/starPhoto" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图片</label>
			<div class="controls">

				<form:hidden id="photoUrls" path="photoUrls" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photoUrls" type="images" uploadPath="/star/starPhoto" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否公开：</label>
			<div class="controls">
				<form:radiobuttons  path="isShow" items="${fns:getDictList('star_album_isshow')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="star:starAlbum:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>