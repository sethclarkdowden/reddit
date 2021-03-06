# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reddit/version'

Gem::Specification.new do |gem|
  gem.name          = "reddit"
  gem.version       = Reddit::VERSION
  gem.authors       = ["Seth Dowden"]
  gem.email         = ["sethclarkdowden@gmail.com"]
  gem.description   = %q{reddit scraper}
  gem.summary       = %q{reddit scraper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
