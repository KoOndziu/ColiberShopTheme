{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<section class="login-form">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>

    <header>
      <h2>{l s='Send a message' d='Modules.Contactform.Shop'}</h2>
      <p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Modules.Contactform.Shop'}</p>
    </header>

    {if $notifications}
      <ul class="notifications {if $notifications.nw_error}notification-error{else}notification-success{/if}">
        {foreach $notifications.messages as $notif}
          <li><div><i class="{if $notifications.nw_error}icon-close{else}icon-check{/if}"></i><div>{$notif}</div></div></li>
        {/foreach}
      </ul>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <section class="form-fields">
        <div class="form-group">
          <label for="contact-email">{l s='Email address' d='Modules.Contactform.Shop'}</label>
          <input id="contact-email" type="email" name="from" value="{$contact.email}" placeholder="{l s='Email address' d='Modules.Contactform.Shop'}" />
        </div>
        
        <div class="form-group">
          <label for="contact-subject">{l s='Subject Heading' d='Modules.Contactform.Shop'}</label>
          <select class="form-select" id="contact-subject" name="id_contact">
            {foreach from=$contact.contacts item=contact_elt}
              <option value="{$contact_elt.id_contact}">{$contact_elt.name} - {$contact_elt.description}</option>
            {/foreach}
          </select>
        </div>

        {if count($contact.orders) > 1}
        <div class="form-group">
          <label for="contact-order">{l s='Order reference' d='Modules.Contactform.Shop'}</label>
          <select class="form-select" id="contact-order" name="id_order">
            <option value="">{l s='Select reference' d='Modules.Contactform.Shop'}</option>
            {foreach from=$contact.orders item=order}
              <option value="{$order.id_order}">{$order.reference}</option>
            {/foreach}
          </select>
        </div>
        {/if}

        {if $contact.allow_file_upload}
        <div class="form-group">
          <label for="contact-file">{l s='Attach File' d='Modules.Contactform.Shop'}</label>
          <input id="contact-file" type="file" name="fileUpload" />
        </div>
        {/if}

        <div class="form-group">
          <label for="contact-message">{l s='Message' d='Modules.Contactform.Shop'}</label>
          <textarea id="contact-message" name="message"placeholder="{l s='Message' d='Modules.Contactform.Shop'}">{if $contact.message}{$contact.message}{/if}</textarea>
        </div>
        
        <ul class="list">
          <li>{hook h='displayGDPRConsent' id_module=$id_module}</li>
        </ul>
      </section>

      <footer class="form-footer">
        <input type="text" name="url" value="" style="display: none !important"/>
        <input type="hidden" name="token" value="{$token}" />
        <button class="icon-paper-plane" type="submit" name="submitMessage">
          {l s='Send' d='Modules.Contactform.Shop'}
        </button>
      </footer>
    {/if}
  </form>
</section>
