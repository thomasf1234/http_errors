require 'spec_helper'

#def exceptions_hash
#  hash = {}
#  binding.pry
  #exceptions_raw_hash.each do |region, errors|
  
   # errors.each do |status_code, message|
    #  hash.merge!(status_code => message)
    #end
  #end
#  hash
#end

def exceptions_raw_hash
  ConfigLoader.load_yaml '/home/ad/http_errors/config/http_exceptions_definitions.yml'
end


describe 'HTTPErrors' do

  describe 'HTTPErrors::HTTPExceptions' do
    context 'we require this module for the first time' do
      let(:exceptions_hash) { exceptions_hash }
      subject { HTTPErrors::HTTPExceptions }  
         
      before :each do
        require_relative '../../lib/http_errors'
      end
     
      it 'should contain all of the errors from the http_status_codes' do
      binding.pry
        exceptions_hash.each do |status_code, exception|
          subject.constants.include?(exception['message'].delete(' \-\'').to_sym).should eq true  
        end          
      end
    end 
  end
end
