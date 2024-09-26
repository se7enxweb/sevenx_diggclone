{set-block scope=global variable=title}{'Story Diggs %pollname'|i18n( 'design/ezwebin/collectedinfo/poll', , hash( '%pollname', $node.name|wash() ) )}{/set-block}

{def $total_count=fetch( 'content', 'collected_info_count_list', hash( 'object_attribute_id', $node.data_map.diggs.id ) )[0]}

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc">

<div class="content-view-full">
    <div class="class-poll">
        <div class="poll-result">
            <div class="news-full" id="main0">
	    {*
	        <div class="attribute-header">
		  <h1>{'Results'|i18n( 'design/ezwebin/collectedinfo/poll' )}</h1>
		</div>
        *}
        {if $error}

        {if $error_anonymous_user}
        <div class="warning">
            <h2>{'Please log in to vote on this story.'|i18n( 'design/ezwebin/collectedinfo/poll' )}</h2>
        </div>
        {/if}

        {if $error_existing_data}
        <div class="warning">
            <h2>{'You have already voted for this story.'|i18n( 'design/ezwebin/collectedinfo/poll' )}</h2>
        </div>
        {/if}

        {/if}

        <form method="post" action={"content/action"|ezurl} name="diggs{$node.node_id}" id="diggs{$node.node_id}">
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />

        <div class="content-diggs" style="display: none;">
        {attribute_view_gui attribute=$node.data_map.diggs}

        {if is_unset( $versionview_mode )}
        <input class="button" type="submit" id="ActionCollectInformation" name="ActionCollectInformation" value="{"Digg it"|i18n("design/ezwebin/full/poll")}" />
        <input class="button" type="submit" name="ActionCollectInformation" value="{"UnDigg"|i18n("design/ezwebin/full/poll")}" />
        {/if}

        </div>

    <ul class="news-digg">
      <li class="digg-count shade-5" id="main0"><a href={concat($node.url_alias, "/")|ezurl()} id="diggs0">{cache-block keys=$total_count}{if $total_count|gt(0)}{$total_count}{else}0{/if}{/cache-block} diggs</a></li>
      <li class="digg-it" id="diglink0" onClick="document.getElementById('ActionCollectInformation').click(); return false;"><a href="https://digg.one/notice">digg it</a></li>
      <li class="undigg-it" id="undiglink0" onClick="document.getElementsByName('ContentObjectAttribute_data_option_value_{$node.data_map.diggs.contentclassattribute_id}')[1].checked = true;document.getElementById('ActionCollectInformation').click(); return false;"><a href="https://digg.one/notice">undigg</a></li>
    </ul>

