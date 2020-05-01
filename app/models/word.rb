class Word < ApplicationRecord
  has_many :wordlinks
  def strip_name
    self[:name].gsub(/[_-]/, "")
  end

  def half_strip_name
    self[:name].gsub(/_/, "")
  end

  def self.sub_chars(input)
    input = input.gsub(/\?/, "ˀ")
    input = input.gsub(/\./, "·")
    input = input.gsub(/[!@#$%^&*()=_+|;':",<>'\\\/]/, '')
    return input
  end

  def words
    return self.wordlinks.map{|link| Word.find(link.word_2)}
  end
end
