class Admin::AdminController < ApplicationController
  respond_to :html

  before_filter :authenticate_admin_user!

  def admin
    respond_with 'admin'
  end
end
