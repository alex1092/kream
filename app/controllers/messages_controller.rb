class MessagesController < ApplicationController
    before_action do
    @conversation = Conversation.find(params[:conversation_id])
    end

    def index
        @messages = @conversation.messages
        @message = @conversation.messages.new
    end

    def new
        @message = @conversation.messages.new

end