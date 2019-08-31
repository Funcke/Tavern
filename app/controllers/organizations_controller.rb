# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :authorize
  before_action :check_authorization, only: %i[show edit update destroy]
  before_action :set_organization, only: %i[edit show destroy]

  def show; end

  def edit; end

  def update
    organization.update(permit_params)
    if organization.save
      redirect_to organization, notice: 'updated successfull'
    else
      redirect_to edit_organization_path(organization), notice: 'something went wrong'
    end
  end

  def create; end

  def destroy
    @organization.destroy
  end

  private

  def set_organization
    @organization = organization
  end

  def permit_params
    params.require[:organization].permit(
      :name,
      :phone,
      :mail,
      :street,
      :town,
      :zipcode,
      :VAT,
      :legal_name,
      :homepage,
      :currency
    )
  end
end
