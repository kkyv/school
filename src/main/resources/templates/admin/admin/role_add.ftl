﻿<#include "../include/meta.ftl"/>

<article class="cl pd-20">
	<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(role.name)!}" placeholder="" id="roleName" name="roleName" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(role.desc)!}" placeholder="" id="" name="">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">网站角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<#list allAccessMap?keys as modelkey>
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="" name="user-Character-0" id="user-Character-0">
							${modelkey}</label>
					</dt>
					<dd>
							<#assign groupAccessMap = allAccessMap['${modelkey}']>
							<#list groupAccessMap?keys as groupKey>
							<dl class="cl permission-list2">
								<dt>
									<label class="">
										<input type="checkbox" value="" name="user-Character-0-0" id="user-Character-0-0">
										${groupKey}</label>
								</dt>
								<dd>
									<#list groupAccessMap['${groupKey}'] as access>
										<label class="">
											<#if (adminAccessList??) && adminAccessList?seq_contains(access.id)>
												<input type="checkbox" checked="checked" value="" name="user-Character-0-0-0" id="user-Character-0-0-0">
											<#else>
												<input type="checkbox" value="${access.id}" name="user-Character-0-0-0" id="user-Character-0-0-0">
											</#if>
											${access.name}</label>
									</#list>
								</dd>
							</dl>
							</#list>
					</dd>
				</dl>
				</#list>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>

<#include "../include/footer.ftl"/>
<script type="text/javascript" src="/js/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/js/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/js/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
	$("#form-admin-role-add").validate({
		rules:{
			roleName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>