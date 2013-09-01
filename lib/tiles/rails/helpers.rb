module Tiles::Rails
  module Helpers

    def tile_feed(options = {}, &block)
      xml = options.delete(:xml) || eval('xml', block.binding)
      xml.instruct!
      if options[:instruct]
        options.delete(:instruct).each do |target, attrs|
          if attrs.respond_to?(:keys)
            xml.instruct!(target, attrs)
          elsif attrs.respond_to?(:each)
            attrs.each { |attr_group| xml.instruct!(target, attr_group) }
          end
        end
      end

      feed_opts = {'lang' => 'en-US', 'version' => '2'}
      feed_opts.merge!(options)

      xml.tile do
        xml.visual(feed_opts) do
          yield TileFeedBuilder.new(xml, self, options)
        end
      end
    end

    class TileBuilder

      def initialize(xml)
        @xml = xml
      end

      private

      def method_missing(method, *arguments, &block)
        @xml.__send__(method, *arguments, &block)
      end

    end

    class TileFeedBuilder < TileBuilder

      def initialize(xml, view, feed_options = {})
        @xml, @view, @feed_options = xml, view, feed_options
      end

      def binding(options = {})
        default_opts = {branding: :logo}
        @xml.binding(default_opts.merge!(options)) do
          yield TileBuilder.new(@xml)
        end
      end

    end

  end
end
