class Ml
  #  @@path = "log\/"
  @@path = "c:\/projects\/rails\/roomstore\/log\/"
  @@file_name = "log.log"
  def self.w text
    f = nil
    if !(File.exists? @@path+@@file_name)
      f =  File.open(@@path+@@file_name,'w')
    else
      f =  File.open(@@path+@@file_name, 'a')
    end
    f.puts text
    f.close
  end  
end

