class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :load_section]

  def index
    @projects = Project.all
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @active_section = params[:section] || 'bookings' # Set default section if none is provided

    if valid_section?(@active_section)
      @section_content = render_to_string(partial: "projects/sections/#{@active_section}", layout: false)
    else
      @section_content = "<p>Invalid section requested.</p>" # Fallback content
    end

    respond_to do |format|
      format.html # This will render the show.html.erb view
      format.js   # This allows for AJAX requests to this action
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

  def load_section
    @section = params[:section]

    if valid_section?(@section)
      Rails.logger.info "Loading section: #{@section}"
      render turbo_stream: turbo_stream.replace("section-content", partial: "projects/sections/#{@section}")
    else
      Rails.logger.warn "Invalid section requested: #{@section}"
      render turbo_stream: turbo_stream.replace("section-content", partial: "shared/error_message", locals: { message: "Invalid section requested." })
    end
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status, :mission_type)
  end

  def valid_section?(section)
    %w[bookings records crew compliance].include?(section) # Valid sections defined here
  end
end
