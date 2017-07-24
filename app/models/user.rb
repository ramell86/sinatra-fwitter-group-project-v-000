class User < ActiveRecord::Base
   
    has_many :tweets
    has_secure_password

    def slug
         self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == user}
    
    end

end