<!DOCTYPE html>
<html>
<#include "head.ftl">
<body>
<#include "header.ftl">
    <div class="content-wrapper">
      <div class="content-wrapper__inner">
	  <article class="post-container post-container--single">
	    <header class="post-header">
	      <div class="post-meta">
	        <time datetime="${content.date?string("dd MMMM yyyy")}" class="post-meta__date date">${content.date?string("dd MMMM yyyy")}</time> &#8226; 

		  <#if content.tags??>
	  	  <span class="post-meta__tags">tags 
		  <#list content.tags as tag>
	  	  <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/${tag}.html">${tag}</a>
	  	  </#list>
	  	  </span>
		  </#if>

	      </div>
	      <h1 class="post-title"><#escape x as x?xml>${content.title}</#escape></h1>
	    </header>

	<p>${content.body}</p>

	<hr />

<#include "footer.ftl">