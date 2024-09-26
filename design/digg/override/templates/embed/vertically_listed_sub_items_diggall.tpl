<div class="content-view-embed">

<h2><a href="{$object.main_node.url_alias|ezurl("no")}">{$object.name|wash()}</a></h2>

<div class="border-box box-3">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
    {def $children = array()
         $limit = 10
         $offset = 0}

    {*if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if *}

    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {*set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', $object.main_node.sort_array ) ) *}
    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $view_parameters.offset,
                                               'sort_by', array('path', false(), 382 ) ) ) }

    <div class="content-view-children float-break">
    {if $children|count()}
    {foreach $children as $child}
         {node_view_gui view=line content_node=$child}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
    {/foreach}
 
    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$object.main_node.url_alias
             item_count=$children|count()
             view_parameters=$view_parameters
             item_limit=5}
    {/if}
    </div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

</div>