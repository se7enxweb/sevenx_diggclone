{* Category - Line view *}

<div class="content-view-line">
    <div class="class-category">

        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>

       {section show=$node.data_map.short_description.content.is_empty|not}
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
       {/section}
    </div>
</div>
