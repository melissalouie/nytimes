class TermsController < ApplicationController
  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to term_path(@term)
    else
      render root_path
    end
  end

  def show
    df = DataFetcher.new
    @term = Term.find(params[:id])
    @articles = df.get_articles(@term.text)
  end

  private

  def term_params
    params.require(:term).permit(:text)
  end
end
