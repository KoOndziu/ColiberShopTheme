{** 
 * 2019-2020 Konrad Kubala
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 *}

{function name="menu" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul data-depth="{$depth}">
        {foreach from=$nodes item=node}
          <li class="{$node.type}{if $node.current} current{/if}">
            <a href="{$node.url}" {if $node.open_in_new_window} target="_blank" {/if}>{$node.label}</a>
			{menu nodes=$node.children depth=$node.depth}
			{if $node.image_urls|count}
			  <div class="menu-images-container">
				{foreach from=$node.image_urls item=image_url}
				  <img src="{$image_url}">
				{/foreach}
			  </div>
			{/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

{menu nodes=$menu.children}