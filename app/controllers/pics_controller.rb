class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy]

	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def show
	end

	def new
		#will correspond to the new.html.haml file
		@pic = current_user.pics.build #creates an instance of a Pic
	end

	def create
		@pic = current_user.pics.build(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Yes! It was posted!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Congrats, pic was updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pic.destroy
		redirect_to root_path
	end

	private #so it applies to all the other actions instead of repeating yourself

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end
end
