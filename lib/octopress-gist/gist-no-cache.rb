module Octopress
  module Gist
    class NoCacheTag < Tag
      def initialize(tag_name, markup, token)
        super
        @cache_disabled = true
      end
    end
  end
end
