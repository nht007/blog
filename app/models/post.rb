class Post < ActiveRecord::Base
  acts_as_taggable
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments, :dependent => :destroy

end
