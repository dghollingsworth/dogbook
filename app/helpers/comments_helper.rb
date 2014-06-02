module CommentsHelper
	def format_time(d)
		d.strftime("%Y %b %e %H:%M") if !d.nil?
	end
end
