<#include "../include/meta.ftl"/>
<article class="cl pd-20">
	<form action="/child/child/add" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(child.id)!}" placeholder="" id="id" name="id">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${(child.nickname)!}" placeholder="" id="username" name="nickname">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="password" name="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="rePassword">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="sex" type="radio" id="sex-1" value="男" checked>
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" name="sex" value="女">
                    <label for="sex-2">女</label>
                </div>
            </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(child.phone)!}" placeholder="" id="phone" name="phone">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">班级：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select valid" size="1" name="classId">
					<option value="">--请选择班级--</option>
					<#list classList as class>
						<#if (child.classId)?? && child.classId == class.id>
						    <option value="${class.id}" selected="selected">${class.name}</option>
						<#else>
					    	<option value="${class.id}">${class.name}</option>
						</#if>
					</#list>
				</select>
				</span> </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">生日：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" name="birthday" onfocus="WdatePicker({maxDate:'#F{\'%y-%M-%d\'}'})" value="${(child.birthday?date)!}" id="datemin" class="input-text Wdate">
			</div>
                <#--<input type="text" name="maxAddTime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${(childCondition.maxAddTime?date)!}"  id="datemax" class="input-text Wdate" style="width:120px;">			</div>-->
		</div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="${(child.addr)!}" name="addr" id="addr">
                </div>
            </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="desc" cols="" rows="" class="textarea"  placeholder="说点什么...">${(child.desc)!}</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<#include "../include/footer.ftl"/>
<#include "../include/jquery.validation.ftl"/>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
            id:{
				required:true,
				minlength:11,
				maxlength:11
			},
			password:{
                required:true,
			},
			rePassword:{
                required:true,
                equalTo: "#password"
			},
            username:{
                required:true,
            },
			sex:{
				required:true,
			},
            phone:{
				required:true,
				isMobile:true,
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$.post("/child/child/add", $(form).serialize(), function (data){
						if(data.status){
                            layer.msg("修改成功",{time:1000});
							var index = parent.layer.getFrameIndex(window.name);
							parent.$('.btn-refresh').click();
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