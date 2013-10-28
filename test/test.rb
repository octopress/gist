require 'colorator'

has_failed  = false

def test(files, version)
  build
  files = [files] unless files.is_a? Array
  compare_files(files, version)
end

def build
  `rm -rf site && bundle exec jekyll build --trace`
end

def compare_files(files, version)
  files.each do |file|
    if diff = diff_file(file, version)
      puts "Jekyll #{version}: Failed #{file}".red
      puts diff
      has_failed = true
    else
      puts "Jekyll #{version}: Passed #{file}".green
    end
  end
end

def diff_file(file, version)
  diff = `diff expected/#{file}.html site/#{file}.html`
  if diff.size > 0
    diff
  else
    false
  end
end

test(['index','textile-test'], '1.0')

abort if has_failed

