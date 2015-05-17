# Windows 8.1 Tile Helpers [![Version](https://img.shields.io/gem/v/tiles-rails.svg)](https://rubygems.org/gems/tiles-rails) [![Build Status](https://img.shields.io/travis/unindented/tiles-rails.svg)](http://travis-ci.org/unindented/tiles-rails) [![Dependency Status](https://img.shields.io/gemnasium/unindented/tiles-rails.svg)](https://gemnasium.com/unindented/tiles-rails) ![Abandoned](https://img.shields.io/badge/status-abandoned-red.svg)

Adds easy defaults for writing Windows 8.1 tile functionality on top of Rails.

## Installation

Add this line to your application's `Gemfile`:

```rb
gem 'tiles-rails'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install tiles-rails
```

## Usage

### Creating a notification feed

Create a controller to handle your requests, e.g. `app/controllers/feeds_controller.rb`:

```rb
class FeedsController < ApplicationController
  respond_to :tile

  def show
    @posts = Post.limit(3)
    respond_with @posts
  end

end
```

Now create a view to render the feed, e.g. `app/views/feeds/show.tile.builder`:

```rb
tile_feed do |feed|
  feed.binding(branding: 'logo', template: 'TileSquare150x150Text04', fallback: 'TileSquareImage') do
    feed.text(@posts.first.title, id: '1')
  end

  feed.binding(branding: 'logo', template: 'TileWide310x150Text03', fallback: 'TileWideImage') do
    feed.text(@posts.first.title, id: '1')
  end

  feed.binding(branding: 'logo', template: 'TileSquare310x310TextList02', contentId: @posts.first.id) do
    @posts.each_with_index do |post, index|
      feed.text(post.title, id: "#{index + 1}")
    end
  end
end
```

Update your `config/routes.rb` with the new route:

```rb
Blog::Application.routes.draw do
  ...

  resource :feed, only: [:show]
end
```

Now you can access your notification feed at <http://localhost:3000/feed.tile>.


## Meta

* Code: `git clone git://github.com/unindented/tiles-rails.git`
* Home: <https://github.com/unindented/tiles-rails/>


## Contributors

* Daniel Perez Alvarez ([unindented@gmail.com](mailto:unindented@gmail.com))


## License

Copyright (c) 2013 Daniel Perez Alvarez ([unindented.org](https://unindented.org/)). This is free software, and may be redistributed under the terms specified in the LICENSE file.
