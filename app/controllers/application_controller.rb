class ApplicationController < ActionController::Base
  def index
    @project = Project.all
  end
end
