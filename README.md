# bundle-diff

Bundler plugin for showing diffs of bundled gems against latest versions.


## Installation

    $ gem install bundle-diff


## Usage

    $ bundle diff GEMNAME

Tip: use `bundle outdated` to list installed gems with with newer versions available.

You can also specify the version of the gem to diff against:

    $ bundle diff GEMNAME --version 1.2.3
    
