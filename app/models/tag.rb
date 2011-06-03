class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  
  validates_length_of :name, :minimum => 1, :maximum => 20, :if => :name?

end

# Validates that a tag is present
# if not, this tag is rejected
def name?
  if self.name.nil?
    errors.add(:name, "not present")
    return false
  end
  return true
end