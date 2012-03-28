class Announcement < ActiveRecord::Base
	belongs_to :user

  validates_presence_of :topic, :content, :kind
  
  validates_length_of :topic, :minimum => 4, :maximum => 256, :allow_nil => false, :allow_blank => false
  validates_format_of :topic, :with => /^[\sa-zA-Z_-]{4,}$/i # need to analyze the validation

  validates_length_of :content, :minimum => 5, :maximum => 256, :allow_nil => false, :allow_blank => false

  # validates_length_of :type, :allow_nil => false, :allow_blank => false

  # validate the allowed types like Warning, Info etc, must define this in spec
end
