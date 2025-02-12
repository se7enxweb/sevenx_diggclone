{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="block">
{*
<div class="element">
<label>{'User ID'|i18n( 'design/standard/content/datatype' )}:</label>
{$attribute.content.contentobject_id}
</div>

<div class="element">
<label>{'Username'|i18n( 'design/standard/content/datatype' )}:</label>
{$attribute.content.login|wash( xhtml )}
</div>

<div class="element">
<label>{'Email'|i18n( 'design/standard/content/datatype' )}:</label>
<a href="mailto:{$attribute.content.email|wash}">{$attribute.content.email|wash}</a>
</div>

<div class="element">
<label>{'Account status'|i18n( 'design/admin/content/datatype/ezuser' )}:</label>
    {if $attribute.content.is_enabled}
	<span class="userstatus-enabled">{'enabled'|i18n( 'design/standard/content/datatype' )}</span>
    {else}
	<span class="userstatus-disabled"> {'disabled'|i18n( 'design/standard/content/datatype' )}</span>
    {/if}

    {if $attribute.content.is_locked}
	(<span class="userstatus-disabled">{'locked'|i18n( 'design/standard/content/datatype' )}</span>)
    {/if}
</div>

<div class="break"></div>
</div>
<p><a href={concat( '/user/setting/', $attribute.contentobject_id )|ezurl} title="{'Enable/disable the user account and set the maximum allowed number of concurrent logins.'}">{'Configure user account settings'|i18n( 'design/standard/content/datatype' )}</a></p>
*}