<div class="info">
{translate('Please specify your operating system information, check your path settings, and select a default timezone and a default backend language')}
</div>

<table>
  <tbody>
    <tr>
      <td>{translate('Server Operating System')}</td>
      <td>
        <input type="radio" tabindex="1" name="installer_operating_system" id="installer_operating_system_linux"
		       onclick="document.getElementById('file_perms_box').style.display = 'table-row';" value="linux"
			   {if $is_linux}checked="checked"{/if} />
		<label for="installer_operating_system_linux" style="cursor: pointer;" onclick="document.getElementById('file_perms_box').style.display = 'table-row';">{translate('Linux/Unix based')}</label>
		<br />
		<input type="radio" tabindex="5" name="installer_operating_system" id="installer_operating_system_windows"
		       onclick="document.getElementById('file_perms_box').style.display = 'none';" value="windows"
			   {if $is_windows}checked="checked"{/if} />
		<label for="installer_operating_system_windows" style="cursor: pointer;" onclick="document.getElementById('file_perms_box').style.display = 'none';">Windows</label>
      </td>
	</tr>
	<tr id="file_perms_box" style="display:{if $is_linux}table-row{else}none{/if};">
      <td>
		<label for="installer_world_writeable">{translate('World-writeable file permissions')} (777)</label><br />
        <span style="font-size: 10px; color: #666666;">({translate('Please note: only recommended for testing environments')})</span>
      </td>
	  <td>
	    <input type="checkbox" tabindex="6" name="installer_world_writeable" id="installer_world_writeable" value="true" />
      </td>
	</tr>
    <tr{if $errors.installer_session_save_path} class="fail"{/if}>
      <td><label for="installer_session_save_path">{translate('Session path')}</label></td>
      <td>
        <input type="text" tabindex="1" name="installer_session_save_path" id="installer_session_save_path" style="width: 97%;" value="{if $installer_session_save_path}{$installer_session_save_path}{else}temp/session{/if}" />
        {if $errors.installer_session_save_path}<br /><span>{$errors.installer_session_save_path}</span>{/if}
      </td>
	</tr>
    <tr{if $errors.installer_cat_url} class="fail"{/if}>
      <td><label for="installer_cat_url">{translate('Absolute URL')}</label></td>
      <td>
        <input type="text" tabindex="1" name="installer_cat_url" id="installer_cat_url" style="width: 97%;" value="{$installer_cat_url}" />
        {if $errors.installer_cat_url}<br /><span>{$errors.installer_cat_url}</span>{/if}
      </td>
	</tr>
{if $ssl_available === true}
    <tr{if $errors.installer_ssl} class="fail"{/if}>
      <td><label for="installer_ssl">{translate('Use SSL for Backend')}</label></td>
      <td>
        <input type="checkbox" tabindex="2" name="installer_ssl" id="installer_ssl" value="true"{if $installer_ssl==true} checked="checked"{/if} />
        {if $errors.installer_ssl}<br /><span>{$errors.installer_ssl}</span>{/if}
        <span style="font-size: 10px; color: #666666;">{translate('The installer has detected that SSL (https) seems to be available on this host. We recommend to use it for the backend to protect your data. Unfortunately, SSL detection is not reliable, so you may have to deactivate it later in your config.php.')}</span>
      </td>
	</tr>
{/if}
	<tr>
      <td><label for="installer_default_timezone_string">{translate('Default Timezone')}</label></td>
      <td>
        <select id="installer_default_timezone_string" name="installer_default_timezone_string" tabindex="2">
		  {foreach $timezones zone}
		  <option value="{$zone}"{if $zone == $installer_default_timezone_string} selected="selected"{/if}>{$zone}</option>
		  {/foreach}
        </select>
	  </td>
	</tr>
	<tr>
      <td><label for="installer_default_language">{translate('Default Language')}</label></td>
      <td>
        <select id="installer_default_language" name="installer_default_language" tabindex="3">
		  {foreach $languages abbr lang}
		  <option value="{$abbr}"{if $abbr == $installer_default_language} selected="selected"{/if}>{$lang}</option>
		  {/foreach}
        </select>
	  </td>
	</tr>
   <tr>
      <td><label for="installer_default_wysiwyg">{translate('Default WYSIWYG Editor')}</label></td>
      <td>
        {if ! count($editors)}
        <input type="hidden" id="installer_default_wysiwyg" name="installer_default_wysiwyg" value="" />
        {translate('None found')}
        {else}
        <select id="installer_default_wysiwyg" name="installer_default_wysiwyg" tabindex="4">
		  {foreach $editors dir name}
		  <option value="{$dir}"{if $dir == $installer_default_wysiwyg} selected="selected"{/if}>{$name}</option>
		  {/foreach}
        </select>
        {/if}
        <span style="width:55%;float:right;display:none;" id="installer_default_wysiwyg_optional_info">{translate('Please do not forget to check this Add-On at the [Optional] step! The WYSIWYG Editor will not work otherwise!')}</span>
	  </td>
	</tr>
  </tbody>
</table>
