require 'pp'

class MainController < ApplicationController
  def index
    @top = LbTop.run!
    # @images = Image.all.order(likes_count: :desc).paginate(page: params[:page], :per_page => 6)
    @images = Image.where(aasm_state: :accepted).order(:likes_count).paginate(page: params[:page], :per_page => 6)
      # .reverse_order
  end

  def test
    @user = current_user
    render json: @user
  end
end
