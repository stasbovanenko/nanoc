module Nanoc3

  # Nanoc3::Filter is responsible for filtering pages and textual assets. It is
  # the (abstract) superclass for all textual filters. Subclasses should
  # override the +run+ method.
  class Filter < Plugin

    # A hash containing variables that will be made available during
    # filtering.
    attr_reader :assigns

    # Creates a new filter for the given item (page or asset) and assigns.
    #
    # +obj_rep+:: The page or asset representation (Nanoc3::PageRep or
    #             Nanoc3::AssetRep) that should be compiled by this filter.
    #
    # +other_assigns+:: A hash containing other variables that should be made
    #                   available during filtering.
    def initialize(a_assigns={})
      @assigns = a_assigns
    end

    # Runs the filter. This method returns the filtered content.
    #
    # +content+:: The unprocessed content that should be filtered.
    #
    # Subclasses must implement this method.
    def run(content, params={})
      raise NotImplementedError.new("Nanoc3::Filter subclasses must implement #run")
    end

    # Returns the filename associated with the item that is being filtered.
    # The returned filename is in the format "page <identifier> (rep <name>)".
    def filename
      if @assigns[:layout]
        "layout #{assigns[:layout].identifier}"
      elsif @assigns[:page]
        "page #{assigns[:_obj].identifier} (rep #{assigns[:_obj_rep].name})"
      elsif @assigns[:asset]
        "asset #{assigns[:_obj].identifier} (rep #{assigns[:_obj_rep].name})"
      else
        '?'
      end
    end

  end

end