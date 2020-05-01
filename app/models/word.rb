class Word < ApplicationRecord
  def strip_name
    self[:name].gsub(/[_-]/, "")
  end
end
