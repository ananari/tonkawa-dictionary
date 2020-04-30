class WordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    words = Word.all
    render json: words
  end
  def show
    word = Word.find_by(name: params[:id])
    render json: word
  end
  def home
    render json: {yay: "you did it!"}
  end

  def search
    res = []
    rx = Regexp.new(search_params[:query], Regexp::IGNORECASE)
    case search_params[:language]
    when "tonkawa" 
      res = Word.all.find_all{|word| word[:name].match(rx)}
    when "english"
      res = Word.all.find_all{|word| word[:definition].match(rx)}
    else
      res = Word.all.find_all{|word| word[:name].match(rx) || word[:definition].match(rx)}
    end
    render json: res
  end 

  def search_params
    params.permit(:query, :language)
  end 

end
