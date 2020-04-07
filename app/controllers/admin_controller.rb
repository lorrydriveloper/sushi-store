class AdminController < ApplicationController
  # layout 'admin' maybe to refactor idea?
  before_action :require_logged_in, :be_admin
end
