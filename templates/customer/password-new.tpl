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

{block name='page_title'}
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form class="password-form" action="{block name='form_new_password_actionurl'}{$urls.pages.password}{/block}" method="post">
    
    <header>
      <p>
        {l 
          s='Email address: %email%' 
          d='Shop.Theme.Customeraccount' 
          sprintf=['%email%' => "<strong>{$customer_email|stripslashes}</strong>"]
        }
      </p>
    </header>
    
    <input type="hidden" name="token" id="token" value="{$customer_token}">
    <input type="hidden" name="id_customer" id="id_customer" value="{$id_customer}">
    <input type="hidden" name="reset_token" id="reset_token" value="{$reset_token}">

    {block name='form_new_password_form_fields'}
      {foreach 
        from=[
          [
            'type' => 'password',
            'errors' => null,
            'label' => {l s='New password' d='Shop.Forms.Labels'},
            'name' => 'passwd',
            'required' => 1
          ],[
            'type' => 'password',
            'errors' => null,
            'label' => {l s='Confirmation' d='Shop.Forms.Labels'},
            'name' => 'confirmation',
            'required' => 1
          ]
        ] 
        item="field"
      }
        {block "form_field"}
          {form_field field=$field}
        {/block}
      {/foreach}
    {/block}

    {block name='form_new_password_footer'}
      <footer>
        <a 
          class="button icon-action-undo" 
          href="{$urls.pages.authentication}"
          >{l s='Back to Login' d='Shop.Theme.Actions'}
        </a>
        <button
          class="icon-shuffle"
          type="submit" 
          name="submit"
          >{l s='Change Password' d='Shop.Theme.Actions'}
        </button>
      </footer>
    {/block}
  </form>
{/block}