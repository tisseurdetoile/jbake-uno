<!DOCTYPE html>
<html lang="fr-FR">
  <head>
    <meta charset="utf-8"/>
    <title><#if content.title??><#escape x as x?xml>${content.title}</#escape><#else>${config.site_title}</#if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${config.site_description}">
    <meta name="author" content="${config.site_author}">
    <meta name="keywords" content="">
    <meta name="generator" content="JBake">

    <!-- Le styles -->
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/main.css" rel="stylesheet" />
	<link rel="manifest" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicons/manifest.json"/>
  
  <link rel="shortcut icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/favicons/favicon.ico" />

	<script type="text/javascript">
	var baseUrl = '${config.site_baseurl}';
	var baseUrlIndex = '${config.site_baseurl}index.html';
	</script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/html5shiv.min.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
  </head>
   