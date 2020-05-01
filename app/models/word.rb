class Word < ApplicationRecord
  has_many :wordlinks
  def strip_name
    self[:name].gsub(/[_-]/, "")
  end
end
