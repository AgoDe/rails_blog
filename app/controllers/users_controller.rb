class UsersController < ApplicationController
    def index
        @users = User.all_except(current_user)
    end

    def show
        @user = User.find(params[:id])
        @users = User.all_except(current_user)

        @room = Room.new
        @rooms = Room.public_rooms
        @room_name = get_name(@user, current_user)
        @single_room = single_room

        @message = Message.new
        @messages = @single_room.messages.order(created_at: :asc)

        render 'rooms/index'
    end

    private
    
    def get_name(user1, user2)
        users = [user1, user2].sort
        "private_#{users[0].id}_#{users[1].id}"
    end

    def single_room
        if Room.find_by(name: @room_name)
            return Room.find_by(name: @room_name)
        else
            return Room.create_private_room([@user, current_user], @room_name)
        end
    end
    
end