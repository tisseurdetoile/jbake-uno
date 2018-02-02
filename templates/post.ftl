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
					<span class="post-meta__date date icon icon-calendar"> ${content.date?string("dd MMMM yyyy")}</span><br />
                    <span class="post-meta__author author icon icon-pencil">
					<#if (content.author)??>
						${content.author}
					<#else>
						${config.site_author}
					</#if>
					</span>
                    <br/>

					<#if ((config.site_includeReadTime!'true')?boolean == true)><span class="post-meta__eta eta icon icon-clock"></span><br /></#if>
					<#if content.tags??>
						<span class="post-meta__tags">
						<#list content.tags as tag>
						<a class="icon icon-price-tag" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/${tag}.html"> ${tag}</a>
						<#sep>&nbsp;-&nbsp;
						</#list>
						</span>
                        <br />
					</#if>

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