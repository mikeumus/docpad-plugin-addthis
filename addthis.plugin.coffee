# Export
module.exports = (BasePlugin) ->
	# Define
		# Config
	class addThisPlugin extends BasePlugin
		# Name
		name: 'addthis'

		config:
			blockAddThisFloating: """
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_floating_style addthis_counter_style" style="left:50px;top:50px;">
				<a class="addthis_button_facebook_like" fb:like:layout="box_count"></a>
				<a class="addthis_button_tweet" tw:count="vertical"></a>
				<a class="addthis_button_google_plusone" g:plusone:size="tall"></a>
				<a class="addthis_counter"></a>
				</div>
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-513e32f975a0171d"></script>
				<!-- AddThis Button END -->
					""".replace(/^\s+|\n\s*|\s+$/g,'')

		# Extend Template Data
		# Add our form to our template data
		extendTemplateData: ({templateData}) ->
			# Prepare
			{docpad,config} = @

			# getFbSdkBlock
			templateData.getFloatingAddThisBlock = ->
				@referencesOthers()
				'blockAddThisFloating': config.blockAddThisFloating
				'floatRight': config.floatRight
				'floatLe'


			# Chain
			@