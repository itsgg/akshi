class SubjectsController < ApplicationController
  def index
    @pagy, @subjects = pagy(Subject.root)
  end
end
