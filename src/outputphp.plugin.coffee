# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class OutputphpPlugin extends BasePlugin
		# Plugin name
		name: 'outputphp'

		# pattern
		# matchphp: /&lt;\?php[\S\s]*?\?&gt;/g
		matchphpandp: /(<p>|<pre><code>)?&lt;\?php[\S\s]*?\?&gt;(<\/p>|\r?\n?<\/code><\/pre>)?/g
		matchphpnop: /(<pre><code>)?&lt;\?php[\S\s]*?\?&gt;(\r?\n?<\/code><\/pre>)?/g

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
						# preserve indention in tabs
						.replace /<pre><code>[\S\s]+<\/code><\/pre>/g, (match) ->
							match
								.replace /(\n+|^)/g, '$&\t'
						# remove <pre><code>
						.replace /<pre><code>/g, ''
						.replace /<\/code><\/pre>/g, ''
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
