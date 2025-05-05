class GamesController < ApplicationController
  def new
    #generate an array of 10 random letters and store them as @letters
    characters = ("a".."z").to_a
    p characters
    @letters = characters.sample(10)
    p @letters

  end

  def score
    @word = params[:game]
    myword = params[:randomletters].split
    p myword

    if myword.include?(@word.split)
      @result = "good job"
    else
      @result = "not valid"
      raise
    end
  end
end
