module OrganizationsHelper
    def is_admin?
        current_user.role.name == 'admin'
    end

    def check_authorization
        unless is_admin?
            redirect_to current_user, notice: 'This action is only for the administrator of your organization'
        end
    end
end
