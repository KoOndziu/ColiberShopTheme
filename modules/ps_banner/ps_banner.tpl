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

<a 
  class="banner" 
  href="{$banner_link}"
  {if isset($banner_img)}
    style="background-image: url({$banner_img});" 
    title="{$banner_desc}"
  {/if}>
  <span>{$banner_desc nofilter}</span>
</a>