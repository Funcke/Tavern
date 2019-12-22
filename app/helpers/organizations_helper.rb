# frozen_string_literal: true

# heloer mdoule for orgaizations
module OrganizationsHelper
  def admin?
    current_user.role.name == 'admin'
  end

  def check_authorization
    unless admin?
      redirect_to current_user,
                  notice: 'This action is only for the administrator of your organization'
    end
  end

  def organization
    current_user.organization
  end
end
