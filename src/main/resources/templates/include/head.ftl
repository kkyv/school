<div class="header">
    <div class="dtop">
        <ul class="nav">
            <#list infoCateFirstList as infoCateFirst>
                <li>
                    <#if infoCateFirst_index = 0>
                        <a href="/" class="menu">
                    <#elseif infoCateFirst_index = 7>
                        <a href="/bbs/" class="menu">
                    <#else>
                        <a href="#" class="menu">
                    </#if>
                        <h3 class="menu-title<#if infoCateFirst_index % 4 != 0> menu-title_${infoCateFirst_index % 4}</#if>">${infoCateFirst.firstCateName}</h3>
                        <ul class="menu-dropdown">
                        <#if infoCateFirst.infoCates?? && (infoCateFirst.infoCates?size > 0)>
                            <#list infoCateFirst.infoCates as infoCate>
                                <li onclick="cate(${infoCate.id})">${infoCate.name}</li>
                            </#list>
                        </#if>
                        </ul>
                    </a>
                </li>
            </#list>
        </ul>
    </div>
    <div class="dtlf">
    </div>
    <div class="dtrt">
    </div>
</div>