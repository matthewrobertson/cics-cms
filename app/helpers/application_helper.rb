module ApplicationHelper

	def title title
		content_for :head do
			title
		end
	end
end