<div class="news-body">
<h3 id="title2"><a href={$node.url_alias|ezurl}><!-- google_ad_section_start -->{$node.data_map.title.content|wash}</a></h3>
     <p class="news-submitted">{def $user_submited=$node.object.author_array.0 $user_submited_username=$user_submited.login $user_submited_node=$user_submited.contentobject.main_node.url_alias}<a href={$user_submited_node|ezurl()}><img src={"favicon/favicon.png"|ezimage()} alt="{$user_submited_username}" width="16" height="16"/></a> submitted by <a href={$user_submited_node|ezurl}>{$user_submited_username}</a> {$node.object.published|datetime( 'custom', '%Y/\
%m/%d %h:%i %a' )} {*5 hours 33 minutes ago*} (<a href={$node.data_map.link.content|ezurl()} class="simple tight" title="{$node.data_map.title.content|wash}">via <a href={$node.data_map.link.content}>{$node.data_map.link.content}...</a>)</p>
     {section show=$node.data_map.intro.content.is_empty|not}<p>{attribute_view_gui attribute=$node.data_map.intro}</p>{/section}

     {if $node.data_map.body.content.is_empty|not}
         <div class="attribute-long">
         {attribute_view_gui attribute=$node.data_map.body}
         </div>
     {/if}

     {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                    {def $image_node=fetch(content,node,hash( node_id, $node.object.data_map.image.content[relation_list].0.node_id ) )}
                    {attribute_view_gui attribute=$node.data_map.image image_class=large href=$image_node.object.data_map.image.content[original].full_path|ezurl lightbox_class="large"}

                    {if $node.data_map.caption.has_content}
                    <div class="caption">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
            {/if}
     {/if}

     <div class="news-details">
       <a href={$node.url_alias|ezurl} class="tool comments">{$node.children|count} comments</a>
       {*<a href="/web/20051201015817/http://digg.com/bnotice" class="tool">blog this</a>*}{* <span class="tool">category: <a href="/web/20051201015817/http://digg.com/science">science</a></span> *}
       <span class="tool">category: <a href={$node.parent.url_alias|ezurl}>{$node.parent.name|wash}</a></span>
     </div>
                <!-- google_ad_section_end -->
<br />
        {foreach $object.contentobject_attributes as $contentobject_attribute_item}
            {if $contentobject_attribute_item.contentclass_attribute.is_information_collector}
            {def  $attribute=$contentobject_attribute_item
                  $contentobject_attribute_id=cond( $attribute|get_class|eq( 'ezinformationcollectionattribute' ),$attribute.contentobject_attribute_id,
                                                   $attribute|get_class|eq( 'ezcontentobjectattribute' ),$attribute.id )
                  $contentobject_attribute=cond( $attribute|get_class|eq( 'ezinformationcollectionattribute' ),$attribute.contentobject_attribute,
                                                $attribute|get_class|eq( 'ezcontentobjectattribute' ),$attribute )
                  $total_items_count=fetch( 'content', 'collected_info_count', hash( 'object_attribute_id', $contentobject_attribute_id ) )
                  $item_counts=fetch( 'content', 'collected_info_count_list', hash( 'object_attribute_id', $contentobject_attribute_id  ) )}
<!--
                <h3>{$contentobject_attribute.content.name}</h3>
-->
                <table class="poll-resultlist">
                <tr>

                {foreach $contentobject_attribute.content.option_list as $option}
                    {def $item_count=0}
                    {if is_set( $item_counts[$option.id] )}
                        {set $item_count=$item_counts[$option.id]}
                    {/if}
                    <td class="poll-resultname">
                        <p>
                            {$option.value}
                        </p>
                    </td>

                    {def $percentage=cond( $total_items_count|gt( 0 ), round( div( mul( $item_count, 100 ), $total_items_count ) ), 0 )
                         $tenth=cond( $total_items_count|gt( 0 ), round( div( mul( $item_count, 10 ), $total_items_count ) ), 0 )}
                    <td class="poll-resultbar">
                        <table class="poll-resultbar">
                        <tr>
                            <td class="poll-percentage">
                                <i>{$percentage}%</i>
                            </td>
                            <td class="poll-votecount">
                                {'Votes'|i18n( 'design/ezwebin/collectedinfo/poll' )}: {$item_count}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <div class="chart-bar-edge-start">
                                <div class="chart-bar-edge-end">
                                    <div class="chart-bar-resultbox">
                                        <div class="chart-bar-resultbar chart-bar-{$percentage}-of-100 chart-bar-{$tenth}-of-10" style="width: {$percentage}%;">
                                            <div class="chart-bar-result-divider"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </td>
                        </tr>
                        </table>
                    </td>
                    {delimiter}
                </tr>
                <tr>
                    {/delimiter}
                    {undef $item_count $percentage $tenth}
                {/foreach}
                </tr>
                </table>
            {* else}
                {if and( $attribute_hide_list|contains( $contentobject_attribute_item.contentclass_attribute.identifier )|not, array( 'metadata', 'star_rating', 'enable_comments', 'image' )|contains( $contentobject_attribute_item.contentclass_attribute.identifier ) )|not}
                    <div class="attribute-short">{attribute_view_gui attribute=$contentobject_attribute_item}</div>
                {/if}
            {/if *}
	    {/if}
        {/foreach}
	
	{*
        <br/>

        {'%count total votes'|i18n( 'design/ezwebin/collectedinfo/poll' ,,
                                     hash( '%count', fetch( content, collected_info_count, hash( object_id, $object.id ) ) ) )}

            <div class="content-results">
                <div class="attribute-link">
                    <p><a href={$node.url_alias|ezurl}>{'Back to poll'|i18n( 'design/ezwebin/collectedinfo/poll' )}</a></p>
                </div>
            </div>*}


        </div>
    </div>
</form>


        </div>
    </div>
</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>