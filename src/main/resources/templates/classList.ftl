<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>
		<style type="text/css">
            .classbox
            {
                overflow: hidden;
                margin-left: 15px;
				margin-top: 30px;
            }
            .c_box
            {
                float: left;
                width: 260px;
                overflow: hidden;
                height: 200px;
            }
            .c_img
            {
                width: 200px;
                border: 1px solid #cccccc;
                padding: 2px;
                font-size: 0px;
                height: 150px;
                overflow: hidden;
            }
            .c_img img
            {
                border: none;
                width: 200px;
            }
            .c_cname
            {
                text-align: left;
                height: 25px;
                margin-top: 3px;
                font-size: 14px;
                font-weight: bold;
                background-color: #f2f2f2;
                width: 200px;
                padding-left: 6px;
            }
            .c_cname a
            {
                color: #666666;
            }
		</style>

        <script type="text/javascript" src="/js/nav.js"></script>
	</head>
	<body>
		<div class="dbody">
        <div class="dsize">
			<#include "include/head.ftl"/>
            <div class="midlbox">
            	<div class="centbox">
            		<div class="midlbox-title">
            			<span>班级主页</span>
            			
            		</div>
            		<hr style="border:3 double #BB6900" width="90%" color="#BB6900" size=3>
            		<div class="midlbox-content">
                        <div class="classbox">
							<#list classList as class>
								<div class="c_box">
									<div class="c_img">
										<a href="/class/${class.getId()}">
											<img style="width: 200px; height: 150px;" src="http://www.mariasmiracles.51yey.com/upload/image/2016/0529/052915234098560.jpg" /></a>
									</div>
									<div class="c_cname">
										<a href="/class/${class.getId()}">
											${class.getName()}</a>
									</div>
								</div>
							</#list>
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
