# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include OrganizationsHelper

  def index
    if authenticated? == false
      redirect_to tables_url
    else
      redirect_to home_url
    end
  end

  def home; end
end
