<footer class="footer">
  <span class="footer__copyright">&copy; ${published_date?string("yyyy")} ${config.site_author}. <a href="${config.site_baseurl}about.html">à propos de ce site</a></span>
</footer> 
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery.min.js"></script>
<#-- base url -->
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/main.js"></script>
<#-- google analitics -->
<#include "ga.ftl">
