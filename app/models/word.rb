class Word < ApplicationRecord
  has_many :wordlinks
  def strip_name
    self[:name].gsub(/[_-]/, "")
  end

  def half_strip_name
    self[:name].gsub(/_/, "")
  end

  def words
    return self.wordlinks.map{|link| Word.find(link.word_2)}
  end
end
