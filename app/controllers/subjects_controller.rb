class SubjectsController < ApplicationController
  before_action :subject, only: [:show, :edit, :update, :attach, :destroy]

  def index
    @pagy, @subjects = pagy(Subject.root)
  end

  def search
    keyword = params[:keyword]
    search_term = SubjectSearchTerm.new(params[:keyword].downcase)
    subjects = Subject.where(search_term.where_clause, search_term.where_params, search_term.order_params)
    @pagy, @subjects = pagy(subjects)
  end

  def new
    @subject = Subject.new(parent_id: params[:parent_id])
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:info] = 'Create successful'
      redirect_to subject_path(@subject)
    else
      flash.now[:error] = @subject.errors.full_messages.join('. ')
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if subject.update_attributes(subject_params)
      flash[:info] = 'Update successful'
      redirect_to subject_path(subject)
    else
      flash.now[:error] = subject.errors.full_messages.join('. ')
      render 'edit'
    end
  end

  def destroy
    parent = subject.parent
    if subject.destroy
      flash[:info] = 'Delete successful'
      if parent.present?
        redirect_to subject_path(parent)
      else
        redirect_to root_path
      end
    else
      flash[:error] = subject.errors.full_messages.join('. ')
      redirect_to subject_path(subject)
    end
  end

  private

  def subject
    @subject ||= Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit :title, :description, :content, :parent_id, :image
  end
end
