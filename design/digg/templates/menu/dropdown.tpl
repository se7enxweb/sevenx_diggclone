
{* DropDown Menu : START *}

{def $root_node = fetch( 'content', 'node', hash( 'node_id', $indexpage ) )
     $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
     $top_menu_items = fetch( 'content', 'list', hash('parent_node_id', $root_node.node_id,
                                                      'sort_by', $root_node.sort_array,
						      'class_filter_type', 'include', 'class_filter_array', $top_menu_class_filter, 'ignore_visibility', false() ))
     $top_menu_items_count = $top_menu_items|count()
     $item_class = array()
     $level_2_items = 0
     $top_level_exclude_items = array( 687 )
     $level_2_limit = 7
     $current_node_in_path = first_set($module_result.node_id, 0 )
     $current_node_in_path_2 = first_set($module_result.node_id, 0 )
     $cu_main_id=$current_user.contentobject.main_node_id
     $cu_main_node=fetch(content, node, hash( node_id, $cu_main_id) )
     $cu_main_node_uri=$cu_main_node.url_alias}

<h3 class="nav-link" style="background: none;">Menu</h3>

<ul class="navbar-nav">

<form name="children" method="post" action={'content/action'|ezurl}>

<input type="hidden" name="ContentNodeID" value="{$current_node_id}" />
<input type="hidden" name="ContentObjectID" value="{$current_node..contentobject_id}" />
<input type="hidden" name="NodeID" value="{$current_node_id}" />
<input type="hidden" name="ClassID" value="47" />
<input type="submit" name="NewButton" value="Submit" id="btn-submit" style="display:none"/>
</form>

{if $top_menu_items_count}
{foreach $top_menu_items as $key => $item}
{set $item_class = array()
     $item_dropdown_class = array()
     $level_2_items = fetch('content', 'list', hash( 'parent_node_id', $item.node_id, 'sort_by', array( 'priority', false() ), 'limit', $level_2_limit))}
{set $item_class = $item_class|append("nav-link")}
{if $current_node_in_path|eq($item.node_id)}
{set $item_class = $item_class|append("active")}
{/if}
{if $key|eq(0)}
{set $item_class = $item_class|append("firstli")}
{/if}
{if $top_menu_items_count|eq($key|inc)}
{set $item_class = $item_class|append("lastli")}
{/if}
{if $item.node_id|eq($current_node_id)}
{set $item_class = $item_class|append("current")}
{/if}

{if eq( $item.class_identifier, 'link')}
{*Main Uthenticated History Login Link*}

<li class="dropdown" id="node_id_{$item.node_id}">

{*$item.data_map.location.data_text|attribute(show,1)*}

{if or( $item.data_map.location.content|ne('/submit'),
$item.data_map.location.content|eq('/content/view/sitemap/2'), $item.data_map.location.content|eq('/content/search/full/2'))}

{run-once}
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href="{if $current_node.depth|lt(2)}https://digg.one/submit{else}https://digg.one/c#select-a-category-first{/if}"
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {else}
  onclick="{if $current_node.depth|gt(2)}document.getElementById('btn-submit').click(); return false;{else}{/if}"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>submit</a>
{/run-once}
{*elseif $item.data_map.location.data_text|eq('/user/login' )*}
{*
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href=#
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {else}
  onclick="document.getElementById('btn-submit').click(); return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>submit</a>
*}
</li>
{if or( $item.data_map.location.data_text|eq('sitemap'), $item.data_map.location.data_text|eq('search'))}

<li id="node_id_{$item.node_id}">

