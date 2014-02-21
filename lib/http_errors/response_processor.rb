module HTTPErrors
  
  class ResponseProcessor
    def initialize response
      
    end
    
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
    
    
    def return! request = nil, response = nil, & block
      if response.successful? http_code
        self
      elsif url_invalid? code
        unless [:get, :head].include? args[:method]
          raise HTTPExceptions::EXCEPTIONS[http_code].new(response, http_code)
        else
          follow_redirection(request, response, & block)
        end
      elsif response.see_other?
        args[:method] = :get
        args.delete :payload
        follow_redirection(request, response, & block)
      elsif HTTPExceptions::EXCEPTIONS[http_code]
        raise HTTPExceptions::EXCEPTIONS[http_code].new(response, http_code)
      else
        raise HTTPExceptions::RequestFailed.new(response, http_code)
      end
    end
    
  end
  
  
end

#rescue EOFError
#      raise RestClient::ServerBrokeConnection
#    rescue Timeout::Error
#      raise RestClient::RequestTimeout
