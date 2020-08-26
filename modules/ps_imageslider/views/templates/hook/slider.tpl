{if $homeslider.slides}
  <div 
		class="slick slider homeslider headslide" 
		data-autoplay="true"
		data-interval="{$homeslider.speed}" 
		data-wrap="{$homeslider.wrap}" 
		data-pause="{$homeslider.pause}"
		data-slick
	>
    {for $j=1 to ($homeslider.slides|count == 1) ? 1 : 3}
      {foreach from=$homeslider.slides item=slide}
        <div class="headslide-slide">
          <div class="headslide-thumb">
            <img 
              class="" 
              src="{$slide.image_url}" 
              alt="{$slide.legend|escape}"
              title="{$slide.legend|escape}"
             >
          </div>
          <div class="content headslide-content">
            {if $slide.title}<h1 class="headslide-name slide-name check-text">{$slide.title}</h1>{/if}
            {if $slide.description}<div class="headslide-description slide-description check-text">{$slide.description nofilter}</div>{/if}
            {if $slide.legend}<span class="a headslide-legend slide-legend check-text see-more">{$slide.legend}</span>{/if}
          </div>
          <a href="{$slide.url}"></a>
        </div>
      {/foreach}
    {/for}
  </div>
{/if}
