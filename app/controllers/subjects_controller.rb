class SubjectsController < ApplicationController
  before_action :subject, only: [:show]

  def index
    @pagy, @subjects = pagy(Subject.root)
  end

  def show
  end

  private

  def subject
    @subject = Subject.find(params[:id])
  end
end
