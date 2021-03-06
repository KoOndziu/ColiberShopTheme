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

{extends file='page.tpl'}

{block name='page_header_container'}{/block}

{block name='page_content'}
  <section class="page-content page-authentication">
    {block name='login_form_container'}
      <header>
        <h1>{l s='Sign in' d='Shop.Theme.Actions'}</h1>
        <span>
          {{l s='No account? Create one here' d='Shop.Theme.Customeraccount'}|regex_replace:"/(?<=\?\s).*/":""}
					<a 
            href="{$urls.pages.register}" 
            data-link-action="display-register-form"
            >{{l s='No account? Create one here' d='Shop.Theme.Customeraccount'}|regex_replace:"/.*(?<=\?\s)/":""}!
					</a>
				</span>
      </header>
      <section class="login-form">
        {render file='customer/_partials/login-form.tpl' ui=$login_form}
      </section>
      {block name='display_after_login_form'}
        {hook h='displayCustomerLoginFormAfter'}
      {/block}
    {/block}
  </section>
{/block}
