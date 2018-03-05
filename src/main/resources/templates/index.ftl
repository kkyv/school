<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/index.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>

        <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="/js/nav.js"></script>

        <script type="text/javascript">
            function imgLogin_onclick() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                $.post("/child/login", {"id":username,"password":password}, function (resp) {
                    if(resp.status){
                        location.reload();
                        window.open("/class/" + resp.data.classId);
                    }else {
                        alert(resp.msg);
                    }
                });
            }
        </script>
	</head>
	<body>
		<div class="dbody">
        <div class="dsize">
            <#include "include/head.ftl"/>
            <div class="midlbox">
                <!--<div class="cline fl clt">
                </div>-->
                <div class="centbox">
                    <div class="ctop">
                        <div class="ctlf fl">
                            <div class="ctlftop">
                                <div class="loginbox" id="dlogin">
                                    <#if child??>
                                        <p>
                                            <span>${child.nickname}</span>
                                            <a href="/child/logout/${child.id}">退出登录</a>
                                        </p>
                                        <a href="/class/${child.classId}" target="_blank">进入班级主页</a>
                                    <#else>
                                        <div class="dlname">
                                            <div class="fl">
                                                用户名：<input type="text" id="username" name="username" class="txtiput" onkeyup="if(event.keyCode==13 && this.value.trim()!=''){document.all.password.focus()}" />
                                            </div>
                                        </div>
                                        <div class="dlpassw">
                                            <div class="fl">
                                                密&nbsp;&nbsp;码：<input type="password" id="password" name="password" class="txtiput"
                                                                      onkeyup="if(event.keyCode==13 &&thisbotbot.value.trim()!=''){document.all.imgLogin.click()}" />
                                            </div>
                                        </div>
                                        <div class="dlbtn">
                                        <div class="dlremeber">
                                            <div class="fl">
                                                <input type="checkbox" id="autologin" checked="checked" value="checkbox" style="border: none;
                                                    width: 20px;" />
                                            </div>
                                            <div class="fl">
                                                记住密码
                                            </div>
                                        </div>
                                        <div class="fl pl5">
                                            <a href="javascript:void(0)" style="display: inline-block;" onclick="imgLogin_onclick(); return false;">
                                                <img src="img/m103_login.jpg" alt="" id="imgLogin" /></a></div>
                                        <div class="fl pl5">
                                            <a href="/ecenter/reg.aspx?schoolid=22247" style="display: inline-block;"
                                               target="_blank">
                                                <img src="img/m103_register.jpg" alt="" id="img1" /></a></div>
                                        </div>
                                    </#if>
                                </div>
                                <div class="wxtsbox">
                                    <marquee scrollamount="1" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
                                        ${prompt.content}
                                    </marquee>
                                </div>
                            </div>
                            <div class="ctyzjy">
                                <div class="divbox">
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                </div>
                            </div>
                        </div>
                        <div class="ctcenter fl">
                            <div class="ysxw">
                                <!--<div class="weatherbox">
                                    <iframe src="http://m.weather.com.cn/m/pn4/weather.htm " width="160" height="20"
                                        marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no">
                                    </iframe>
                                </div>-->
                                <div class="more1 allm">
                                    <a href="/info/list?cateId=13" target="_blank"></a>
                                </div>
                                <div class="ysxwCont listnews">
                                    <ul>
                                        <#list cate13InfoList as cate13Info>
                                            <div class="dNewsLeft">
                                                <a href="/info/${cate13Info.id}" target="_blank" title="${cate13Info.title}">${cate13Info.content}</a>
                                            </div>
                                            <div  class="dNewsRight">${cate13Info.addTime?date}</div>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                            <div class="ystz">
                                <div class="more2 allm">
                                    <a href="/info/list?cateId=22" target="_blank"></a>
                                </div>
                                <div class="ystzCont listnews">
                                    <ul>
                                        <#list cate22InfoList as cate22Info>
                                            <div class="dNewsLeft">
                                                <a href="/info/${cate22Info.id}" target="_blank" title="${cate22Info.title}">${cate22Info.content}</a>
                                            </div>
                                            <div  class="dNewsRight">${cate22Info.addTime?date}</div>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                            <div class="bjlb">
                                <div class="more5">
                                    <a href="/class/list" target="_blank">查看所有班级</a>
                                </div>
                                <div class="bjpic">
                                </div>
                                <div class="bjlist">
                                    <ul>
                                        <#list classList as class>
                                            <li>
                                                <a href="/class/${class.id}" target="_blank" title="${class.name}" >${class.name}</a>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="ctrt fl">
                            <div class="qhbox">
                                <div class="qhpic">
                                    <div id="dFlashPic" class="dflashpic">
                                    </div>
                                </div>
                            </div>
                            <div class="crtbotom">
                                <div class="treebox">

                                    <script type="text/javascript">
