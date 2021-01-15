#--------------------------------------------------------------------
# @file    adoc/glyph.rb
# @author  Martin Corino
#
# @brief   Asciidoctor custom macro processor
#
# @copyright Copyright (c) Remedy IT Expertise BV
# Chamber of commerce Rotterdam nr.276339, The Netherlands
#--------------------------------------------------------------------

require 'asciidoctor'
require 'asciidoctor/extensions'

module Axcioma
  unless defined? GlyphMacro
    class GlyphMacro < Asciidoctor::Extensions::InlineMacroProcessor

      use_dsl

      named :glyph
      name_positional_attributes 'glyphsize'

      def process parent, target, attrs
        sz = attrs.delete 'glyphsize'
        sz = " fa-#{sz}" if sz
        %Q{<i class="fa fa-#{target}#{sz}"></i>}
      end
    end
  end
end

Asciidoctor::Extensions.register do
  inline_macro Axcioma::GlyphMacro
end
