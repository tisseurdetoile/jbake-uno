<#include "head.ftl">
<body class="blog">
<#include "header.ftl">
<div class="content-wrapper">
    <div class="content-wrapper__inner">
        <div class="main-post-list">
            <ol class="post-list">
    			<#list posts as post>

    				<#if (post.status == "published")>
						<li>
                            <h2 class="post-list__post-title post-title">
                                <a href="${post.uri}" title="${post.title}">
                                    ${post.title}
                                </a>
                            </h2>
                            <div class="excerpt">
                                ${post.body}
                            </div>
                            <hr class="post-list__divider">
                        </li>
                    </#if>

                    <#if (post?counter == config.site_maxarticle?number)>
                        <#break>
                    </#if>
                </#list>
            </ol>

            <hr class="post-list__divider ">

            <!-- inclure la pagination -->
            <a href="archive.html">Billets plus anciens</a>

        </div>

    </div>

<#include "footer.ftl">

</div>
</body>
</html>