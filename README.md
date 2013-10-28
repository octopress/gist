# Octopress Gist

Embed GitHub Gists in your Jekyll or Octopress blog.

[![Build Status](https://travis-ci.org/octopress/octopress-gist.png?branch=master)](https://travis-ci.org/octopress/octopress-gist)

## Installation

Add this line to your application's Gemfile under
the :jekyll_plugins group:

```ruby
group :jekyll_plugins do
  gem 'octopress-gist'
end
```

And then execute:

    $ bundle

Next add this to your plugins folder to automatically load any Jekyll plugins in your :jekyll_plugins group.

```ruby
# in _plugins/bundler.rb
require "bundler/setup"
Bundler.require(:jekyll_plugins)
```

Or you can just create a ruby file in your Jekyll plugins directory with the line `require "octopress-gist"`

## Usage

The gist syntax looks like this.

```
{% gist [gist_id] [file_name] [options] %}
```

A simple gist embed:

```
{% gist 5672127 %}
```

This will download the gist and render it with Octopress Pygments, caching both the raw gist, and the highlighted code. 

If your Gist has multile files, this will embed each file in it's own code figure.


#### Embed single files in a gist

If your Gist has multile files but you wish to embed files individually, you can like this.

```
{% gist 13411532 some_gist_file_name.rb %}

Comments about this file

{% gist 13411532 some_gist_file_name2.rb %}

and so on...
```

#### Disable Gist Caching

To disable caching, use the `gistnocache` tag instead. 

```
{% gistnocache 12512151 %}
```

This works just like the normal tag, but forces a fresh download of your gist with each Jekyll build. If the gist is unchanged, the code highlighting will still use
Pygments caching to prevent unnecessary CPU effort.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
