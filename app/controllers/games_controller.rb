require "open-uri"
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
    @myword = params[:randomletters]
    @included = included?(@word, @myword)
    @english_word = english_word?(@word)
  end

  def english_word?(word)
    response = URI.open("https://dictionary.lewagon.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter)}
  end
end
