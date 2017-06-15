class HomeController < ApplicationController
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
  end

  def login
  end
end
