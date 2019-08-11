# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :authorize
  before_action :check_authorization, only: %i[edit update destroy]
  before_action :set_organization, only: %i[edit show]

  def show; end

  def edit; end

  def update
    @organization = current_user.organization
    @organization.name = permit_params
    if @organization.save
      redirect_to @organization, notice: 'updated successfull'
    else
      redirect_to edit_organization_path(@organization), notice: 'somethin went wrong'
    end
  end

  def create; end

  def destroy; end

  private

  def set_organization
    @organization = current_user.organization
  end

  def permit_params
    params.require[:organization].permit(:name)
  end
end
