require 'rex/ui'

module Rex
module Ui
module Text

###
#
# This class implements text-based output but is not
# tied to an output medium.
#
###
class Output < Rex::Ui::Output

	require 'rex/ui/text/output/stdio'
	require 'rex/ui/text/output/socket'
	require 'rex/ui/text/output/buffer'
	require 'rex/ui/text/color'

	include Rex::Ui::Text::Color

	def initialize
		@config = {
			:color => :auto, # true, false, :auto
		}
		super
	end
	attr_reader :config
		
	def disable_color
		@config[:color] = false
	end
	def enable_color
		@config[:color] = true
	end
	def auto_color
		@config[:color] = :auto
	end

	def update_prompt(prompt)
		substitute_colors(prompt)
	end


	def print_error(msg = '')
		print_line("%red[-]%c #{msg}")
	end

	def print_good(msg = '')
		print_line("%grn[+]%c #{msg}")
	end

	def print_status(msg = '')
		print_line("%blu[*]%c #{msg}")
	end

	def print_line(msg = '')
		print(msg + "\n")
	end

	def print(msg = '')
		print_raw(substitute_colors(msg))
	end

	def reset
	end

end

end
end
end