//                                  document.write(_getFlashHTML('/school/template/t103/images/treebox.swf', '', 281,330))
                                    </script>

                                </div>
                            </div>
                            <div class="cyqlj">
                                <div class="yqsel">

<select id="FriendLink" onchange="getFriendLink(this)"><option value="0">友情链接</option><option value="mariamiracle">微信公众平台—玛利亚的奇迹</option><option value="http://www.dianping.com/shop/34137824">大众点评网—玛利亚的奇迹蒙特梭利幼儿园</option><option value="http://www.mariasmiracles.com/">玛利亚的奇迹蒙特梭利儿童之家</option><option value="http://zhaopin.51yey.com">幼师招聘</option><option value="http://www.51yey.com">无忧幼儿园网</option></select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cmiddlebox">
                        <div class="jyky fl">
                            <div class="more3 allm">
                                <a href="/info/list?cateId=22" target="_blank"></a>
                            </div>
                            <div class="jykyCont listnews">
                                <ul>
                                    <#list cate15InfoList as cate15Info>
                                        <div class="dNewsLeft">
                                            <a href="/info/${cate15Info.id}" target="_blank" title="${cate15Info.title}">${cate15Info.content}</a>
                                        </div>
                                        <div  class="dNewsRight">${cate15Info.addTime?date}</div>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="yebj fl">
                            <div class="more4 allm">
                                <a href="/info/list?cateId=17" target="_blank"></a>
                            </div>
                            <div class="jykyCont listnews">
                                <ul>
                                    <#list cate17InfoList as cate17Info>
                                        <div class="dNewsLeft">
                                            <a href="/info/${cate17Info.id}" target="_blank" title="${cate17Info.title}">${cate17Info.content}</a>
                                        </div>
                                        <div  class="dNewsRight">${cate17Info.addTime?date}</div>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="tzbox fl">
                            <div class="tzpic">
                                <a href="list.aspx?cid=1&did=208" target="_blank">
                                    <img src="img/m103_pic.jpg" /></a></div>
                        </div>
                    </div>
                    <div class="chlsg">
                        <div class="more6">
                            <a href="#" target="_blank">更多</a></div>
                        <div class="gundongbox" id="demo0">
                            <!--<table cellpadding="0" align="center" border="0" cellspacing="0">
                                <tr>
                                    <td id="demo3" valign="top" style="z-index: 9999; width: 100%">
                                        <table>
                                            <tr>
                                                <td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016350409.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016611181.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016387848.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016712438.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016503978.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016657547.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016515314.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016599119.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016264983.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016518851.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016504936.jpg" class="sZuopinImg"/></a></td><td><a href="album.aspx" target="_blank"><img src="/upload/class/2016/0606/06060016443866.jpg" class="sZuopinImg"/></a></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td id="demo4" valign="top" style="z-index: 9999">
                                    </td>
                                </tr>
                            </table>-->
                        </div>
                    </div>
                    <div class="cbot">
                        <div class="bottom">
                            <div class="bottop">
                                <div class="bot01">
                                    <div>
                                        <b>玛利亚的奇迹蒙特梭利儿童之家</b></div>
                                    <div>电话：010-82011145</div>
                                    <div>地址：北京市朝阳区安贞街道裕民路</div>
                                </div>
                                <div class="bot02">
                                    <div style="font-family: 黑体; font-size: 16px;">
                                    	总访问量：<em class="number" id="vtime"></em></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<div class="cline fl crt">
                </div>-->
                <div class="mbottom">
            	</div>
            </div>
        </div>
    </div>
	</body>
</html>
