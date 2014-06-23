module Octopress
  module Gist
    class Tag < Liquid::Tag

      def initialize(tag_name, markup, tokens)
        super
        @cache_disabled = false
        @tag_name = tag_name
        @markup = markup
      end
      
      def render(context)
        if CodeHighlighter.clean_markup(@markup) =~ /([\S]*)\s*(\S*)/
          gist_id, filename = $1.strip, $2.strip
          filename = $2.strip == "" ? nil : $2.strip
          options = {
            gist_id: $1.strip,
            cache: !@cache_disabled,
            escape: false
          }
          options = CodeHighlighter.parse_markup(@markup, options)

          if @cache_disabled or ! gist = Cache.read_cache(options)
            gist = download_gist(options)
          end

          options[:url]       ||= gist['html_url']
          options[:link_text] ||= "View Gist"

          output = []
          files = gist_files(gist, filename)
          if files.length > 1 && (options[:start] || options[:end] || options[:range])
            puts "Gist embed warning:"
            puts "  You should probably avoid using start, end or range options on gist embeds with multiple files"
            puts "  Embed files one at a time like {% gist 124151 filename %}"
          end

          files.each do |file|
            opt = {
              title: file['filename'],
              lang: (file['language'] || '').downcase
            }.merge(options)
            begin
              code = CodeHighlighter.select_lines(file['content'], opt)
              code = CodeHighlighter.highlight(code, opt)
              code = "<notextile>#{code}</notextile>" if context.registers[:page]['path'].match(/textile/)
              output << code
            rescue => e
              markup = "{% #{@tag_name} #{@markup.strip} %}"
              CodeHighlighter.highlight_failed(e, "{% #{@tag_name} [gist_id] [file_name] [options...] %}", markup, file['content'])
            end
          end
          output.join "\n"
        else
          error_msg = "Syntax Error: {% #{@tag_name} #{@markup.strip} %}"
          syntax_msg = "Should be: {% #{@tag_name} [gistid] [file_name] [options...] %}"
          puts error_msg.red
          puts syntax_msg
          "<pre>#{error_msg}\n#{syntax_msg}</pre>"
        end
      end

      def gist_files(gist, filename=nil)
        gists = gist['files']
        # Return a single file if specified
        if filename
          if file = gists[filename]
            [file]
          else
            # List file names found in the error message.
            filenames = gists.keys.each { |k| k.to_s }
            raise "File '#{filename}' not found in gist #{gist['id']}. Did you mean '#{filenames.join('\' or \'')}'?"
          end
        else
          gists.values.each{ |v| v }
        end
      end

      def download_gist(options)
        retried = false
        begin
          response = URI.parse("https://api.github.com/gists/#{options[:gist_id]}").read
          Cache.write_cache(response, options) if options[:cache]
          JSON.parse(response)
        rescue => e
          raise if retried
          retried = true
          retry
        end
      rescue => e
        puts "Failed to download Gist: #{gist}.".red
        puts e.extend Error
      end
    end
  end
end
