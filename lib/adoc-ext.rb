#--------------------------------------------------------------------
# @file    adoc-ext.rb
# @author  Martin Corino
#
# @brief   Asciidoctor extensions loader
#
# @copyright Copyright (c) Remedy IT Expertise BV
# Chamber of commerce Rotterdam nr.276339, The Netherlands
#--------------------------------------------------------------------

Dir.glob(File.join(File.absolute_path(File.dirname(__FILE__)), 'adoc', '*.rb')) do |f|
  require f
end