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

{block name='cart_voucher'}
  {if $cart.vouchers.allowed}
    <div class="cart-voucher">
			<section class="grid promos js-discount">
				<article>
					<header>
						<span class="h2">{l s='Have a promo code?' d='Shop.Theme.Checkout'}</span>
					</header>
					{block name='cart_voucher_notifications'}
						<div class="notification notification-error js-error">
							<span class="js-error-text"></span>
						</div>
					{/block}
					{block name='cart_voucher_form'}
						<form 
							id="voucher_form"
							class="form-voucher input-text"
							action="{$urls.pages.cart}" 
              data-action="addDiscount"
							method="post"
						>
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="addDiscount" value="1">
							<input type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
							<button 
								type="submit" 
								class="icon-plus"
								title="{l s='Add' d='Shop.Theme.Actions'}"
							></button>
						</form>
					{/block}
				</li>
				
				{foreach from=$cart.vouchers.added item=voucher}
					<li>
						<header>
							<span class="h2">{$voucher.name}</span>
							<nav>
								<a 
									href="{$voucher.delete_url}" 
									class="button icon-trash"
									title="{l s='Remove' d='Shop.Theme.Actions'}"
									data-action="removeVoucher"
								></a>
							</nav>
						</header>
						<p>
							{l s='Discount' d='Shop.Theme.Checkout'}<br>
							{$voucher.reduction_formatted}
						</p>              
					</li>
				{/foreach}
				
				{foreach from=$cart.discounts item=discount}
					<li>
						<header>
							<span class="h2">{$discount.name}</span>
							<nav>
								<button 
									class="icon-plus code" 
                  data-url="{$urls.pages.cart}" 
                  data-action="addDiscount"
                  data-token="{$static_token}"
									data-code="{$discount.code}"
									title="{l s='Add' d='Shop.Theme.Actions'}"
                ></button>
							</nav>
						</header>
						<a 
              class="code" 
              data-url="{$urls.pages.cart}" 
              data-action="addDiscount"
              data-token="{$static_token}"
              data-code="{$discount.code}"
              >{$discount.code}
            </a>
						<p>{$discount.description}</p>
					</article>
				{/foreach}
			</section>

    </div>
  {/if}
{/block}
