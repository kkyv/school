<#include "../include/meta.ftl"/>

<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<input value="${(info.id)!}" id="id" type="hidden" name="infoId" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(info.title)!}" placeholder="" id="title" name="title">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="cateGroup" class="select" id="cate_group_select">
					<option value="${info.cateGroup}" selected="selected">${cateGroupMap['${cateGroup}'].name}</option>
					<#--<#list cateGroupMap?keys as key>-->
						<#--<#assign cate = >-->
						<#--<#if cate.firstId = 0>-->
							<#--<#if cate.id != 1 && cate.id != 8>-->
								<#--<#if (info.cateGroup)?? && info.cateGroup == cate.id>-->
								<#--<#else>-->
                                	<#--<option value="${cate.id}">${cate.name}</option>-->
								<#--</#if>-->
							<#--</#if>-->
						<#--</#if>-->
					<#--</#list>-->
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="cateId" class="select" id="cate_select">
					<option value="">---请选择类型---</option>
						<#list cateGroupMap?keys as key>
							<#assign cate = cateGroupMap['${key}']>
							<#if info.cateGroup == cate.firstId>
								<#if (info.id)??>
									<option value="${cate.id}" selected="selected">${cate.name}</option>
								<#else>
									<option value="${cate.id}">${cate.name}</option>
								</#if>
							</#if>
						</#list>
				</select>
				</span>
			</div>
		</div>
		<div style="display: none">
			<#list cateGroupMap?keys as key>
				<#assign cate = cateGroupMap['${key}']>
				<#if cate.firstId != 0>
					<option value="${cate.id}" cateGroup="${cate.firstId}" class="cate_hide">${cate.name}</option>
				</#if>
			</#list>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <div id="div1" class="toolbar" style="border: 1px solid #ccc;">
                </div>
                <div id="div2" class="text" style="width:100%;height:600px;border: 1px solid #ccc;"> <!--可使用 min-height 实现编辑区域自动增加高度-->
					${(info.content)!}
                </div>
			</div>
			<textarea style="display: none" id="content" name="content"></textarea>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_add(1);" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存并发布</button>
				<button onClick="article_add(0);" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
				<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
		<input type="hidden" value="1" name="state"/>
	</form>
</article>
<#include "../include/footer.ftl"/>
<#include "../include/jquery.validation.ftl"/>
<script type="text/javascript" src="/js/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="/js/lib/wangEditor-3.1.1/release/wangEditor.js"></script>
<script type="text/javascript">
$(function(){
    $("#cate_group_select").change(function () {
        var cateGroup = $("#cate_group_select").find("option:selected").val();
        $("#cate_select option").not(":first").remove();
        $("#cate_select").append($(".cate_hide[cateGroup='"+cateGroup+"']"));
    });
	//编辑器
    var E = window.wangEditor;
    var editor = new E('#div1', '#div2');
    //上传配置
    editor.customConfig.uploadImgServer = "/album/uploadImg";
    editor.customConfig.uploadFileName = "img";
    editor.customConfig.uploadImgParams = {
        // 如果版本 <=v3.1.0 ，属性值会自动进行 encode ，此处无需 encode
        // 如果版本 >=v3.1.1 ，属性值不会自动 encode ，如有需要自己手动 encode
        cateGroupName : $("#cate_group_select option:selected").text()
    }
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $("#content").val(html);
    }
    editor.create();
    // 初始化 textarea 的值
    $("#content").val(editor.txt.html())
});

function article_add(state) {
    var title = $("#title").val();
    if(title == ""){
        layer.msg('请先填写标题', {time: 1000});
        return;
	}

    var cateGroup = $("#cate_group_select > option:selected").val();
    if(cateGroup == ""){
        layer.msg('请先选择栏目', {time: 1000});
        return;
    }

    var cate = $("#cate_select > option:selected").val();
    if(cate == ""){
        layer.msg('请先选择分类', {time: 1000});
        return;
    }

    var url;
    if($("#id").val() != ""){
        url = "/info/" + cateGroup + "/edit";
	}else {
        url = "/info/" + cateGroup + "/add";
	}
    $("input[name='state']").val(state);
    $.ajax({
                url: url,
                data: $("form").serialize(),
				type:"POST",
                success: function (data) {
                    if (data.status) {
                        parent.location.reload();
                        removeIframe();
                        layer.msg(data.msg, {time: 1000});
                    } else {
                        layer.msg(data.msg, {time: 1500});
                    }
                }
            }
    );
}

function removeIframe() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}
</script>
</body>
</html>