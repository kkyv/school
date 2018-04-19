<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2">
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/role/list" title="角色管理">角色管理</a></li>
                    <li><a href="/admin/access/list" title="权限管理">权限管理</a></li>
                    <li><a href="/admin/admin/list" title="管理员列表">管理员列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member" style="display: none">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 幼儿管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/child/child/list" title="幼儿列表">幼儿列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 资讯管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <#list cateGroupMap?keys as key>
                        <#assign cate = cateGroupMap['${key}']>
                        <#if cate.firstId = 0>
                            <#if cate.id != 1 && cate.id != 4 && cate.id != 8>
                                <li><a href="/info/${cate.id}/infoList" title="${cate.name}">${cate.name}</a></li>
                            </#if>
                        </#if>
                    </#list>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/album/photo/list" title="图片管理">图片管理</a></li>
                    <li><a href="/album/album/list" title="相册管理">相册管理</a></li>
                </ul>
            </dd>
        </dl>
        <#--<dl id="menu-product">-->
            <#--<dt><i class="Hui-iconfont">&#xe620;</i> 产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>-->
            <#--<dd>-->
                <#--<ul>-->
                    <#--<li><a href="product-brand.html" title="品牌管理">品牌管理</a></li>-->
                    <#--<li><a href="product-category.html" title="分类管理">分类管理</a></li>-->
                    <#--<li><a href="product-list.html" title="产品管理">产品管理</a></li>-->
                <#--</ul>-->
            <#--</dd>-->
        <#--</dl>-->
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 班级管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/class/manage/list" title="班级列表">班级列表</a></li>
                    <li><a href="/child/child/list" title="幼儿列表">幼儿列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 留言管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/bbs/msg/list" title="留言列表">园所留言</a></li>
                    <li><a href="/bbs/class/list" title="留言管理">班级留言</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-system" style="display: none">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="system-base.html" title="系统设置">系统设置</a></li>
                    <li><a href="system-category.html" title="栏目管理">栏目管理</a></li>
                    <li><a href="system-data.html" title="数据字典">数据字典</a></li>
                    <li><a href="system-shielding.html" title="屏蔽词">屏蔽词</a></li>
                    <li><a href="system-log.html" title="系统日志">系统日志</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->