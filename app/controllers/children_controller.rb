class ChildrenController < ApplicationController

  def new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_hash }
    end
  end

  def show

    @child = Child.find(params[:id])
    @events = Event.where(child_id:params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_hash }
    end
  end

  # GET
  def activity

    @child = Child.find(params[:id])
    @events = Event.where(child_id:params[:id])
    @parent_categories = Category.where(parent_category_id: nil)
    @sub_categories = Category.where(parent_category_id: @parent_categories.first.id)

    @category_name = @child.educational_setting == "Child care" ? "Domain" : "Learning Area"
    @note_name = @child.educational_setting == "Child care" ? "Indicator" : "Expectation"
    @hide_subcategory = @child.educational_setting == "Child care" ? true : false

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST
  def log_activity
    @child = Child.find(params[:child_id])
    @classroom = @child.classrooms.first
    cat_id = params[:skill]
    if cat_id == nil
      cat_id = params[:domain]
    end
    @category = Category.find(cat_id)
    @event = Event.new(:indicator=>params[:indicator],
                       :observations=>params[:observation],
                       :interpretation=>params[:interpretation],
                       :occurred_on=>DateTime.now,
                       :classroom=>@classroom,
                       :child=>@child,
                       :picture_url => nil,
                       :category=>@category)

    respond_to do |format|
      if @event.save
        format.html { redirect_to activity_child_path, notice: 'Activity Saved!' }
      else
        format.html { render action: "activity" }
      end
    end
  end

  def activity_list
    @child = Child.find(params[:id])
    @events = Event.where(child_id:params[:id])

    respond_to do |format|
      format.html { render action: "activity" }
    end
  end

  def activity_timeline
    @child = Child.find(params[:id])
    @events = Event.where(child_id:params[:id])

    respond_to do |format|
      format.html { render action: "activity" }
    end
  end
end
