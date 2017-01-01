# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class OutputphpPlugin extends BasePlugin
		# Plugin name
		name: 'outputphp'

		# pattern
		# matchphp: /&lt;\?php[\S\s]*?\?&gt;/g
		matchphp: /(<p>)?&lt;\?php[\S\s]*?\?&gt;(<\/p>)?/g

		# settings
		config:
			removePTags: true

		# Render
		# Called per document, for each extension conversion. Used to render one extension to another.
		render: (opts) ->
			# Prepare
			{inExtension,outExtension,file} = opts

			if inExtension in ['htm','html'] and outExtension in ['php']

				# get php tags and content
				opts.content = opts.content.replace @matchphp, (match, pOpen, pClose) =>
					out = match

					# remove p tags
					if @config.removePTags
						out = out
							.replace /^<p>/, ''
							.replace /<\/p>$/, ''

					# unescape php tags and content
					out = out
						.replace /&gt;/g, '>'
						.replace /&lt;/g, '<'
						.replace /&guot;/g, '"'
						.replace /&#39;/g, "'"
						.replace /&amp;/g, '&'

					return out


			# Done
			return

		# docpadReady: ->
		# 	marked = require 'marked'
		# 	console.log new marked.Lexer('test')
