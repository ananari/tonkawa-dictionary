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
    res = {}
    if search_params[:query]
      rx = Regexp.new(search_params[:query], Regexp::IGNORECASE)
      res = Word.all.find_all{|word| word[:name].match(rx)}
    end
    if res.length > 0
      render json: res
    else
      render json: ["oops"]
    end
  end 

  def search_params
    params.permit(:query)
  end 

end
