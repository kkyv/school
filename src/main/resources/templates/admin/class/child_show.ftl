<#include "../include/meta.ftl"/>

<div class="cl pd-20" style=" background-color:#5bacb6">
  <img class="avatar size-XL l" src="static/h-ui/images/user.png">
  <dl style="margin-left:80px; color:#fff">
    <dt><span class="f-18">${(child.nickname)!}</span> <span class="pl-10 f-12" style="display: none">余额：40</span></dt>
    <dd class="pt-10 f-12" style="margin-left:0">${(child.desc)!"这家伙很懒，什么也没有留下"}</dd>
  </dl>
</div>
<div class="pd-20">
  <table class="table">
    <tbody>
      <tr>
        <th class="text-r" width="80">性别：</th>
        <td>${(child.sex)!}</td>
      </tr>
      <tr>
        <th class="text-r">手机：</th>
        <td>${(child.phone)!}</td>
      </tr>
      <tr>
        <th class="text-r">地址：</th>
        <td>${child.addr}</td>
      </tr>
      <tr>
          <th class="text-r">生日：</th>
          <td>${child.birthday?date}</td>
      </tr>
      <tr>
        <th class="text-r">注册时间：</th>
        <td>${(child.addTime?date)!}</td>
      </tr>
      <tr>
        <th class="text-r">积分：</th>
        <td>330</td>
      </tr>
    </tbody>
  </table>
</div>

<#include "../include/footer.ftl"/>

</body>
</html>