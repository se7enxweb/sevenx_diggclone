{default attribute_base=ContentObjectAttribute}

<div class="block" style="display: block;">

<div class="block" style="">
<label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">{'Name'|i18n( 'design/standard/content/datatype' )}:</label>
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_option_name_{$attribute.id}" value="{$attribute.content.name|wash()}" />
</div>

<div class="block">
<label>{'Options'|i18n( 'design/standard/content/datatype' )}:</label>

{section show=$attribute.content.option_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight">&nbsp;</th>
    <th>{'Option'|i18n( 'design/standard/content/datatype' )}</th>
    {if $attribute.is_information_collector|not}
    <th>{'Additional price'|i18n( 'design/standard/content/datatype' )}</th>
    {/if}
</tr>

{section var=Options loop=$attribute.content.option_list sequence=array( bglight, bgdark )}
<tr class="{$Options.sequence}">

{* Remove. *}
<td>
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_{$Options.index}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="checkbox" name="{$attribute_base}_data_option_remove_{$attribute.id}[]" value="{$Options.item.id}" title="{'Select option for removal.'|i18n( 'design/standard/content/datatype' )}" />
<input type="hidden" name="{$attribute_base}_data_option_id_{$attribute.id}[]" value="{$Options.item.id}" />
</td>

{* Option. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_{$Options.index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_option_value_{$attribute.id}[]" value="{$Options.item.value|wash()}" /></td>

{if $attribute.is_information_collector|not}
{* Price. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_{$Options.index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_option_additional_price_{$attribute.id}[]" value="{$Options.item.additional_price|wash}" /></td>
{/if}

</tr>
{/section}

</table>
{section-else}
<p>{'There are no options.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}


{if $attribute.content.option_list}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_selected" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected options.'|i18n( 'design/standard/content/datatype' )}" />
{else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected options.'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/if}

<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_new_option" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_new_option]" value="{'Add option'|i18n('design/standard/content/datatype')}" title="{'Add a new option.'|i18n( 'design/standard/content/datatype' )}" />

</div>

</div>
{/default}