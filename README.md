# Outputphp Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/c0d0g3n/docpad-plugin-outputphp/master.svg)](http://travis-ci.org/c0d0g3n/docpad-plugin-outputphp "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-outputphp.svg)](https://npmjs.org/package/docpad-plugin-outputphp "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-outputphp.svg)](https://npmjs.org/package/docpad-plugin-outputphp "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/c0d0g3n/outputphp.svg)](https://david-dm.org/c0d0g3n/outputphp)
[![Dev Dependency Status](https://img.shields.io/david/dev/c0d0g3n/outputphp.svg)](https://david-dm.org/c0d0g3n/outputphp#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](https://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


Quick and dirty way (see #known issues) to allow generation of server side php.
This plugin operates on the extensions `.html` and `.htm` and outputs `.php`
,thereby reverting the html entity decoding that the Marked parser did op php tags and its content.

## Sample
`filename.php.html` becomes `filename.php` with php intact.
**This will most likely generate a warning (Rendering the extension "html" to "php" on [file] didn't do anything.), this is normal** as the php tags are unlikely to be escaped, thus no difference is created.

`filename.php.html.md` becomes `filename.php`, with markdown converted into html and php intact. The above warning will still appear if no php tags are present.

## This is a quick hack with issues, do not expect much other that start debuging!
I'm sorry to dissapoint you, but it wat this or writing a custom markdown parser.
Besides it worked in the particular use case it was developed for, but I decided to share it with you folks :).
**If you don't need the markdown functionality, you might be better of with [this answer](http://stackoverflow.com/questions/23710658/docpad-generate-php-output-file#26706756).**

### Known issues
- **Php can't yet be served via DocPad.**
You should setup an traditional webserver (e.g. apache) with php enabled
and make the DocPad `/out` directory accessible (directly or via symlink) through it.
- When using layouts, **make sure you use a layout with `.php.html` in the extension**;
DocPad uses the layout extension to determine the final extension of the resource.
  - If you don't want to manage duplicate files (which defeats the purpose of layouts),
  you can create a symbolic link for the php layout to the html layout, like so (on linux in the `layout` folder):
  `ln -s layoutname.html.eco php-layoutname.php.html.eco`. Don't forget to select the appropriate layout for your (php) files!
- Html entities present in php code will be converted to their single character counterparts.
  There is no way in solving this issue with the currently used method.
  For that we would need to write a markdown parser that doesn't escape php code in the first place.
- Opening p tag disappears when php code is added at begin of paragraph with `removePTags: true`
  - Can possibly be solved if a sign is added that triggers `removePTags: false` for that particular match
- Any php code that matches the markdown syntax will be converted into its html counterpart, this may cause unintended behavior. At the moment I don't know what behavior is more desired,
so I'm settling with the least work intensive method


<!-- INSTALL/ -->

## Install

``` bash
docpad install outputphp
```

<!-- /INSTALL -->


## Options
There is currently one option:

### removePTags (default: true)
(boolean) Whether or not to remove `<p>` and `</p>` around a php tag.
Note this may remove a desired tag if a php block is used at the begin or ending of a paragraph (see #known_issues).

### Be more concrete please...
As with every DocPad plugin, options can be specified like this:

    docpadConfig =
        # other docpad configuration...
        plugins:
            outputphp:
                # config for this plugin, yay!
                removePTags: false



<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/c0d0g3n/docpad-plugin-outputphp/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/c0d0g3n/docpad-plugin-outputphp/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- c0d0g3n (https://github.com/c0d0g3n)
- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](https://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

No contributors yet! Will you be the first?
[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/c0d0g3n/docpad-plugin-outputphp/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

- Copyright &copy; c0d0g3n

and licensed under:

- The incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://opensource.org/licenses/mit-license.php)

<!-- /LICENSE -->


