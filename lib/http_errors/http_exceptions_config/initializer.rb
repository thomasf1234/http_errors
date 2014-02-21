module HTTPErrors
  module HTTPExceptions
    EXCEPTIONS = {}
    
    class Initializer
      include Singleton

      EXCEPTIONS_YAML_LOCATION = '/home/ad/http_errors/config/http_exceptions_definitions.yml'

      def initialize
        add_exceptions_to_module
      end

      private

      def add_exceptions_to_module
        exceptions_hash.each do |exception_name, exception_details|
          create_exception_class(exception_name, exception_details)
        end
      end

      def create_exception_class(exception_name, exception_details) 
        klass = Class.new(BaseException) do
          send(:define_method, :message) {'peekaboo'}
        end
        HTTPExceptions.const_set exception_name, klass
        EXCEPTIONS[exception_details['http_code']] = klass        
      end

      def exceptions_hash
        hash = {}
        exceptions_raw_hash['HTTPErrors']['HTTPExceptions'].each do |region, exceptions|
          exceptions.each do |exception_name, exception_details|
            hash.merge!(exception_name => exception_details)
          end
        end
        hash
      end

      def exceptions_raw_hash
        ConfigLoader.load_yaml EXCEPTIONS_YAML_LOCATION
      end
    end
  end
end
