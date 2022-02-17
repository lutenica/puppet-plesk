# Plesk
## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with plesk](#setup)
    * [What plesk affects](#what-plesk-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with plesk](#beginning-with-plesk)
1. [Limitations](#limitations)
1. [Development ](#development)

## Description

 This module is meant to setup various Plesk elements.

## Setup

### What Plesk affects

* Plesk themes
* Plesk extensions
* PHP and Nginx settings
* Plesk service plans

### Beginning with plesk

Download your into your modules directory. You need a node that has Plesk installed
already added to your infrastructure.

## Usage

#### Install a plesk extension:

  node 'plesk.node' {
  plesk_extension { 'wp-toolkit':
    ensure => present
  }
 }

#### Install a plesk theme:

 node 'plesk.node {
   include plesk::theme
 }

You can then specify what the theme package name is in hiera:

 plesk::theme::theme_name: 'theme-name'
 plesk::theme::theme_path: '/path/to/theme-name.zip'

Note that the theme-name should be available to download through apt.
Also the meta.xml of the theme needs to have the name of the theme 
be the same as the actual package name and the one you use in 
theme_name. 

#### Create a plesk plan:
node 'plesk.node' {
  service_plan { 'planname':
    ensure              => present,
    php_served_by_nginx => 'true'
  }
}

Note that the current plan provider only supports hosting related parameters. Everything mail
related is removed. It can be easily added and will be in future, as all that is required is
to actually add the params to the defined type and the custom type itself. The provider would only
need the paramteres added to the FIXDASH array if one is forced to use an underscore.

Also due to the way Plesk works we can only ensure that a plan exists but not all values, so ensure 
only confirms it is created with the given params.

#### Set plesk notifications

node plesk.node {
   plesk::notification { 'domain_creation': 
     ensure        => present,
     send2admin    => 'false',
     send2reseller => 'false',
     send2client   => 'true',     
   }

#####NOTE that the true falses are strings.

The name of the resource should be the actual notification code availble here:

https://docs.plesk.com/en-US/obsidian/cli-linux/using-command-line-utilities/notification-email-notification-about-system-events.66604/

## Limitations
 
 * This has been tested with Ubuntu 20.04 only.
 * Puppet version >= 6.25 
 * Plesk 18.0.X.

## Development

 Be cool and stay in school
