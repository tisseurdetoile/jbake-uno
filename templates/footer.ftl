<footer class="footer">
    <span class="footer__copyright">&copy; ${published_date?string("yyyy")} ${config.site_author}. <a href="${config.site_baseurl}about.html">About</a></span>
    <span class="footer__copyright"><a href="${config.site_baseurl}search.html">Search this site</a></span>
</footer> 
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery.min.js"></script>
<#-- base url -->
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/main.js"></script>
<#-- readingTime -->
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/readingTime.js"></script>
<#-- google analitics -->
<#include "ga.ftl">
