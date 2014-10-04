# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  text       :text
#  analyzed   :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_sentences_on_analyzed  (analyzed)
#  index_sentences_on_type      (type)
#

class Sentence < ActiveRecord::Base
  include HttpRequestAction

  has_many :morphological_analyses

  after_create do
    self.analyze!
  end

  def analyze!
    url = "http://jlp.yahooapis.jp/MAService/V1/parse?appid=dj0zaiZpPU1IMGFtd3cxYUQySiZzPWNvbnN1bWVyc2VjcmV0Jng9ZTU-&results=ma,uniq&sentence=" + URI::encode(self.text.to_s)
    result = HttpRequestAction.get_request(url)
    hash = Hash.from_xml(result)
    list = hash["ResultSet"]["ma_result"]["word_list"]["word"]
    records = list.map do |cell|
      MorphologicalAnalysis.new(cell.merge(sentence_id: self.id))
    end
    MorphologicalAnalysis.import(records)
    self.update_attributes!(analyzed: true)
  end
end
