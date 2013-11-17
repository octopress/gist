require 'colorator'
has_failed = false

def test(file)
  diff = `diff expected/#{file}.html site/#{file}.html`
  if diff.size == 0 and File.exist?("site/#{file}.html")
    puts "passed".green
  else
    puts "failed".red
    puts diff
    has_failed = true
  end
end

`rm -rf site; bundle exec jekyll build --trace`

test('index')
test('textile-test')

abort if has_failed
