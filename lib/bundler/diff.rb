require 'bundler'

module Bundler::Diff
  autoload :CLI, 'bundler/diff/cli'
  autoload :Tool, 'bundler/diff/tool'
end
