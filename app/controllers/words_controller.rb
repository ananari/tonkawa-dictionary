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
    rx = ""
    if search_params[:searchtype] == "plain"
      stripped_query = search_params[:query].gsub(/[!@#$%^&*()=_+|;':",.<>?'\\\/]/, '')
      rx = Regexp.new("\\b" + stripped_query, Regexp::IGNORECASE)
    else 
      query = search_params[:query].gsub(/\\/, "\\\\")
      rx = Regexp.new(query)
    end
    case search_params[:language]
    when "tonkawa" 
      res = Word.all.find_all{|word| word.strip_name.match(rx)}
    when "english"
      res = Word.all.find_all{|word| word[:definition].match(rx)}
    else
      res = Word.all.find_all{|word| word.strip_name.match(rx) || word[:definition].match(rx)}
    end
    render json: res
  end 

  private

  def search_params
    params.permit(:query, :language, :searchtype)
  end 

end
