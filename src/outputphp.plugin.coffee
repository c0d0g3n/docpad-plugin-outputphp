# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class OutputphpPlugin extends BasePlugin
		# Plugin name
		name: 'outputphp'

		# pattern
		# matchphp: /&lt;\?php[\S\s]*?\?&gt;/g
		matchphpandp: /(<p>)?&lt;\?php[\S\s]*?\?&gt;(<\/p>)?/g
		matchphpnop: /&lt;\?php[\S\s]*?\?&gt;/g

		# settings
		config:
			removePTags: true

		# Render
		# Called per document, for each extension conversion. Used to render one extension to another.
		render: (opts) ->
			# Prepare
			{inExtension,outExtension,file} = opts

			if inExtension in ['htm','html'] and outExtension in ['php']

				if @config.removePTags
					matchPattern = @matchphpandp
				else
					matchPattern = @matchphpnop

				# get php tags and content
				opts.content = opts.content.replace matchPattern, (match) =>

					match
						# remove p tags (added by marked) in php (also removes wrapping p if theyre matched, see `removePTags`)
						.replace /<p>/g, ''
						.replace /<\/p>/g, ''
						# replace <pre><code> with tab
						.replace /<pre><code>[\S\s]+<\/code><\/pre>/g, (match) ->
							match
								.replace /<pre><code>/g, ''
								.replace /<\/code><\/pre>/g, ''
								.replace /(\n+|^)/g, '$&\t'
						# four spaces into tab for consistency
						.replace /( ){4}/g, '\t'
						# unescape php
						.replace /&gt;/g, '>'
						.replace /&lt;/g, '<'
						.replace /&guot;/g, '"'
						.replace /&#39;/g, "'"
						.replace /&amp;/g, '&'


			# Done
			return
