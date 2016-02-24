$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'extensions_loader'

%w(test_extension another_extension).each { |e| require File.join('fixtures', 'extensions', e) }
