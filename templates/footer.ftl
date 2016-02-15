<footer class="footer">
  <span class="footer__copyright">&copy; ${published_date?string("yyyy")} ${config.site_author}. </span>
</footer> 

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- base url -->
<script type="text/javascript" src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/main.js"></script>
<!-- google analitics -->
<#include "ga.ftl">
