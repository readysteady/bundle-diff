# 2.0.0

* **Required ruby version is now 3.0.0**

* Changed diff labels to include gem directory names

* Fixed diff labels for /dev/null


# 1.2.2

* Fix for Ruby 2.3 and Ruby 2.4


# 1.2.1

* Fix bug introduced by 1.2.0 changes


# 1.2.0

* Optimized #run for when the version of the gem to diff against is installed locally


# 1.1.0

* Added version option

  Use the version option to diff against a specific gem version. For example:

      $ bundle diff GEMNAME --version 1.2.3

  The option accepts RubyGem version requirements. For example:

      $ bundle diff GEMNAME --version '~> 2'

* Added help option


# 1.0.0

* First version!
