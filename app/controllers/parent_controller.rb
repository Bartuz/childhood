class ParentController < ApplicationController

	def index

		@parent = Parent.first
		
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @project_hash }
	    end
	end
end
