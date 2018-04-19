<#include "../include/meta.ftl"/>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>班级名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(class.name)!}" placeholder="" id="" name="name">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">班级公告：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="notice" cols="" rows="" class="textarea"  placeholder="班级公告..." datatype="*10-100" dragonfly="true" >${(class.notice)!}</textarea>
            </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>管理员：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="adminId" class="select">
					<option value="">--请选择管理员--</option>
					<#list adminList as admin>
						<#if (class.adminId)?? && admin.id == class.adminId>
						    <option value="${admin.id}" selected="selected">${admin.nickname}</option>
						<#else>
					    	<option value="${admin.id}">${admin.nickname}</option>
						</#if>
					</#list>
				</select>
				</span> </div>
		</div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="state" class="select">
					<option value="1">开班</option>
					<option value="0">关班</option>
				</select>
				</span>
			</div>
        </div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="class_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
		<input type="hidden" value="${(class.id)!}" name="id"/>
	</form>
</div>

<#include "../include/footer.ftl"/>

<script type="text/javascript">
	function class_save() {
		if($("input[name='name']").val() == ""){
			layer.msg("班级名字不能为空", {time:1000});
			return;
		}

		$.post("/class/manage/add",
				$("form").serialize(),
				function (data) {
                    if(data.status){
                        layer.msg("创建成功", {time:1000});
                        location.reload();
                        layer_close()
                    }else{
                        layer.msg("创建失败", {time:1500});
                    }
                })
    }
</script>
</body>
</html>