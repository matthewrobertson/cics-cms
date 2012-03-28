class Contribution < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	scope :pending_approval, where(:status => 1)
	scope :pending_acceptance, where(:status => 2)
end