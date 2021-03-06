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

{block name='cart_detailed_actions'}
	<section class="cart-detailed-actions">	

		{if $cart.minimalPurchaseRequired}
			{include 
				file='_partials/notifications.tpl' 
				notifications=["warning"=>{$cart.minimalPurchaseRequired}]
			}
		{/if}
		
		{block name='continue_shopping'}
			<a 
				href="{$urls.pages.index}" 
				rel="nofollow" 
				class="button icon-basket-loaded"
				>{l s='Continue shopping' d='Shop.Theme.Actions'}
			</a>
		{/block}

		{if $cart.minimalPurchaseRequired || empty($cart.products)}
			<button 
				class="button submit icon-check" 
				disabled
				>{l s='Checkout' d='Shop.Theme.Actions'}
			</button>
		{else}
			<a 
				href="{$urls.pages.order}" 
				rel="nofollow" 
				class="button submit icon-check"
				>{l s='Checkout' d='Shop.Theme.Actions'}
			</a>
			{hook h='displayExpressCheckout'}
		{/if}

	</section>
{/block}