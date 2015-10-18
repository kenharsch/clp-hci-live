# app/controllers/versions_controller.rb
class VersionsController < ApplicationController

  before_action :set_project_and_version, only: [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    project = @version.reify
    project.save
    redirect_to edit_project_path(project)
  end

  private

    def set_project_and_version
      @project = Project.find(params[:project_id])
      @version = @project.versions.find(params[:id])
    end

end
