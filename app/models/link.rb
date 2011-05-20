class Link < ActiveRecord::Base

   BASE = 32

   validates :url,
             :presence => true,
             :format => { :with => %r[^https?://]i, :on => :create }

    def to_short
      id.to_s(BASE)      
    end
    
    def to_param
      to_short
    end
    

end
