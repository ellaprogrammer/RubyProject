class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy]

	def index
		#will correspond to the index.html.haml file
	end

	def show
	end

	def new
		#will correspond to the new.html.haml file
		@pic = Pic.new #creates an instance of a Pic
	end

	def create
		@pic = Pic.new(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Yes! It was posted!"
		else
			render 'new'
		end

	end

	private #so it applies to all the other actions instead of repeating yourself

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end
end
