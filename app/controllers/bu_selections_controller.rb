class BuSelectionsController < ApplicationController
skip_before_action :authenticate_user!
  def index
    #  @bu_selections = BuSelection.all
  end
  def new
  end
  def show
  end
end
