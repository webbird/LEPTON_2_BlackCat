	{get_page_footers('backend')}
	<div class="clear"></div>
</div>
<div class="clear"></div>
<div id="fc_footer" class="fc_gradient1 fc_border">
	{if $permissions.pages}
	<div id="fc_sidebar_footer">
		{*<span class="icon-plus fc_gradient1 fc_gradient_hover fc_side_add" title="{translate('Add Page')}"></span>*}
	</div>
	{/if}
	<div id="fc_content_footer" {if !$permissions.pages} class="fc_no_sidebar"{/if}>
		{$CAT_CORE}: {$CAT_VERSION} | {$THEME_NAME}: {$THEME_VERSION} -
		<!-- Please note: the below reference to the GNU GPL should not be removed, as it provides a link for users to read about warranty, etc. -->
		<a href="{$URL_HELP}" title="Black Cat CMS" target="_blank">Black Cat CMS</a> is released under the <a href="http://www.gnu.org/licenses/gpl.html" title="Black Cat CMS Core is GPL" target="_blank">GNU General Public License</a>.
		<!-- Please note: the above reference to the GNU GPL should not be removed, as it provides a link for users to read about warranty, etc. 
		<a href="{$URL_HELP}" title="Black Cat CMS Bundle" target="_blank">Black Cat CMS Bundle</a> is released under several different licenses.-->
	</div>
</div>
</body>
</html>