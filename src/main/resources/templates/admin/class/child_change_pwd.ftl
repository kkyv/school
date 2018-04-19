<#include "../include/meta.ftl"/>
<article class="cl pd-20">
	<form action="/child/child/edit" method="post" class="form form-horizontal" id="form-change-password">
		<input type="hidden" value="${child.id}"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${child.nickname} </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="password" id="password">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword2" id="new-password2">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<#include "../include/footer.ftl"/>
<#include "../include/jquery.validation.ftl"/>
<script type="text/javascript">
$(function(){
	$("#form-change-password").validate({
		rules:{
			password:{
				required:true,
			},
			newpassword2:{
				required:true,
				equalTo: "#password"
			}
		},
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            $.post("/child/child/edit", $(form).serialize(), function (data){
                if(data.status){
                    layer.msg("修改成功",{time:1000});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    layer.msg("添加失败",{time:1500});
                }
            });
        }
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>