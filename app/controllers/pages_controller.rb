class PagesController < ApplicationController
  def index
    @term = Term.new
  end
end
