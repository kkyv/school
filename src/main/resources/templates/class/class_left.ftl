<div class="head">
    <div class="headimg">
        <img src="/img/c_20.jpg"/>
    </div>
</div>
        <nav id="nav">
            <ul >
                <li><a href="/class/${class.id}">班级首页</a></li>
                <li><a href="/class/${class.id}/album">班级相册</a></li>
                <li><a href="/class/${class.id}/child">班级成员</a></li>
                <li><a href="/class/${class.id}/bbs">留言板</a></li>
                <div class="right link noshows">
                    <div class="left">
                        <div class="link_box">
                            <a href="/admin/admin/">管理页面</a>
                        </div>
                    </div>
                    <div class="left">
                        <div class="link_box">
                            <a href="/">网站首页</a>
                        </div>
                    </div>
                </div>
            </ul>
        </nav>
        <div class="center">
            <div class="left">
                <div class="clas_info">
                    <div class="edit_class_info">
                        <a href="#" class="show button">编辑</a>
                    </div>
                    <div class="class_marque">
                        <marquee scrollamount="1" direction="up"  onmouseover="this.stop();" onmouseout="this.start();">
                        ${(class.notice)!}
                        </marquee>
                    </div>
                </div>
                <div class="birthday gree_box">
                    <div class="box_head">
                        <span class="box_head_text">生日</span>
                    </div>
                    <#list childList as child>
                        <div class="c_img_box">
                            <img src="/img/nophoto.jpg"/>
                            <span>${child.birthday?date}</span>
                            <span>${child.nickname}</span>
                        </div>
                    </#list>
                </div>
                <div class="browser gree_box">
                    <div class="box_head">
                        <span class="box_head_text">来访记录</span>
                    </div>
                    <#list class.history?split(',') as his>
                        <#if his_index < 3>
                            <div class="c_img_box">
                                <img src="/img/nophoto.jpg"/>
                                <span>${his}</span>
                            </div>
                        </#if>
                    </#list>
                </div>
                <div class="count gree_box">
                    <div class="box_head">
                        <span class="box_head_text">班级统计</span>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>班级相片：</td>
                                <td class="num">${(photoCount)!0}</td>
                                <td>张</td>
                            </tr>
                            <tr>
                                <td>成员统计：</td>
                                <td class="num">${childList?size}</td>
                                <td>位</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>