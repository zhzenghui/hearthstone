class CardPage < ActiveRecord::Base
  validates :name , :numericality => { :only_integer => true }
  
end
