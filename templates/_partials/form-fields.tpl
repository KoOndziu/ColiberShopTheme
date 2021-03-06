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

{$autocomplete =
['firstname' => 'given-name',
'lastname' => 'family-name',
'email'=>'email',
'password'=>'current-password',
'new_password'=>'new-password',
'postcode'=>'postal-code',
'birthday'=>'bday',
'address1'=>'street-address',
'address2'=>'address-line2',
'id_state'=>'address-level1',
'city'=>'address-level2',
'company'=>'organization'
]}
{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}

{else}
  {assign var=uniqId value=10|mt_rand:100000}

  <div class="form-group" data-field-type="{$field.type}">
    
    {if $field.type == 'checkbox' || $field.type == 'radio-buttons'}
      
      {if $field.type == 'radio-buttons'}
        <div class="label">{$field.label}</div>
      {/if}
      
    {else}
      
      <label 
        class="{if $field.required}required{/if}" 
        for="f-{$field.name}_{$uniqId}"
        >{$field.label}
        {block name='form_field_comment'}
          {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
            <small class="text-muted">({l s='Optional' d='Shop.Forms.Labels'})</small>
          {/if}
        {/block}
      </label>
      
    {/if}


    {if $field.type === 'select'}

      {block name='form_field_item_select'}
        <select 
          class="form-select{if !empty($field.errors)} is-invalid{/if}" 
          name="{$field.name}" 
          id="f-{$field.name}_{$uniqId}"
          {if $field.required} required{/if}
        >
          <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
          {foreach from=$field.availableValues item="label" key="value"}
            <option value="{$value}" {if $value eq $field.value} selected{/if}>{$label}</option>
          {/foreach}
        </select>
      {/block}

    {elseif $field.type === 'countrySelect'}

      {block name='form_field_item_country'}
        <select
          class="form-select js-country{if !empty($field.errors)} is-invalid{/if}"
          name="{$field.name}"
          id="f-{$field.name}_{$uniqId}"
          {if $field.required}required{/if}
          >
            <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
        </select>
      {/block}

    {elseif $field.type === 'radio-buttons'}

      {block name='form_field_item_radio'}
        {foreach from=$field.availableValues item="label" key="value" name="radiolist"}
          <div class="form-check">
            <input
              name="{$field.name}"
              type="radio"
              value="{$value}"
              class="form-check-input {if !empty($field.errors)} is-invalid{/if}"
              id="f-{$field.name}_{$uniqId}-{$smarty.foreach.radiolist.iteration}"
              {if $field.required}required{/if}
              {if $value eq $field.value} checked {/if}
            >
            <label 
              class="form-check-label" 
              for="f-{$field.name}_{$uniqId}-{$smarty.foreach.radiolist.iteration}"
              >{$label}
            </label>
          </div>
        {/foreach}

      {/block}

    {elseif $field.type === 'checkbox'}

      {block name='form_field_item_checkbox'}
        <div class="form-check">
          <input 
            name="{$field.name}" 
            type="checkbox" value="1" 
            id="f-{$field.name}_{$uniqId}" 
            class="form-check-input{if !empty($field.errors)} is-invalid{/if}"
            {if $field.value} checked="checked"{/if}
            {if $field.required} required{/if}
          >
          <label 
            class="form-check-label" 
            for="f-{$field.name}_{$uniqId}"
            >{if !$field.required}<span class="text-muted">({l s='Optional' d='Shop.Forms.Labels'}) </span>{/if}{$field.label nofilter}
          </label>
        </div>
      {/block}

    {elseif $field.type === 'date'}

      {block name='form_field_item_date'}
        <input 
          name="{$field.name}" 
          class="form-control{if !empty($field.errors)} is-invalid{/if}" 
          type="date" 
          value="{$field.value}" 
          placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" 
          id="f-{$field.name}_{$uniqId}"{if isset($autocomplete[$field.name])} 
          autocomplete="{$autocomplete[$field.name]}"{/if}
        >
        {if isset($field.availableValues.comment)}
          <span class="form-text text-muted">
            {$field.availableValues.comment}
          </span>
        {/if}
      {/block}

    {elseif $field.type === 'birthday' || ($field.type === 'text' && $field.name === 'birthday')}

      {block name='form_field_item_birthday'}
        <input
          class="form-control{if !empty($field.errors)} is-invalid{/if}"
          name="{$field.name}"
          type="date"
          value="{$field.value}"
          id="f-{$field.name}_{$uniqId}"
          placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{else}{$field.label}{/if}"
          {if $field.required}required{/if}
          {if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}
        >
        {if isset($field.availableValues.comment)}
          <small class="form-text text-muted">
            {$field.availableValues.comment}
          </small>
        {/if}
          
         <div class="js-parent-focus">
          <!--
          {html_select_date
                        field_order=DMY
                        time=null
                        field_array={$field.name}
                        prefix=false
                        reverse_years=true
                        field_separator=''
                        day_extra='class="form-control form-control-select"'
                        month_extra='class="form-control form-control-select"'
                        year_extra='class="form-control form-control-select"'
                        day_empty={l s='-- day --' d='Shop.Forms.Labels'}
                        month_empty={l s='-- month --' d='Shop.Forms.Labels'}
                        year_empty={l s='-- year --' d='Shop.Forms.Labels'}
                        start_year={'Y'|date}-100 end_year={'Y'|date}
          }-->
        </div>
      {/block}

    {elseif $field.type === 'password'}

      {block name='form_field_item_password'}
        <div class="input-group js-parent-focus">
          <input
            class="form-control js-child-focus js-visible-password{if !empty($field.errors)} is-invalid{/if}"
            name="{$field.name}"
            id="f-{$field.name}_{$uniqId}"
            type="password"
            value=""
            pattern=".{literal}{{/literal}5,{literal}}{/literal}"
            {if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}
            {if $field.required}required{/if}
          >
          <button
            class="btn btn-light icon-eye"
            type="button"
            data-action="show-password"
            data-text-show="{l s='Show' d='Shop.Theme.Actions'}"
            data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}"
            title="{l s='Show' d='Shop.Theme.Actions'}"
            tabindex="-1"
          ></button>
        </div>
        <small class="form-text text-muted">{l s='At least 5 characters long' d='Shop.Forms.Help'}</small>
      {/block}
      
    {elseif $field.type === 'file'}
      
      <div class="form-file">
        <input 
          name="{$field.name}" 
          type="file" 
          class="form-file-input{if !empty($field.errors)} is-invalid{/if}" 
          id="f-{$field.name}_{$uniqId}"
          {if $field.required} required{/if}
        >
        <label 
          class="form-file-label" 
          for="f-{$field.name}_{$uniqId}" 
          data-browse="{l s='Choose file' d='Shop.Theme.Actions'}"
          >
            <span class="form-file-text">{l s='Choose file' d='Shop.Theme.Actions'}...</span>
            <span class="form-file-button">{l s='Choose file' d='Shop.Theme.Actions'}</span>
        </label>
      </div>
      
    {else}
      
      {block name='form_field_item_other'}
        <input
          class="form-control{if !empty($field.errors)} is-invalid{/if}"
          name="{$field.name}"
          type="{if $field.name === "phone" || $field.name === "phone_mobile"}tel{else}{$field.type}{/if}"
          value="{$field.value}"
          id="f-{$field.name}_{$uniqId}"
          placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}"
          autocorrect="off"
          {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
          {if $field.required}required{/if}
          {if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}
          >
        {if isset($field.availableValues.comment)}
          <small class="form-text text-muted">
            {$field.availableValues.comment}
          </small>
        {/if}
      {/block}
      
    {/if}
    
    {block name='form_field_errors'}
      {if $field.type !== 'checkbox'}
        {include file='_partials/form-errors.tpl' errors=$field.errors required=$field.required label=$field.label}
      {/if}
    {/block}
  </div>
{/if}