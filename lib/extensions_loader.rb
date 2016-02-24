require 'extensions_loader/version'
require 'extensions_loader/loader'

module ExtensionsLoader
  def self.load!(mapping)
    loader = Loader.new(mapping)
    loader.load!
  end
end
