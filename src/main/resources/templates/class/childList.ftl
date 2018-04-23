<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/js/lib/boostrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/class.css" />
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="dbody">
    <div class="dsize">
        <#include "class_left.ftl"/>
            <div class="right right_top" style="padding-top: 0px;">

            	<div class="photos">

                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-lg-8">
                                    <label>班级成员</label>
                                    <!-- /input-group -->
                                </div>
                                <!-- /.col-lg-6 -->
                                <#--<div class="col-lg-4">-->
                                    <#--<div class="input-group">-->
                                        <#--<input type="text" class="form-control" placeholder="请输入搜索内容">-->
                                        <#--<span class="input-group-btn">-->
								<#--<button class="btn btn-default" type="button" onclick="findForum(this)">搜索</button>-->
							<#--</span>-->
                                    <#--</div>-->
                                <#--</div>-->
                            </div>
                        </div>
                        <!-- List group -->
                        <div class="list-group" id="howForums">
                            <#list childList as child>
                                <#if child.nickname??>
                                    <a href="#" class="list-group-item">${child.nickname}</a>
                                </#if>
                            </#list>
                        </div>
                    </div>
            	</div>
            </div>
            <div class="clearfloat"></div>
        </div>
    </div>
    <div class="footer right"></div>
</div>
</body>
</html>