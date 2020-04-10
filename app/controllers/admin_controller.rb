class AdminController < ApplicationController
  before_action :require_logged_in, :be_admin
end
