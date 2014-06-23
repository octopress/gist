# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-gist/version'

Gem::Specification.new do |gem|
  gem.name          = "octopress-gist"
  gem.version       = Octopress::Gist::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{Embed GitHub gists, support caching, and multiple files per gist.}
  gem.summary       = %q{Embed GitHub gists, support caching, and multiple files per gist.}
  gem.homepage      = "https://github.com/octopress/gist"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'jekyll', '~> 2.0.3'
  gem.add_runtime_dependency 'octopress-code-highlighter', '~> 4.0.2'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'RedCloth'

  gem.files         = `git ls-files`.split($/).reject {|f| f =~ /^test\// }
  gem.require_paths = ["lib"]
end
