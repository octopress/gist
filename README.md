# Octopress Gist

Embed GitHub Gists in your Jekyll or Octopress blog.

[![Build Status](https://travis-ci.org/octopress/gist.png?branch=master)](https://travis-ci.org/octopress/gist)
[![Gem Version](https://badge.fury.io/rb/octopress-gist.png)](https://badge.fury.io/rb/octopress-gist)

## Installation

### Using Bundler

Add this gem to your site's Gemfile in the `:jekyll_plugins` group:

    group :jekyll_plugins do
      gem 'octopress-gist'
    end

Then install the gem with Bundler

    $ bundle

### Manual Installation

    $ gem install octopress-gist

Then add the gem to your Jekyll configuration.

    gems:
      -octopress-gist

## Usage

The gist syntax looks like this.

```
{% gist [gist_id] [file_name] [options] %}
```

### Options

Note that order does not matter.

| Options      | Example                | Description                                                           |
|:-------------|:-----------------------|:----------------------------------------------------------------------|
|`title`       | `title:"Figure 1.A"`   | Add a figcaption title. Defaults to Gist title (usually the filename). |
|`link_text`   | `link_text:"Download"` | Text for the link to the gist, default: `"link"`. |
|`linenos`     | `lineos:false`         | Disable line numbering. |
|`start`       | `start:5`              | Start embedding the gist from the 5th line number. |
|`end`         | `end:15`               | Stop embedding the gist after 15th line number. |
|`range`       | `range:5-15`           | Embed lines 5-15 of the gist. |
|`mark`        | `mark:5-7,10`          | Highlight lines of code. This example marks lines 5,6,7 and 10. |
|`class`       | `class:"solution"`     | Add CSS class name(s) to the code `<figure>` element. |

A simple gist embed:

```
{% gist 5672127 %}
```

This will download the gist and render it with Octopress Pygments, caching both the raw gist, and the highlighted code. If your Gist has multiple files, this will embed each file in its own code figure.

Here's a more complex example:

```
{% gist 5672127 title:"Some cool thing" range:5-10 %}
```

#### Embed single files in a gist

If your Gist has multiple files but you wish to embed files individually, you can like this.

```
{% gist 13411532 some_gist_file_name.rb %}

Comments about this file

{% gist 13411532 some_other_gist_file_name.rb %}

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
