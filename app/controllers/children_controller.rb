class ChildrenController < ApplicationController

  def new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_hash }
    end
  end

  def show

    @child = Child.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_hash }
    end
  end

  def activity

    @child = Child.find(params[:id])
    @events = Event.where(child_id:params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_hash }
    end
  end
end
