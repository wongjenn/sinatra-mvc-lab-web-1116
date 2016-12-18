require 'pry'

class PigLatinizer
  attr_accessor :sentence, :words
  attr_reader :vowels

  def initialize
    @vowels = ["a", "e", "i", "o", "u"]
    @words = []
  end

  def to_pig_latin(sentence)
    @sentence = sentence
    @words = @sentence.split
    latinize_each_word
  end

  def latinize_each_word
    result = @words.collect do |word|
      piglatinize(word)
    end
    result.join(" ")
  end

  def piglatinize(word)
    word.each_char do |chr|
      index = word.index(chr)
      if index != 0 && vowels.include?(chr.downcase)
        consonants = word.slice!(0..index-1)
        return word + consonants + "ay"
      elsif index == 0 && vowels.include?(chr.downcase)
        return word + "way"
      end
    end
    word
  end

end
