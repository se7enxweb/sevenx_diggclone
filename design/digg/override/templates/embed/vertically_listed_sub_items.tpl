<div class="content-view-embed">

<h2><a href="{$object.main_node.url_alias|ezurl("no")}">{$object.name|wash()}</a></h2>

<div class="border-box box-3">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
    {def $children = array()
         $children_count = 0
         $limit = 5
         $offset = 0}

    {*if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if *}

    {*if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if*}

    <h1>{$module_result['view_parameters']|attribute(show,1)}</h1>
    <h1>{$view_parameters|attribute(show,1)}</h1>

    <h3>{$view_offset|attribute(show,1)}</h3>

    {if is_set( $view_parameters.offset )}
        <h1>OFfset: SET!!!</h1>
        {set $offset = $view_parameters.offset}
    {/if}

    {$offset|attribute(show,1)}

    {*set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', $object.main_node.sort_array ) ) *}

    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', array('attribute', false(), 382 ) ) ) }

    {set $children_count=fetch( content, list_count, hash( 'parent_node_id', $object.main_node_id ) )}

    <div class="content-view-children float-break">
    {if $children_count}
    {foreach $children as $child}
         {node_view_gui view=line content_node=$child}
         {delimiter}
             {include uri='design:content/datatype/view/ezxmltags/separator.tpl'}
         {/delimiter}
    {/foreach}
 
    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$node.url_alias
             item_count=$children_count
             view_parameters=$view_parameters
             item_limit=5}
    {/if}
    </div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

</div>