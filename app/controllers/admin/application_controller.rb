class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_filter :authenticate_staffer!
end
