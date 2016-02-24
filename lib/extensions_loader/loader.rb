module ExtensionsLoader
  class Loader
    attr_reader :mapping

    def initialize(mapping)
      @mapping = mapping

      verify!
    end

    # Perform extension loading on all mappings
    def load!
      mapping.each do |klass, loadable|
        if loadable.is_a? Array
          loadable.each { |extension| load_extension(klass, extension) }
        else
          load_extension(klass, loadable)
        end
      end
    end

    private

    # Ensure that all defined extensions are either a Module or Array.
    def verify!
      mapping.each { |k, v| raise "#{k}'s extension must provide a Module or Array." unless v.is_a?(Module) || v.is_a?(Array) }
    end

    # Include `extension` into class `klass`
    def load_extension(klass, extension)
      klass.include(extension)
    end
  end
end
