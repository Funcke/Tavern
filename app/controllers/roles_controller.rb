class RolesController < ApplicationController
    before_action :authorize
    before_action :check_authorization, only: [:create]

    def create
        @role = Role.new(role_params)
        current_user.organization.roles << @role
        if @role.save
            redirect_to current_user.organization, notice: 'Successfully created role: ' + @role.name
        else
            redirect_to current_user.organization, notice: 'Creating role failed'
        end
    end

    private
    def role_params
        params.require(:role).permit(:name)
    end
end
