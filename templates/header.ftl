<span class="mobile btn-mobile-menu">
  <i class="icon icon-list btn-mobile-menu__icon"></i>
  <i class="icon icon-x-circle btn-mobile-close__icon hidden"></i>
</span>
  
<header class="panel-cover" style="background-image: url(${config.site_baseurl}images/cover.jpg)">
  <div class="panel-main">

    <div class="panel-main__inner panel-inverted">
    <div class="panel-main__content">
		
        <a href="${config.site_baseurl}" title="link to home of ${config.site_title}">
        <#if (config.site_profilepic)??>
           <img src="${config.site_baseurl}images/${config.site_profilepic}" class="user-image" alt="My Profile Photo">
        <#else>
           <img src="${config.site_baseurl}images/profile.jpg" class="user-image" alt="My Profile Photo">
        </#if>
          <h1 class="panel-cover__title panel-title">${config.site_title}</h1>
        </a>
        <hr class="panel-cover__divider">
        <p class="panel-cover__description">${config.site_description}</p>
        <hr class="panel-cover__divider panel-cover__divider--secondary">

        <div class="navigation-wrapper">

          <nav class="cover-navigation cover-navigation--primary">
            <ul class="navigation">
              <li class="navigation__item"><a href="${config.site_baseurl}#blog" title="link to ${config.site_baseurl} blog" class="blog-button">Blog</a></li>
            </ul>
          </nav>

          <nav class="cover-navigation navigation--social">
            <ul class="navigation">
          
		  
		  	<!-- twitter -->
		  	<#if (config.share_twitter)??>
			<li class="navigation__item">
			<a href="http://twitter.com/${config.share_twitter}" title="${config.share_twitter} on Twitter" target="_blank">
              <i class="icon icon-social-twitter"></i>
              <span class="label">Twitter</span>
            </a>
			</li>
			</#if>
		  
		  	<!-- LinkedIn -->
		  	<#if (config.share_linkedin)??>
				<li class="navigation__item">
					<a href="https://www.linkedin.com/in/${config.share_linkedin}" title="${config.share_linkedin} on LinkedIn" target="_blank"><i class="icon icon-social-linkedin"></i><span class="label">LinkedIn</span></a>
				</li>
			</#if>
		  
		  	<!-- gitHub -->
		  	<#if (config.share_github)??>
			<li class="navigation__item">
			<a href="https://www.github.com/${config.share_github}" title="${config.share_github} on gitHub" target="_blank">
              <i class="icon icon-social-github"></i>
              <span class="label">gitHub</span>
            </a>
			</li>
			</#if>

		  	<!-- flickr -->
		  	<#if (config.share_flickr)??>
			<li class="navigation__item">
			<a href="https://www.flickr.com/photos/${config.share_flickr}" title="${config.share_flickr} on flickr" target="_blank">
              <i class="icon icon-social-flickr"></i>
              <span class="label">flickr</span>
            </a>
			</li>
			</#if>

		  	<!-- instagram -->
		  	<#if (config.share_instagram)??>
			<li class="navigation__item">
			<a href="https://www.instagram.com/${config.share_instagram}" title="${config.share_instagram} on instagram" target="_blank">
              <i class="icon icon-social-instagram"></i>
              <span class="label">instagram</span>
            </a>
			</li>
			</#if>

		  	<!-- GarminConnect -->	
		  	<#if (config.share_garmin)??>
			<li class="navigation__item">
			<a href="https://connect.garmin.com/profile/${config.share_garmin}" title="${config.share_garmin} on garmin" target="_blank">
              <i class="icon icon-torso"></i>
              <span class="label">garmin</span>
            </a>
			</li>
			</#if>

		  	<!-- RSS -->
		  	<#if (config.share_github)??>
			<li class="navigation__item">
			<a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.share_rss}" title="Subscribe" target="_blank">
              <i class="icon icon-rss"></i>
              <span class="label">rss</span>
            </a>
			</li>
			</#if>

		  	<!-- email -->
		  	<#if (config.share_email)??>
			<li class="navigation__item">
			<a href="mailto:${config.share_email}" title="${config.share_email} on gitHub" target="_blank">
              <i class="icon icon-mail"></i>
              <span class="label">email</span>
            </a>
			</li>
			</#if>
          
            </ul>
          </nav>

        </div>

      </div>

    </div>

    <div class="panel-cover--overlay"></div>
  </div>
</header>
