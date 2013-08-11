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
    @parent_categories = Category.where(parent_category_id: nil)
    @sub_categories = Category.where(parent_category_id: @parent_categories.first.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def log_activity
    @child = Child.find(params[:child_id])
    @classroom = @child.classrooms.first
    @event = Event.new(:title=>title, :notes=>notes, :occurred_on=>occurred_on, :classroom=>@classroom, :child=>@child)

    respond_to do |format|
      if @event.save
        format.html { redirect_to activity_path, notice: 'Activity Saved!' }
      else
        format.html { render action: "activity" }
      end
    end
  end
end
