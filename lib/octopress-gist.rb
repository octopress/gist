require 'liquid'
require 'octopress-code-highlighter'
require 'open-uri'
require 'json'

$:.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift(File.dirname(__FILE__))

module Octopress
  module Gist
    autoload :Cache,       'octopress-gist/cache'
    autoload :Tag,         'octopress-gist/gist'
    autoload :NoCacheTag,  'octopress-gist/gist-no-cache'
  end
end

Liquid::Template.register_tag('gist', Octopress::Gist::Tag)
Liquid::Template.register_tag('gistnocache', Octopress::Gist::NoCacheTag)

