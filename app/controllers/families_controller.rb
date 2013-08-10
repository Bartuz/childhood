class FamilyController < ApplicationController

	def index

		@children = Parent.first.children.all
		
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @project_hash }
	    end
	end
end
