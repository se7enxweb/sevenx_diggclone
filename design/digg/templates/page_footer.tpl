{def $startyear=2023}

<footer class="footer-main">
    <div class="container">

<div id="footer">
<ul>
<li><a href="/">home</a></li>
<li><a href="/about">about digg</a></li>
<li><a href="/all">digg for stories</a></li>
<li><a onclick="{if $current_node.depth|lt(2)}document.getElementById('btn-submit').click(); return false;{else}{/if}" href="{if $current_node.depth|lt(2)}https://{$current_node.depth}digg.one/submit{else}https://digg.one/c#select-a-category-first{/if}">submit a link</a>
</li>
<li><a href="/contact">contact us</a></li>
<li><span class="copyright">© {$startyear} - {currentdate()|datetime( 'custom', '%Y' )} digg.one - all rights reserved</span></li>
</ul>
</div>
    
      <div class="poweredby-text">
        Digg [Sigma] Powered by <a href="/ezinfo/about" title="eZ Publish&#8482; CMS Open Source Web Content Management">eZ Publish&#8482;</a>
      </div>
    </div>
</footer>
