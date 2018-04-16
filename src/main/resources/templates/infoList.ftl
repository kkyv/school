<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>
		<style type="text/css">
			#tList{
				margin-top:15px;
				border-collapse:collapse;
				border:1px solid #aaa;
				width:100%;
				}
			
			#tList thead th {
				vertical-align:baseline;
				padding:5px 15px 5px 6px;
				background-color:#FFF3BB;
				border:1px solid #E8E2D4;
				text-align:left;
				color:#F57B00;
				font-size: 17px;
				}
			
			#tList tbody td {
				font-size: 15px;
				vertical-align:text-top;
				padding:6px 15px 6px 6px;
				border:1px solid #e8e2d4;
			}
			#tList tr:nth-child(odd) {
				background-color:#fff;
			}
			
			#tList tr:nth-child(even) {
				background-color:#FDFAEE;
			}
			#tList a{
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
                        <a href="#">${infoCate.name}</a>
            		</div>
            		<hr style="border:3 double #BB6900" width="90%" color="#BB6900" size=3>
            		<div class="midlbox-content">
            			<table id="tList">
            				<thead>
            					<tr>
            						<th width="80%">标题</th>
            						<th width="20%">日期</th>
            					</tr>
            				</thead>
            				<tbody>
            					<#list infoList as info>
            					    <tr>
                                        <td>
                                            <span ></span>
                                            <a href="/info/${info.id}">${info.title}</a>
                                        </td>
                                        <td>${info.addTime?date}</td>
                                    </tr>
            					</#list>
            				</tbody>
            			</table>
            		</div>
            	</div>
                <div class="mbottom">
                </div>
            </div>
        </div>
    </div>
	</body>
</html>
