class WordsController < ApplicationController
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
    rx = Regexp.new(search_params[query], g)
    res = Word.find_all{|word| word[name].match(rx)}
    if res.length > 0
      render json: res
    else
      render json: {"oops": "sorry"}
    end
  end 

  def search_params
    params.permit(:query)
  end 

end
