class Wordlink < ApplicationRecord
  belongs_to :word

  def self.create_both(id1, id2, reltype)
    Wordlink.create(word_id: id1, word_2: id2, reltype: reltype) && Wordlink.create(word_id: id2, word_2: id1, reltype: reltype)
  end
end
