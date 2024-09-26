7x DiggClone
======================

This extension is a simple eZ Publish Platform (Legacy) kernel datatype (based on ezoption default datatype) to provide a simple feature it allows for the default options required for boolean voting using the eZ Publish core Information Collection System where everything is created upon content node creation and then voting can begin. Very Flexible Implementation!

With this kernel datatype override installed and enabled you can finally use this as a object attribute for displaying a vote and vote count features on the webpage.

This is helpful and useful for distinguishing website from others with just the default information collection system as the engine. More features planned.


Version
=======

* The current version of 7x DiggClone is 1.1.0

* Last Major update: September 25, 2024


Copyright
=========

* 7x DiggClone is copyright 1999 - 2024 7x

* See: [COPYRIGHT.md](COPYRIGHT.md) for more information on the terms of the copyright and license


License
=======

7x DiggClone is licensed under the GNU General Public License.

The complete license agreement is included in the [LICENSE](LICENSE.md) file.

7x DiggClone is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License or at your
option a later version.

7x DiggClone is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

The GNU GPL gives you the right to use, modify and redistribute
7x DiggClone under certain conditions. The GNU GPL license
is distributed with the software, see the file LICENSE.

It is also available at [http://www.gnu.org/licenses/gpl.txt](http://www.gnu.org/licenses/gpl.txt)

You should have received a copy of the GNU General Public License
along with 7x DiggClone in LICENSE.

If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

Using 7x DiggClone under the terms of the GNU GPL is free (as in freedom).

For more information or questions please contact: license@se7enx.com


Requirements
============

The following requirements exists for using 7x DiggClone extension:


### eZ Publish version

* Make sure you use eZ Publish version 5.x (required) or higher.

* Designed and tested with eZ Publish Legacy 5.99alpha1


### PHP version

* Make sure you have PHP 8.x or higher.


Features
========

This solution provides the following features:

* Default Design Extension Based Design Solution Providing User Website GUI

* Other future features (like our digg spy implemenetation)


### Dependencies

* This solution depends on eZ Publish Legacy only and does not require class override feature of eZ Publish.


Installation
============

### Bundle Installation via Composer

Run the following command from your project root to install the bundle:

    bash$ composer require se7enxweb/sevenx_diggclone dev-main;


### Extension Activation

Optional. Activate this extension by adding the following to your `settings/override/site.ini.append.php`:

    [ExtensionSettings]
    # <snip existing active extensions list />
    ActiveExtensions[]=sevenx_diggclone


Note: Design is enabled by ini settings per siteaccess design setting [DesignSettings] SiteDesign=digg and loaded by convention automatically.


### Clear the caches

Optional. Clear eZ Publish Platform / eZ Publish Legacy caches (Required).

    php ./bin/php/ezcache.php --clear-all;


Usage
=====

The solution is configured to work virtually by default once properly installed.

Note: Once installed. Clear caches and configure the site user and admin siteaccesses to more closely meet your own unique needs and desires for custom features.


Troubleshooting
===============

### Read the FAQ

Some problems are more common than others. The most common ones are listed in the the [doc/FAQ.md](doc/FAQ.md)


### Support

If you have find any problems not handled by this document or the FAQ you can contact 7x through the support system: [https://se7enx.com/contact](https://se7enx.com/contact)