<a 
{if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}
  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>
{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
{/if}




{* MAIN LOGIN CASE : See Bellow *}
{if $current_user.contentobject_id|eq(10)}
{if and( $current_user.contentobject_id|eq(10), $item.data_map.location.content|ne('/user/login' ),  )}

<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href=#
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {else}
  onclick="document.getElementById('btn-submit').click(); return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>submit</a>
{/if}
{elseif and( $currrent_user.contentobject_id|eq(10),$item.data_map.location.content|ne('/user/login' ) )}

<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href=#
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {else}
  onclick="document.getElementById('btn-submit').click(); return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>submit</a>







{elseif and($item.class_identifier|eq( 'link' ), $item.data_map.location.content|ne( '/user/login' ),  $item.data_map.location.content|eq( '/content/search/full/2' ) )}

{*

<a 
{if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}
  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>
{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
*}

{/if}

{/if}


{if and( $current_user.contentobject_id|ne(10), $item.data_map.location.content|ne('/user/logout' ),  )}
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$cu_main_node_uri|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>{$current_user.login|wash()}999999999</a>

<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={concat("/user/logout")|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>logout999999111111111111</a>
  
{elseif and( $current_user.contentobject_id|ne(10), $item.data_map.location.content|eq('/user/login' ) )}
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$cu_main_node_uri|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>{$current_user.login|wash()}</a>
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={concat("/user/logout")|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}

  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>logout</a>

  {/if}

 </li>
{/if}
{*{$item.name}<hr>*}

{if and( $current_user.contentobject_id|eq('10'), or( $item.data_map.location.data_text|eq('login'), $item.data_map.location.data_text|eq('signup') ))}
<a 
{if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}
  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>
{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
{/if}


{*if or( $item.name|eq('about'), $item.name|eq('diggall'))}
<li id="node_id_{$item.node_id}">
<a
{if eq( $ui_context, 'browse' )} href={concat("content/browse/", $item.node_id)|ezurl}{else} href={$item.url_alias|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank" {/if}
{/if}
{if $pagedata.is_edit} onclick="return false;" {/if}
title="{$item.data_map.location.data_text|wash}"
role="button"
{if $item_class} class="{$item_class|implode(" ")}"{/if}
rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}777777777777xxxxx{else}{$item.name|wash()}{/if}</a>
  </li>
{/if *}


{* $item|attribute(show,1)}<hr /> *}
{* <b>{$item.class_identifier|attribute(show,1)}</b> *}

{if and( $item.children_count|eq(0),
and( $item.class_identifier|eq( 'link' ), $item.data_map.location.content|ne( '/user/login' ),  ) )}
{*set $item_class=array()*}

{*
<li class="dropdown">

<a role="button" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}
{if $item_class}class="{$item_class|implode(" ")}"{/if}
{if $pagedata.is_edit}
onclick="return false;"
{/if}>{$item.name|wash()}77777777777777</a>
*}

<a 
{if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}
  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  {if $item_class}class="{$item_class|implode(" ")}"{/if}
  rel={$item.url_alias|ezurl}>
{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>

{/if}

{if $item.class_identifier|eq( 'category' )}
<li class="dropdown">
  <div class="dropdown-button">
    <a href={$item.url_alias|ezurl} class="dropdown-link {*$item_class|implode(" ")*}" role="button">{$item.name|wash()}</a>
    {if $item.children|count}<button type="button" class="dropdown-toggle" aria-label="dropdown toggler button"></button>{/if}
  </div>
{/if}

{if and( $item.class_identifier|eq( 'folder' ), $item.node_id|ne( 687 ) )}
<li class="dropdown">
  <div class="dropdown-button">
    <a href={$item.url_alias|ezurl} class="dropdown-link {if $item.node_id|eq( 807 )}contact-page{/if} {*$item_class|implode(" ")*}" role="button">{$item.name|wash()}</a>
    {if $item.children|count}<button type="button" class="dropdown-toggle" aria-label="dropdown toggler button"></button>{/if}
  </div>
{/if}


{if $top_level_exclude_items|contains( $item.node_id )}{continue}{/if}

{if $level_2_items|count()}
<div class="dropdown-menu">
<div>
<ul class="dropdown-nav">

{foreach $level_2_items as $key => $item}
 {set $item_class = array()}
 {set $item_class = $item_class|append("dropdown-link")}

 {if $current_node_in_path_2|eq($item.node_id)}
  {set $item_class = $item_class|append("active")}
 {/if}
 {if $key|eq(0)}
  {set $item_class = $item_class|append("firstli")}
 {/if}
 {if $top_menu_items_count|eq( $key|inc )}
  {set $item_class = $item_class|append("lastli")}
 {/if}
 {if $item.node_id|eq( $current_node_id )}
  {set $item_class = $item_class|append("current")}
 {/if}
{if eq( $item.class_identifier, 'link')}
<li id="node_id_{$item.node_id}">
<a
{if eq( $ui_context, 'browse' )} href={concat("content/browse/", $item.node_id)|ezurl}{else} href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank" {/if}
{/if}
{if $pagedata.is_edit} onclick="return false;" {/if}
title="{$item.data_map.location.data_text|wash}"
role="button"
{if $item_class} class="{$item_class|implode(" ")}"{/if}
rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
  </li>
{else}
<li>
<a
href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}
{if $item_class} class="{$item_class|implode(" ")}"{/if}
{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
</li>
 {/if}
{/foreach}
</ul>
 </div>
</div>
</li>
 {/if}
{/foreach}
  {/if}
 </ul>
</div>

{undef $level_2_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2}

{* Top menu content: END *}