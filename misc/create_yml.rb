def create_yaml hash
  ind='  '
  
  file = File.open("/home/ad/http_errors/config/http_exceptions_definitions2.yml", "w")   
  flag = nil
  
  
  file.write("HTTPErrors:\n")
  file.write("#{ind}HTTPExceptions:\n")
  hash.each do |code, exception|
    if flag != code/100
      flag = code/100
      file.write("#{ind+ind}#{region code}:\n")
    end
    file.write("#{ind+ind+ind+exception.delete(' \-\'')}:\n")
    file.write("#{ind+ind+ind+ind}http_code: #{code}\n")
    file.write("#{ind+ind+ind+ind}message: #{exception}\n")
  end
  file.close
end



def region code
  code_first_digit = code/100
  
  case code_first_digit
  when 1
    return 'Informational'.split(' ').join('_')
  when 2
   return 'Success'.split(' ').join('_')
  when 3
   return 'Redirection'.split(' ').join('_')
  when 4
   return 'Client Error'.split(' ').join('_')
  when 5
   return 'Server Error'.split(' ').join('_') 
  else
   raise 'invalid http status code'.split(' ').join('_')
  end 
end

    
