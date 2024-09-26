{* Category - Full view *}
{*
<div id="google-broad"><div>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7402149281256266"
     crossorigin="anonymous"></script>

<script type="text/javascript"><!--
google_ad_client = "pub-7489042062340760";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "text";
google_ad_channel ="4567327683";
google_color_border = "F7F8FB";
google_color_bg = "F7F8FB";
google_color_link = "0033CC";
google_color_url = "0066CC";
google_color_text = "666666";
//--></script>
<script type="text/javascript" src="http://web.archive.org/web/20051102024325js_/http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><iframe name="google_ads_frame" src="http://web.archive.org/web/20051031234719/http://pagead2.googlesyndication.com/pagead/ads?client=ca-pub-7489042062340760&amp;dt=1130899405024&amp;lmt=1726943802&amp;format=728x90_as&amp;output=html&amp;channel=4567327683&amp;url=http%3A%2F%2Fdigg.one%2F&amp;color_bg=F7F8FB&amp;color_text=666666&amp;color_link=0033CC&amp;color_url=0066CC&amp;color_border=F7F8FB&amp;ad_type=text&amp;cc=100&amp;u_h=1440&amp;u_w=2560&amp;u_ah=1415&amp;u_aw=2521&amp;u_cd=30&amp;u_his=12&amp;u_nplug=6&amp;u_nmime=6" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" data-ruffle-polyfilled="" width="728" height="90" frameborder="0"><img height="1" width="1" border="0" src="http://web.archive.org/web/20051031234719/http://pagead2.googlesyndication.com/pagead/imp.gif?event=noiframe&client=ca-pub-7489042062340760&dt=1130899405024&lmt=1726943802&format=728x90_as&output=html&channel=4567327683&url=http%3A%2F%2Fdigg.one%2F&color_bg=F7F8FB&color_text=666666&color_link=0033CC&color_url=0066CC&color_border=F7F8FB&ad_type=text&cc=100&u_h=1440&u_w=2560&u_ah=1415&u_aw=2521&u_cd=30&u_his=12&u_nplug=6&u_nmime=6" /></iframe>

</div></div>
*}

{set-block scope=root variable=cache_ttl}0{/set-block}
{def $childNodes = array()}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
    <div class="class-category">

{* <b> {if $node.depth|gt(2)}submit{else}nosubmit-{$node.depth}{/if} </b><hr /> *}
{*
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
*}
    <div id="sidebar"><div class="note-temp" id="note-temp">
<p><strong>What's Digg?</strong>
Digg is a technology news website that employs non-hierarchical editorial control. With digg, users submit stories for review, but rather than allowing an editor to decide which stories go on the homepage, the users do. <a href="https://digg.one/about">Learn more</a>.</p>
</div>
<ul class="main-menu"><li id="main-digg"><a href="https://digg.one/diggall">digg for stories <img src={"digg/digger.png"|ezimage()} alt="" width="40" height="40"></a></li>

<li id="main-submit"><a onclick="{* if $node.depth|lt(3)}document.getElementById('btn-submit').click(); return false;{else}{/if *}" href="{if $node.depth|gt(2)}https://digg.one/c#select-a-category-first{else}https://digg.one/submit{/if}">navigate to a category and submit a new story</a></li>

<li class="side-boxed"><div class="boxed">

<div>
{*<span>recently promoted stories:</span>*}
<span>categories for stories:</span>

<ul class="column-list">
          <li><a href="https://digg.one/c">all</a></li>

	  <li><a href="https://digg.one/c/apple">apple</a></li>
	  <li><a href="https://digg.one/deals">deals</a></li>
	  <li><a href="https://digg.one/c/design">design</a></li>
	  <li><a href="https://digg.one/c/gaming">gaming</a></li>
	  <li><a href="https://digg.one/c/hardware">hardware</a></li>
	  <li><a href="https://digg.one/c/links">links</a></li>
	  <li><a href="https://digg.one/c/linux-unix">linux/unix</a></li>
	  <li><a href="https://digg.one/c/mods">mods</a></li>
	  <li><a href="https://digg.one/c/movies">movies</a></li>
	  <li><a href="https://digg.one/c/music">music</a></li>
	  <li><a href="https://digg.one/c/programming">programming</a></li>
	  <li><a href="https://digg.one/c/robots">robots</a></li>
	  <li><a href="https://digg.one/c/science">science</a></li>
	  <li><a href="https://digg.one/c/security">security</a></li>
	  <li><a href="https://digg.one/c/software">software</a></li>
	  <li><a href="https://digg.one/c/technology">technology</a></li>
         </ul><br style="clear: both;"></div></div></li>
{*	 <li class="menu-item">
	 <span id="bubble">digg&nbsp;podcast:<a href="http://web.archive.org/web/20051102024325/http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewPodcast?id=76140881&amp;s=143441" id="p1">itunes</a> <a href="http://web.archive.org/web/20051102024325/http://odeo.com/channel/4565/view" id="p2">odeo</a> <a href="http://web.archive.org/web/20051102024325/http://feeds.feedburner.com/diggnation" id="p3">feed</a></span></li> *}

