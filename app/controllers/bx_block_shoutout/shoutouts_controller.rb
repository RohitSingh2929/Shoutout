module BxBlockShoutout
  class ShoutoutsController < ApplicationController
    include Rails.application.routes.url_helpers
    before_action :set_shoutout, only: [:show, :update, :destroy]
    skip_before_action :verify_authenticity_token  


    def index
      @shoutouts = Shoutout.all
      render json: @shoutouts
    end

    def show
      render json: @shoutout
    end

    def update
      if @shoutout.update(shoutout_params)
        render json: @shoutout
      else
        render json: @shoutout.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @shoutout.destroy
      head :no_content
    end
    
    def create
      @shoutout = Shoutout.new(shoutout_params)

      if @shoutout.save
        render json: shoutout_with_image_urls(@shoutout, request), status: :created
      else
        render json: @shoutout.errors, status: :unprocessable_entity
      end
    end
    
    private

    def shoutout_with_image_urls(shoutout, request)
      shoutout.as_json.merge({
        profile_image_url: shoutout.profile_image.attached? ? url_for_attached(shoutout.profile_image, request) : nil,
        shoutout_image_url: shoutout.shoutout_image.attached? ? url_for_attached(shoutout.shoutout_image, request) : nil
      })
    end

    def url_for_attached(attachment, request)
      if request.base_url.present?
        rails_blob_url(attachment)
      else
        rails_blob_path(attachment)
      end
    end

    def shoutout_params
      params.permit(:name, :description, :message, :profile_image, :shoutout_image)
    end
  end
end
    




