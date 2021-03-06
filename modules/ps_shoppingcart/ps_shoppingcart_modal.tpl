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

{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
  {assign var="modal" value=[
      'id' => 'ps-shoppingcart-modal',	
      'data-refresh-url' => $refresh_url,
			'class' => 'modal modal-right'
  ]}
{/block}

{block name='modal_title'}
  {l s='Cart' d='Shop.Theme.Actions'}
{/block}

{block name='modal_body'}

  {block name='cart_overview'}
    {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
  {/block}

  {block name='cart_totals'}
    {include file='checkout/_partials/cart-detailed-totals.tpl'}
  {/block}

{/block}

{block name='modal_footer'}
  <a 
    class="icon-basket button" 
    rel="nofollow" 
    href="{$cart_url}"
    >{l s='Cart' d='Shop.Theme.Actions'}
  </a>

  {hook h='displayExpressCheckout'}
  <a 
    href="{$urls.pages.order}" 
    rel="nofollow" 
    class="button submit icon-check js-checkout-button {if $cart.minimalPurchaseRequired || empty($cart.products)}disabled{/if}"
    >{l s='Checkout' d='Shop.Theme.Actions'}
  </a>
{/block}