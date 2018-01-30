<#include "head.ftl">
<#if content.bodyid??>
   <body id="${content.bodyid}">
<#else>
   <body>
</#if>
<#include "header.ftl">
	<div class="content-wrapper">
		<div class="content-wrapper__inner">
			<article class="post-container post-container--single">
				<header class="post-header">
				<div class="post-meta">
					<time datetime="${content.date?string("yyyy-MM-dd")}" class="post-meta__date date">${content.date?string("dd MMMM yyyy")}</time> &#8226;
                    <#if ((config.site_includeReadTime!'true')?boolean == true)><div class="post-meta__eta eta"></div></#if>
					<#if content.tags??>
						<span class="post-meta__tags">tags
						<#list content.tags as tag>
						<a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/${tag}.html">${tag}</a>
						</#list>
						</span>
					</#if>
					<br />
    			</div>
    			<h1 class="post-title"><#escape x as x?xml>${content.title}</#escape></h1>

				</header>

				<section class="post">
				${content.body}
				</section>
				<#include "disqus.ftl">
		</article>
		</div>
		<#include "footer.ftl">
  </div>
</body>
</html>