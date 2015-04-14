# Export
module.exports = (BasePlugin) ->
	# Define
	class addThisPlugin extends BasePlugin
		# Name
		name: 'addthis'

		# For the fixed/flaoting AddThis bar.
		addthisWidget: (type,style,trackUrlCopy) ->
			if trackUrlCopy is true
				trackCode = """<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>"""
			else trackCode = ""

			preferred_btns = """
				<a class="addthis_button_preferred_1"></a>
						<a class="addthis_button_preferred_2"></a>
						<a class="addthis_button_preferred_3"></a>
						<a class="addthis_button_preferred_4"></a>
						<a class="addthis_button_compact"></a>
							"""

			switch type
				when 'std'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style" style="#{style}">
						<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
						<a class="addthis_button_tweet"></a>
						<a class="addthis_button_pinterest_pinit"></a>
						<a class="addthis_counter addthis_pill_style"></a>
						</div>
							"""
				when 'flaot'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_floating_style addthis_counter_style" style="#{style}">
						<a class="addthis_button_facebook_like" fb:like:layout="box_count"></a>
						<a class="addthis_button_tweet" tw:count="vertical"></a>
						<a class="addthis_button_google_plusone" g:plusone:size="tall"></a>
						<a class="addthis_counter"></a>
						</div>
							"""
					
				when 'thirtytwo'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style addthis_32x32_style" style="#{style}">
						#{preferred_btns}
						<a class="addthis_counter addthis_bubble_style"></a>
						</div>
							"""
					
				when 'sm_bub'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style" style="#{style}">
						#{preferred_btns}
						<a class="addthis_counter addthis_bubble_style"></a>
						</div>
							"""
					
				when 'addthis_btn'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=300&amp;pubid=ra-513e32f975a0171d"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="#{style}border:0"/></a>
							"""
					
				when 'vert32'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_floating_style addthis_32x32_style" style="{style}">
						#{preferred_btns}
						</div>
							"""
					
				when 'vert16'
					bulk = """
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_floating_style addthis_16x16_style" style="#{style}">
						#{preferred_btns}
						</div>
							"""
					

			blockAddThisFloating = """
				<!-- AddThis Button BEGIN -->
				#{bulk}
				#{trackCode}
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-513e32f975a0171d"></script>
				<!-- AddThis Button END -->
					""".replace(/^\s+|\n\s*|\s+$/g,'')
					
			return blockAddThisFloating

		# Extend Template Data
		# Add our form to our template data
		extendTemplateData: ({templateData}) ->
			# Prepare
			me = @

			# getFbSdkBlock
			templateData.getAddThisBlock = (type,style,trackUrlCopy) ->
				@referencesOthers()
				return me.addthisWidget(type,style,trackUrlCopy)

		
			# Chain
			@