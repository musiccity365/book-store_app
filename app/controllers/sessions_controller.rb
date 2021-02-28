class SessionsController < ApplicationController
  def home
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:success] = "Session successfully created"
      redirect_to login_path(@session)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end
end
