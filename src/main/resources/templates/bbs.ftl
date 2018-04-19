<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>

        <link rel="stylesheet" type="text/css" href="/js/lib/bootstrap/bootstrap.css">
        <script type="text/javascript" src="/js/lib/bootstrap/bootstrap.js"></script>

        <style type="text/css">
            .liuyanban
            {
                width: 692px;
                height: 29px;
                padding-left: 60px;
                color: #337d0E;
                line-height: 29px;
                font-weight: bold;
                background-image: url(/img/ly.jpg);
                background-position: 0px -57px;
                background-repeat: no-repeat;
            }
            .lybox
            {
                width: 750px;
                height: 300px;
                border-left: 1px solid #D1FE99;
                border-right: 1px solid #D1FE99;
                border-bottom: 1px solid #D1FE99;
            }
            .lyleft
            {
                width: 110px;
                line-height: 40px;
                height: 40px;
                text-align: right;
            }
            .lyright
            {
                width: 640px;
                height: 40px;
            }
            .lyrarea
            {
                height: 100px;
            }
            .lyrarea textarea
            {
                margin: 10px;
                width: 550px;
                font-size: 12px;
                padding: 5px;
                height: 70px;
                border: 1px solid #dddddd;
            }
            .lyright input
            {
                margin-left: 10px;
                margin-top: 9px;
                width: 250px;
                height: 22px;
                line-height: 22px;
                border: 1px solid #CCCCCC;
            }
            .yzm input
            {
                width: 80px;
            }
            .lyright a
            {
                margin-left: 10px;
                margin-top: 15px;
                width: 91px;
                height: 31px;
                display: inline-block;
                background-image: url(/img/ly.jpg);
                background-position: -114px -86px;
                background-repeat: no-repeat;
            }
            .lyright a:hover
            {
                background-image: url(/img/ly.jpg);
                background-position: -23px -86px;
                background-repeat: no-repeat;
            }

		</style>
        <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="/js/nav.js"></script>
        <script type="text/javascript">
            function msg(isLogin) {
                // if(!isLogin){
                //     alert("请先登录")
                //     window.location.href = "/";
                // }else{
                    var title = $("#title").val();
                    var contetnt =$("#content").val();
                    var phone = $("#linkphone").val();

                    if(title == null) {
                        alert("标题不能为空")
                    }else if(contetnt == null){
                        alert("内容不能为空")
                    }else if(phone == null){
                        alert("手机号不能为空")
                    }

                    $.post("/bbs/add", {"title":title,"content":contetnt,"phone":phone},function (resp) {
                        $("#title").val("");
                        $("#content").val("");
                        $("#linkphone").val("");
                        alert(resp.msg);
                    })
                // }
            }
        </script>
	</head>
	<body>
		<div class="dbody">
        <div class="dsize">
			<#include "include/head.ftl"/>
            <div class="midlbox">
            	<div class="centbox">
            		<div class="midlbox-title">
            			<span>留言板</span>
            			
            		</div>
            		<hr style="border:3 double #BB6900" width="90%" color="#BB6900" size=3>
            		<div class="midlbox-content">

                        <div class="liuyanban">
                            留言板
                        </div>
                        <div class="lybox">
                            <div class="lyleft fl">
                                留言主题:</div>
                            <div class="lyright fl">
                                <input type="text" id="title" name="title"/></div>
                            <div class="lyleft fl">
                                留言内容:</div>
                            <div class="lyrarea fl">
                                <textarea id="content" name="content"></textarea></div>
                            <div class="lyleft fl">
                                联系电话:</div>
                            <div class="lyright fl">
                                <input type="text" id="linkphone" name="linkphone"/></div>
                            <#--<div class="lyleft fl">-->
                                <#--验证码:</div>-->
                            <#--<div class="lyright fl yzm">-->
                                <#--<input type="text" id="txtimgcode" name="txtimgcode"/>-->
                                <#--<img src="/login/validateCode.ashx" id="vimg" align="absmiddle" alt="不区分大小写,点击切换"-->
                                     <#--onclick="this.src='/login/validateCode.ashx?'+(new Date()).valueOf();" />-->
                                <#--<a href="javascript:void(0);" onclick="refreshcode();" style="font-size: 12px; background-image: none;">-->
                                    <#--点击切换</a>-->
                            <#--</div>-->
                            <div class="lyleft fl"></div>
                            <div class="lyright fl">
                                <span id="fabiao">
                                    <a href="javascript:void(0);" onclick="msg(<#if child??>true<#else>false</#if>);return false;"></a>
                                </span>
                            </div>
                        </div>
                    </div>
            	</div>
                <div class="mbottom">
                </div>
            </div>
        </div>
    </div>
	</body>
</html>
