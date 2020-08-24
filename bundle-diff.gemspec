Gem::Specification.new do |s|
  s.name = 'bundle-diff'
  s.version = '1.2.2'
  s.license = 'GPL-3.0'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Tim Craft']
  s.email = ['mail@timcraft.com']
  s.homepage = 'https://github.com/readysteady/bundle-diff'
  s.description = 'Bundler plugin for showing diffs of bundled gems against latest versions'
  s.summary = 'See description'
  s.files = Dir.glob('lib/**/*.rb') + %w[CHANGES.md LICENSE.txt README.md bundle-diff.gemspec]
  s.required_ruby_version = '>= 2.3.0'
  s.add_dependency('bundler', '>= 1.0', '< 3.0')
  s.require_path = 'lib'
  s.executables = ['bundler-diff']
end
