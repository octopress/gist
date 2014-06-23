require 'colorator'
has_failed = false

system('rm -rf site .code-highlighter-cache .gist-cache')
system('jekyll build')

diff1 = `diff site/index.html expected/index.html`
diff2 = `diff site/textile-test.html expected/textile-test.html`

abort "Failed with diff: #{diff1}" if diff1.size > 0
abort "Failed with diff: #{diff2}" if diff2.size > 0

puts "passed".green
