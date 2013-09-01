module Tiles::Rails
  module Helpers

    def tile_feed(options = {}, &block)
      if options[:schema_date]
        options[:schema_date] = options[:schema_date].strftime('%Y-%m-%d') if options[:schema_date].respond_to?(:strftime)
      else
        options[:schema_date] = '2013'
      end

      xml = options.delete(:xml) || eval('xml', block.binding)
      xml.instruct!
      if options[:instruct]
        options[:instruct].each do |target,attrs|
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
          yield xml
        end
      end
    end

  end
end
