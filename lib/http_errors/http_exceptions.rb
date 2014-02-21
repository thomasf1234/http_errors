require_relative 'http_exceptions_config/initializer'

module HTTPErrors
	module HTTPExceptions
	
	require_relative '../../config/config_loader'
	
		class BaseException < RuntimeError
		  attr_accessor :response
		  attr_accessor :message
		  
		end
		

		Initializer.instance
	end
end

=begin
RestClient does:
transmit
  request
   gets response
   logs response
   process response
     creates Response obj
     response.return!
       if (200..207)
        return self
       elsif 301 or 302 or 307 
         unless a :get or :head request 
           then raise exception(code).new(self,code) 
         else
           redirection

RequestFailed if no code


def return! request = nil, result = nil, & block
      if (200..207).include? code
        self
      elsif [301, 302, 307].include? code
        unless [:get, :head].include? args[:method]
          raise Exceptions::EXCEPTIONS_MAP[code].new(self, code)
        else
          follow_redirection(request, result, & block)
        end
      elsif code == 303
        args[:method] = :get
        args.delete :payload
        follow_redirection(request, result, & block)
      elsif Exceptions::EXCEPTIONS_MAP[code]
        raise Exceptions::EXCEPTIONS_MAP[code].new(self, code)
      else
        raise RequestFailed.new(self, code)
      end
    end
=end
