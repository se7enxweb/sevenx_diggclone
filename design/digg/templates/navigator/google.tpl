{default page_uri_suffix=false()
         left_max=6
         right_max=6}
{default name=ViewParameter
         page_uri_suffix=false()
         left_max=$left_max
         right_max=$right_max}

{let page_count=int( ceil( div( $item_count,$item_limit ) ) )
      current_page=min($:page_count,
                       int( ceil( div( first_set( $view_parameters.offset, 0 ),
                                       $item_limit ) ) ) )
      item_previous=sub( mul( $:current_page, $item_limit ),
                         $item_limit )
      item_next=sum( mul( $:current_page, $item_limit ),
                     $item_limit )

      left_length=min($ViewParameter:current_page,$:left_max)
      right_length=max(min(sub($ViewParameter:page_count,$ViewParameter:current_page,1),$:right_max),0)
      view_parameter_text=""
      offset_text=eq( ezini( 'ControlSettings', 'AllowUserVariables', 'template.ini' ), 'true' )|choose( '/offset/', '/(offset)/' )}
{* Create view parameter text with the exception of offset *}
{section loop=$view_parameters}
 {section-exclude match=$:key|eq('offset')}
 {section-exclude match=$:item|eq('')}
 {set view_parameter_text=concat($:view_parameter_text,'/(',$:key,')/',$:item)}
{/section}


{section show=$:page_count|gt(1)}

<div class="pages">

{* <span class="nextprev">« Previous</span> *}


     {switch match=$:item_previous|lt(0) }
       {case match=0}
{*       	<span class="current">1</span> *}
       <span class="previous"><a href={concat($page_uri,$:item_previous|gt(0)|choose('',concat($:offset_text,$:item_previous)),$:view_parameter_text,$page_uri_suffix)|ezurl}><span class="text">&laquo;&nbsp;{"Previous"|i18n("design/standard/navigator")}</span></a></span>
       {/case}
       {case match=1}
       {/case}
     {/switch}

<span class="pages">
{if $:current_page|gt($:left_max)}
<a href={concat($page_uri,$:view_parameter_text,$page_uri_suffix)|ezurl}>1</a>
{if sub($:current_page,$:left_length)|gt(1)}
...
{/if}
{/if}

    {section loop=$:left_length}
        {let page_offset=sum(sub($ViewParameter:current_page,$ViewParameter:left_length),$:index)}
          <span class="other"><a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span>
        {/let}
    {/section}

        <span class="current">{$:current_page|inc}</span>

    {section loop=$:right_length}
        {let page_offset=sum($ViewParameter:current_page,1,$:index)}
          <span class="other"><a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span>
        {/let}
    {/section}

{if $:page_count|gt(sum($:current_page,$:right_max,1))}
{if sum($:current_page,$:right_max,2)|lt($:page_count)}
<span class="other">...</span>
{/if}
<span class="other"><a href={concat($page_uri,$:page_count|dec|gt(0)|choose('',concat($:offset_text,mul($:page_count|dec,$item_limit))),$:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_count}</a></span>
{/if}

</span>

</p>
<div class="break"></div>

{*
<a href="/web/20060209041253/http://www.digg.com/index/page2" title="Go to page 2">2</a><a href="/web/20060209041253/http://www.digg.com/index/page3" title="Go to page 3">3</a><a href="/web/20060209041253/http://www.digg.com/index/page4" title="Go to page 4">4</a><a href="/web/20060209041253/http://www.digg.com/index/page5" title="Go to page 5">5</a><a href="/web/20060209041253/http://www.digg.com/index/page6" title="Go to page 6">6</a><a href="/web/20060209041253/http://www.digg.com/index/page7" title="Go to page 7">7</a><a href="/web/20060209041253/http://www.digg.com/index/page8" title="Go to page 8">8</a><a href="/web/20060209041253/http://www.digg.com/index/page9" title="Go to page 9">9</a><a href="/web/20060209041253/http://www.digg.com/index/page10" title="Go to page 10">10</a><span>...</span><a href="/web/20060209041253/http://www.digg.com/index/page1001" title="Go to page 1001">1001</a><a href="/web/20060209041253/http://www.digg.com/index/page1002" title="Go to page 1002">1002</a>

<a href="/web/20060209041253/http://www.digg.com/index/page2" class="nextprev" title="Go to Next Page">Next »</a>
*}
    {switch match=$:item_next|lt($item_count)}
      {case match=1}
        <span class="nextprev"><a href={concat($page_uri,$:offset_text,$:item_next,$:view_parameter_text,$page_uri_suffix)|ezurl}><span class="text">{"Next"|i18n("design/standard/navigator")}&nbsp;&raquo;</span></a></span>
      {/case}
      {case}
      {/case}
    {/switch}



</div>


{/section}

 {/let}
{/default}
{/default}

