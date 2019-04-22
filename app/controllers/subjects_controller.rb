class SubjectsController < ApplicationController
  def index
    @pagy, @subjects = pagy(Subject.all)
  end
end
