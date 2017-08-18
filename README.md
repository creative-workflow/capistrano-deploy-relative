# capistrano-deploy-relative

This gem overrides capistranos link tasks and replaces them by using relative paths. This could be usefull if you are in a shared hosting environment.

## Installation
First make sure you install the capistrano-deploy-relative by adding it to your `Gemfile`:

    gem "capistrano-deploy-relative"

Add to Capfile (after 'capistrano/deploy'):

    require 'capistrano/deploy/relative'

### License
The MIT License (MIT)

### Changelog

0.1.0
-----

- Initial release
