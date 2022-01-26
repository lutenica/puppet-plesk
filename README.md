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

### Beginning with plesk

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most basic
use of the module.

## Usage

Include usage examples for common use cases in the **Usage** section. Show your
users how to use your module to solve problems, and be sure to include code
examples. Include three to five examples of the most important or common tasks a
user can accomplish with your module. Show users how to accomplish more complex
tasks that involve different types, classes, and functions working in tandem.

## Limitations
 
 * This has been tested with Ubuntu 20.04 only.
 * Plesk 18.0.X.
 * The plesk::theme theme_name needs to match whatever the installed theme's 
   name will end up beeing in the meta.xml. Otherwise the ensure param will not work.

## Development

 Be cool and stay in school
