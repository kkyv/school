<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>
		<link rel="stylesheet" type="text/css" href="/css/info.css"/>

        <script type="text/javascript" src="/js/nav.js"></script>
	</head>
	<body>
		<div class="dbody">
        <div class="dsize">
			<#include "include/head.ftl"/>
            <div class="midlbox">
            	<div class="centbox">
            		<div class="midlbox-title">
                        <a href="#" class="cate_name">${(cateGroupMap['${info.cateId}'].name)!}</a>
            		</div>
            		<hr style="border:3 double #BB6900" width="90%" color="#BB6900" size=3>
            		<div class="midlbox-content">
						<h2 style="text-align: center">
							${((info.title)!)}
						</h2>
            			<div>
							${(info.content)!}
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
