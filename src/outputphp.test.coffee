# Test our plugin using DocPad's Testers
require('docpad').require('testers')
	.test(
			{
				testerName: 'removePTags: true'
				pluginPath: __dirname+'/..'
			}
			{
				plugins:
					outputphp:
						removePTags: true
			}
		)
	.test(
			{
				testerName: 'removePTags: false'
				pluginPath: __dirname+'/..'
				outExpectedPath: __dirname+'/../test/out-not-remove-p-tags'
			}
			{
				plugins:
					outputphp:
						removePTags: false
			}
		)
		