class Manager < ApplicationRecord
    has_secure_password
    has_many :bands

    def new
        @manager = Manager.new
    end

    def create
        @manager = Manager.new(manager_params)
        if @manager.save
            redirect_to bands_path(@manager)
        else
            render :new
        end
    end

    
end
