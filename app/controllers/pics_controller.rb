class PicsController < ApplicationController
	def index
		#will correspond to the index.html.haml file
	end

	def new
		#will correspond to the new.html.haml file
		@pic = Pic.new #creates an instance of a Pic
	end

	def create
		@pic = Pic.new(pic_params)
	end

	private #so it applies to all the other actions instead of repeating yourself

	def pic_params
		params.require(:pic).permit(:title, :description)
	end
end
