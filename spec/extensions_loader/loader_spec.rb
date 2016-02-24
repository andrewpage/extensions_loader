require 'spec_helper'

describe ExtensionsLoader::Loader do
  describe '#initialize' do
    it 'should accept and set a mapping' do
      allow_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!)
      loader = ExtensionsLoader::Loader.new(123)

      expect(loader.mapping).to equal(123)
    end

    it 'should verify the validity of extensions' do
      expect_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!)

      ExtensionsLoader::Loader.new(123)
    end
  end

  describe '#load!' do
    before do
      allow_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!)
    end

    it 'should load a single extension' do
      @loader = ExtensionsLoader::Loader.new(
        Object => Extensions::TestExtension
      )

      expect(@loader).to receive(:load_extension).once
    end

    it 'should load one extension on different objects' do
      @loader = ExtensionsLoader::Loader.new(
        Object => Extensions::TestExtension,
        String => Extensions::TestExtension
      )

      expect(@loader).to receive(:load_extension).with(Object, Extensions::TestExtension).once
      expect(@loader).to receive(:load_extension).with(String, Extensions::TestExtension).once
    end

    it 'should load multiple extensions on one object' do
      @loader = ExtensionsLoader::Loader.new(
        Object => [
          Extensions::TestExtension,
          Extensions::AnotherExtension
        ]
      )

      expect(@loader).to receive(:load_extension).with(Object, Extensions::TestExtension).once
      expect(@loader).to receive(:load_extension).with(Object, Extensions::AnotherExtension).once
    end

    after :each do
      @loader.load!
    end
  end

  describe '#verify!' do
    before :each do
      allow_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!)
    end

    it 'should successfully verify a valid mapping' do
      loader = ExtensionsLoader::Loader.new(Object => Extensions::TestExtension)
      allow_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!).and_call_original

      expect { loader.verify! }.to_not raise_error
    end

    it 'should unsuccessfully verify an invalid mapping' do
      loader = ExtensionsLoader::Loader.new(Object => 'this should fail')
      allow_any_instance_of(ExtensionsLoader::Loader).to receive(:verify!).and_call_original

      expect { loader.verify! }.to raise_error(RuntimeError)
    end
  end

  describe '#load_extension' do
    before do
      @loader = ExtensionsLoader::Loader.new({})
    end

    it 'should include a module into the target' do
      @loader.send(:load_extension, String, Extensions::TestExtension)

      test_object = 'hello'

      expect(test_object.test_method).to eq('This is a test method.')
    end
  end
end
