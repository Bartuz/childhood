class EducatorsController < ApplicationController
	def index

		@class = Educator.first.classrooms.first
    @children = @class.children.all
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @project_hash }
	    end
	end
end
