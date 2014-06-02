class Picture < ActiveRecord::Base
	has_many :comments

	require 'Time'
	def date_format(d)
    strftime("%Y, %d %e, %H:%M") 
	end

end
