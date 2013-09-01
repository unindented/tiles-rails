$:.push File.expand_path('../lib', __FILE__)

require 'tiles/rails/version'

Gem::Specification.new do |s|
  s.name          = 'tiles-rails'
  s.version       = Tiles::Rails::VERSION
  s.authors       = ['Daniel Perez Alvarez']
  s.email         = ['unindented@gmail.com']
  s.homepage      = 'https://github.com/unindented/tiles-rails'
  s.license       = 'MIT'

  s.summary       = 'Windows 8 tile helpers for Rails'
  s.description   = 'Adds easy defaults for writing Windows 8 tile functionality on top of Rails'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|s|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'railties', '~> 4.0'

  s.add_development_dependency 'rails', '~> 4.0'
  s.add_development_dependency 'sqlite3'
end
