# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-gist/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-gist"
  spec.version       = Octopress::Gist::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.description   = %q{Embed GitHub gists, support caching, and multiple files per gist.}
  spec.summary       = %q{Embed GitHub gists, support caching, and multiple files per gist.}
  spec.homepage      = "https://github.com/octopress/gist"
  spec.license       = "MIT"

  spec.add_runtime_dependency 'octopress-code-highlighter', '~> 4.2'

  spec.add_development_dependency 'jekyll'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'RedCloth'
  spec.add_development_dependency 'clash'
  spec.add_development_dependency 'octopress-solarized'

  spec.files         = `git ls-files -z`.split("\x0").grep(/^(bin\/|lib\/|assets\/|changelog|readme|license)/i)
  spec.require_paths = ["lib"]
end
