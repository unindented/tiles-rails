tile_feed do |feed|
  feed.binding(template: 'TileSquare150x150Text04', fallback: 'TileSquareImage') do
    feed.text(@posts.first.title, id: '1')
  end

  feed.binding(template: 'TileWide310x150Text03', fallback: 'TileWideImage') do
    feed.text(@posts.first.title, id: '1')
  end

  feed.binding(template: 'TileSquare310x310TextList02', contentId: @posts.first.id) do
    @posts.each_with_index do |post, index|
      feed.text(post.title, id: "#{index + 1}")
    end
  end
end
