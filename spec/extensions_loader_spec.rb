require 'spec_helper'

describe ExtensionsLoader do
  it 'has a version number' do
    expect(ExtensionsLoader::VERSION).not_to be nil
  end

  describe '#load' do
    it 'delegates loading to ExtensionsLoader::Loader' do
      loader = double('loader')

      expect(ExtensionsLoader::Loader).to receive(:new).and_return(loader)
      expect(loader).to receive(:load!)

      ExtensionsLoader.load!(123)
    end
  end
end
