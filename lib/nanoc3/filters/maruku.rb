module Nanoc3::Filters
  class Maruku < Nanoc3::Filter

    def run(content)
      require 'maruku'

      # Get result
      ::Maruku.new(content).to_html
    end

  end
end
