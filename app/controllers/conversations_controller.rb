# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # Setting the User to User all and  Created conversation instance variabl;e
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  # checking if sender id and recipient id are present. if so create conversation
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

    private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
  end
