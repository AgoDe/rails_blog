class ChatroomController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @messages = Message.all
    @message = Message.new
  end
end
