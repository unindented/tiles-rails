module Tiles::Rails
  class Railtie < ::Rails::Railtie

    initializer('tiles.configure_rails_initialization', group: :all) do
      Mime::Type.register('application/xml', :tile) unless Mime::Type.lookup_by_extension(:tile)

      ActionView::Base.send(:include, Tiles::Rails::Helpers)
    end

  end
end
