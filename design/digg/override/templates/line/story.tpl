{* Story - Line view *}
{def $total_count=fetch( 'content', 'collected_info_count_list', hash( 'object_attribute_id', $node.data_map.diggs.id ) )
     $total_diggs=$total_count[0]}

<div class="content-view-line">
    <div class="class-story float-break">

    <form method="post" action={"content/action"|ezurl} name="digg{$node.node_id}" id="digg{$node.node_id}">
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />

    <ul class="news-digg">
      <li class="digg-count shade-5" id="main0"><a href={concat($node.url_alias, "/")|ezurl()}{* href={concat("/content/collectedinfo/", $node.node_id, "/")|ezurl() *} id="diggs0">{if $total_diggs|ne('')}{cache-block keys=$total_diggs}{$total_diggs}{/cache-block}{else}0{/if} diggs</a></li>
      {if fetch( content, collected_info_count, hash( object_id, $object.id ) )|count|gt(0)}
      <li class="digg-it" id="diglink0"><a onClick="document.getElementById('ActionCollectInformation{$node.node_id}').click(); return false;" href="https://digg.one/notice">digg it</a></li>
      {else}<li class="undigg-it" id="undiglink0"><a onClick="document.getElementsByName('ContentObjectAttribute_data_option_value_{$node.data_map.diggs.id}')[1].checked = true;document.getElementById('ActionCollectInformation{$node.node_id}').click(); return false;" href="https://digg.one/notice">undigg</a></li>{/if}
    </ul>

        <div class="content-diggs" style="display:none">
        {attribute_view_gui attribute=$node.data_map.diggs}
	
        {if is_unset( $versionview_mode )}
        <input class="button" type="submit" id="ActionCollectInformation{$node.node_id}" name="ActionCollectInformation" value="{"Digg it"|i18n("design/ezwebin/full/poll")}" />
        <input class="button" type="submit" name="ActionCollectInformation" value="{"UnDigg it"|i18n("design/ezwebin/full/poll")}" />
        {/if}

           </div>
        </form>


<div class="news-summary" id="enclosure2" style="z-index:0">
   <script>

   </script>
   <div class="news-body">
     <h3 id="title2"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h3>
     <p class="news-submitted">{def $user_submited=$node.object.author_array.0 $user_submited_username=$user_submited.login $user_submited_node=$user_submited.contentobject.main_node.url_alias}<a href={$user_submited_node|ezurl()}><img src={"favicon/favicon.png"|ezimage()} alt="{$user_submited_username}" width="16" height="16"/></a> submitted by <a href={$user_submited_node|ezurl}>{$user_submited_username}</a> {$node.object.published|datetime( 'custom', '%Y/%m/%d %h:%i %a' )} {*5 hours 33 minutes ago*} (<a href={$node.data_map.link.content|ezurl()} class="simple tight" title="{$node.data_map.title.content|wash}">via <a href={$node.data_map.link.content}>{$node.data_map.link.content}...</a>) {if true()|eq( false() )}(<a href={$spy_link|ezurl}>spy</a>)</p>{/if}
     {section show=$node.data_map.intro.content.is_empty|not}<p>{attribute_view_gui attribute=$node.data_map.intro}</p>{/section}
     {section show=$node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href0=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/section}
     <div class="news-details">
       <a href={$node.url_alias|ezurl} class="tool comments">{$node.children|count} comments</a>
       {*<a href="/web/20051201015817/http://digg.com/bnotice" class="tool">blog this</a>*}{* <span class="tool">category: <a href="/web/20051201015817/http://digg.com/science">science</a></span> *}
     </div>
    </div>

{*
	<hr><hr>

<div class="content-story">
    <h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>

    {section show=$node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href0=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/section}

    {section show=$node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/section}

</div>

*}

{*<script>
        {literal}
                document.addEventListener("DOMContentLoaded", (event) => {
                        const submitButtons = Array.from(document.querySelectorAll('[id="diglink0"]'));

                        submitButtons.forEach((btn) => {
                                btn.addEventListener('click', () => {
                                        const form = btn.closest('form');

                                        form.submit();
                                });
                        });
                });
        {/literal}        
</script>

        <div class="content-results">
            <div class="attribute-link">
                <p><a href={concat( "/content/collectedinfo/", $node.node_id, "/" )|ezurl}>{"Result"|i18n("design/ezwebin/full/poll")}</a></p>
            </div>
        </div>
*}
    </div>
</div>