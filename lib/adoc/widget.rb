#--------------------------------------------------------------------
# @file    adoc/widget.rb
# @author  Martin Corino
#
# @brief   Asciidoctor custom block processor
#
# @copyright Copyright (c) Remedy IT Expertise BV
# Chamber of commerce Rotterdam nr.276339, The Netherlands
#--------------------------------------------------------------------

require 'asciidoctor'
require 'asciidoctor/extensions'

module Axcioma
  unless defined? WidgetBlock
    class WidgetBlock < Asciidoctor::Extensions::BlockProcessor
      WidgetStart = ['[pass]', '<div class="widget">', '']
      WidgetEnd = ['[pass]', '</div>' ,'']

      use_dsl

      named :widget
      on_context [:paragraph, :open]
      parse_content_as :simple

      def process parent, reader, attrs
        title = attrs.delete 'title'
        src = WidgetStart.dup
        src.concat(['[pass]', %Q{<h5 class="widgetheading">#{title}</h5>}, '']) if title
        src.concat(reader.lines).concat(WidgetEnd)
        create_open_block parent, src, attrs
      end
    end
  end
end

Asciidoctor::Extensions.register do
  block Axcioma::WidgetBlock
end
