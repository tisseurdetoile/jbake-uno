<#include "head.ftl">
<body>
<#include "header.ftl">
    <div class="content-wrapper">
      <div class="content-wrapper__inner">
	  	<h2>Archive</h2>
	
		<ul>
		<#list published_posts as post>
		<#if (last_month)??>
			<#if post.date?string("MMMM yyyy") != last_month>
				</ul>
				<h4>${post.date?string("MMMM yyyy")}</h4>
				<ul>
			</#if>
		<#else>
			<h4>${post.date?string("MMMM yyyy")}</h4>
			<ul>
		</#if>
		
		<li>${post.date?string("dd")} - <a href="${content.rootpath}${post.uri}">${post.title}</a></li>
		<#assign last_month = post.date?string("MMMM yyyy")>
		</#list>
	</ul>
	
	</div>
<#include "footer.ftl">
  </div>
  </body>
</html>