class MembersController < ApplicationController

    def index
        @members = Member.all
    end

    def new
        @member = Member.new
    end

    def create
        @member = Member.create(member_params)
    end

    private

    def member_params
        params.require(:member).permit(:name)
    end


end
