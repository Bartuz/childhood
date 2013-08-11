class SignupController < ApplicationController

	# layout 'signup'

	def signup
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @project_hash }
	    end
	end

end
