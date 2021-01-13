class Admin::GistsController < ApplicationController
  def show;end

  def index
    @gists = Gist.all
  end
end
