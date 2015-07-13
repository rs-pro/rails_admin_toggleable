# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_toggleable/version'

Gem::Specification.new do |gem|
  gem.name          = "rails_admin_toggleable"
  gem.version       = RailsAdminToggleable::VERSION
  gem.authors       = ["Gleb Tv"]
  gem.email         = ["glebtv@gmail.com"]
  gem.description   = %q{Toggleable field for rails admin}
  gem.summary       = %q{Make any boolean field easily toggleable on\off from index view in rails admin}
  gem.homepage      = "https://github.com/rs-pro/rails_admin_toggleable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "rails_admin"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
end

