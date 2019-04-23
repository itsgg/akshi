class AttachmentsController < ApplicationController
  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  def create
    attachment = Attachment.new(attachment_params)
    respond_to do |format|
      if attachment.save
        format.json { render json: { url: attachment.file.service_url }, status: :ok }
      else
        format.json { render json: attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def attachment_params
    params.require(:attachment).permit :file
  end
end
