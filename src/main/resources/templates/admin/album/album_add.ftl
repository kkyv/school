<#include "../include/meta.ftl"/>
<link href="/js/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

<div class="page-container">
	<form class="form form-horizontal" id="form-album-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>相册名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="cateName" class="select">
					<option>---请选择分类---</option>
					<#list albumNameList as name>
					    <option value="${name}">${name}</option>
					</#list>
                    <#list classList as class>
                        <option value="${class.name}">${class.name}</option>
                    </#list>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="album_add();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>
</div>

<#include "../include/footer.ftl"/>
<script type="text/javascript" src="/js/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript">
    function album_add() {
        $.post("/album/album/add",
                $("#form-album-add").serialize(),
                function (data) {
                    if(data.status){
                        layer.msg("创建成功", {time:1000});
                        location.replace(location.href);
                        layer_close()
                    }else{
                        layer.msg("创建失败", {time:1500});
                    }
                }
        )
    }
</script>
</body>
</html>