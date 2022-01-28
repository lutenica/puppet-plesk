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

>  node 'plesk.node' {
>  plesk_extension { 'wp-toolkit':
>    ensure => present
>  }
> }

#### Install a plesk theme:

> node 'plesk.node {
>   include plesk::theme
> }

You can then specify what the theme package name is in hiera:

> plesk::theme::theme_name: 'theme-name'
> plesk::theme::theme_path: '/path/to/theme-name.zip'

Note that the theme-name should be available to download through apt.
Also the meta.xml of the theme needs to have the name of the theme 
be the same as the actual package name and the one you use in 
theme_name. 

## Limitations
 
 * This has been tested with Ubuntu 20.04 only.
 * Plesk 18.0.X.

## Development

 Be cool and stay in school
