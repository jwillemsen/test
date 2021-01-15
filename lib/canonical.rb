#--------------------------------------------------------------------
# @file    canonical.rb
# @author  Johnny Willemsen
#
# @brief   Helper to get the canonical url so that all our links start
#          pointing to the base_url independent of the domain the user
#          has used
#
# @copyright Copyright (c) Remedy IT Expertise BV
# Chamber of commerce Rotterdam nr.276339, The Netherlands
#--------------------------------------------------------------------

def canonical_url
  @config[:base_url] + @item.path
end
