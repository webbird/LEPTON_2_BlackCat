<form action="{$CAT_URL}/modules/wrapper/save.php" method="post" class="ajax">
	<input type="hidden" name="page_id" value="{$PAGE_ID}" />
	<input type="hidden" name="section_id" value="{$SECTION_ID}" />
    <input type="hidden" name="_cat_ajax" value="1" />
 	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td align="left" width="50">
				{$TEXT.TYPE}:
			</td>
			<td>
				<select name="wrapper_type" id="wrapper_type">
				    <option value="object"{if $settings.wtype == 'object'} selected="selected"{/if}>object</option>
				    <option value="iframe"{if $settings.wtype == 'iframe'} selected="selected"{/if}>iframe</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left" width="50">
				{$TEXT.URL}:
			</td>
			<td>
				<input type="text" name="url" value="{$URL}" style="min-width:350px;" />
			</td>
		</tr>
		<tr>
			<td align="left" width="50">
				{$TEXT.HEIGHT}:
			</td>
			<td>
				<input type="text" name="height" value="{$settings.height}" maxlength="4" />
			</td>
		</tr>
		<tr>
			<td align="left" width="50">
				{$TEXT.WIDTH}:
			</td>
			<td>
				<input type="text" name="width" value="{$settings.width}" maxlength="4" />
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td align="left">
				<input type="submit" value="{$TEXT.SAVE}" style="width: 200px; margin-top: 5px;" />	</td>
			<td align="right">
				<input type="button" value="{$TEXT.CANCEL}" onclick="javascript: window.location = 'index.php';" style="width: 100px; margin-top: 5px;" />	</td>
		</tr>
	</table>
</form>
<p style="display: block; height: 10px;">
</p>