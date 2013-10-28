module Octopress
  module Gist
    class Cache
      GIST_CACHE_DIR = '.gist-cache'

      class << self

        def read_cache(options)
          path = get_cache_path(GIST_CACHE_DIR, options[:gist_id], options.to_s)
          File.exist?(path) ? JSON.parse(File.read(path)) : nil
        end

        def write_cache(contents, options)
          FileUtils.mkdir_p(GIST_CACHE_DIR) unless File.directory?(GIST_CACHE_DIR)
          path = get_cache_path(GIST_CACHE_DIR, options[:gist_id], options.to_s)
          File.open(path, 'w') do |f|
            f.print(contents.to_s)
          end
        end

        def get_cache_path(dir, name, str)
          File.join(dir, "#{name}-#{Digest::MD5.hexdigest(str)}.html")
        end
      end
    end
  end
end
