require 'liquid'
require 'octopress-code-highlighter'
require 'open-uri'
require 'json'
require 'octopress-gist/version'

module Octopress
  module Gist
    autoload :Cache,       'octopress-gist/cache'
    autoload :Tag,         'octopress-gist/gist'
    autoload :NoCacheTag,  'octopress-gist/gist-no-cache'
  end
end

Liquid::Template.register_tag('gist', Octopress::Gist::Tag)
Liquid::Template.register_tag('gistnocache', Octopress::Gist::NoCacheTag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Gist",
    gem:         "octopress-gist",
    description: "Embed GitHub Gists in your Jekyll or Octopress blog.",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/gist",
    version:     Octopress::Gist::VERSION
  })
end

