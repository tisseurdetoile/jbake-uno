<!DOCTYPE html>
<html>
<#include "head.ftl">
<body>
<#include "header.ftl">
    <div class="content-wrapper">
      <div class="content-wrapper__inner">
	  	<div class="main-post-list">
  	  		<ol class="post-list">
    			<#list posts as post>
    				<li>
    				<#if (post.status == "published")>
    					<h2 class="post-list__post-title post-title">
    					<a href="${post.uri}"  title="${post.title}">
        				${post.title}
    					</a>
    					</h2>
    					<p class="excerpt">
    					${post.body}
    					</p>

    				</#if>
    
					<hr class="post-list__divider">
    			</li>
    		</#list>
  		  </ol>
  
		  <hr class="post-list__divider ">

  		  <!-- inclure la pagination -->

	  	</div>

    </div>

<#include "footer.ftl">

  </div>
  </body>
</html>