{*
<li><a href="https://digg.one/c/jshomepageedit">add digg news to your site</a></li>
<li><a href="https://digg.one/spy">digg spy</a></li>
*}
<li><a href="https://digg.one/topstories">top stories</a></li>
<li><a href="https://digg.one/topusers">top users</a></li>
<li><a href="https://digg.one/content/search">search</a></li>
<li><a href="https://digg.one/c/news">digg news</a></li>
<li><a href="https://digg.one/c/content/contact-form">report a website bug</a></li>
<li><a href="https://digg.one/rss/feed/digg" {* class="rss" *}>front page stories in rss<img src={"digg/rss.gif"|ezimage()} alt="RSS" width="29" height="14"></a></li>
</ul>

</div>

	{if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        {if $node.object.data_map.show_children.data_int}
            {def $fetch_limit = 460
	         $page_limit = 27
                 $classes = array( 'story' )
                 $children = array()
                 $childrenNodes = array()
                 $children_count = ''}
                 
            {if gt( $node.depth, '3')}
                {set $classes=array( 'story' )}
            {/if}

{def $parent_node_id=$node.node_id}
{if $node.node_id|eq( 687 )}
{set $parent_node_id=687}
{elseif $node.node_id|eq( 277 )}
{set $parent_node_id=687}
{elseif $node.node_id|eq( 709 )}
{set $parent_node_id=687}
{elseif $node.node_id|eq( 707 )}
{set $parent_node_id=687}
{/if}
{* $parent_node_id *}
{* $classes.0|attribute(show,1) *}
            {* set $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
						          'sort_by', array( 'attribute', false(), 382 ),
                                                          'limit', $fetch_limit ) )*}

            {set $children=fetch( 'content', 'tree', hash( 'parent_node_id', $parent_node_id,
                                                          'offset', $view_parameters.offset,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
						          'sort_by', array( 'published', true() ),
                                                          'limit', $page_limit ) )
                 $children_count=fetch( content, 'tree_count', hash( 'parent_node_id', $parent_node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $classes ) )}
{* $children_count|attribute(show,1) *}

{def $total_count=0
     $total_diggs=0}

    {foreach $children as $index => $child}
    {* <b>{$index}</b> *}
     {set $total_count=fetch( 'content', 'collected_info_count_list', hash( 'object_attribute_id', $child.data_map.diggs.attribute_original_id ) )
          $total_diggs=$total_count[0]}
     {set $childrenNodes=$childrenNodes|append( array( $total_diggs, $child ) )}
     {if $index|eq($fetch_limit)}{break}{/if}
    {/foreach}
{if $view_parameters.dir|eq(1)}
    {set $childrenNodes=$childrenNodes|arsort(SORT_NUMERIC)|reverse}
    {else}{set $childrenNodes=$childrenNodes|arsort(SORT_NUMERIC)}
{/if}
    {* $children_count|attribute(show,1) *}

    <div class="content-view-children float-break">
    Direction: {*<a href={concat($node.url_alias,'/(dir)/1')|ezurl}>down</a> and <a href={concat($node.url_alias,'/(dir)/0')|ezurl}>up</a>*}<a href={concat($node.url_alias,'/(dir)/1')|ezurl}>upcomming</a> and <a href={concat($node.url_alias,'/(dir)/0')|ezurl}>top</a>

    {if gt( $node.depth, '1')}
    {if $children_count}
    {foreach $childrenNodes as $child}
         {cache-block keys=$child[0]}
         {node_view_gui view=line content_node=$child[1]}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
	 {/cache-block}
    {/foreach}
    {/if}
    {else}
    {if $children_count}
    {foreach $children as $child}
         {cache-block keys=$child}
         {node_view_gui view=line content_node=$child}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
	 {/cache-block}
    {/foreach}
    {/if}
    </div>

{*
            <div class="content-view-children gallery-items-main">
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child}
                {/foreach}
            </div>
*}
            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
    </div>
</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>
