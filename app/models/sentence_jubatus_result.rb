# == Schema Information
#
# Table name: sentence_jubatus_results
#
#  id          :integer          not null, primary key
#  sentence_id :integer          not null
#  type        :string(255)      not null
#  label       :string(255)
#  score       :float(24)        default(0.0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_sentence_jubatus_results_on_score        (score)
#  index_sentence_jubatus_results_on_sentence_id  (sentence_id)
#  index_sentence_jubatus_results_on_type         (type)
#

class SentenceJubatusResult < ActiveRecord::Base
  require 'jubatus/classifier/client'

  def self.exec_jubatus
    cli = Jubatus::Classifier::Client::Classifier.new("127.0.0.1", 9199, self.class.to_s)
    train_data = []
    Sentence.find_each do |sentence|
      sentence.morphological_analyses.each do |analyse|
        attribute = analyse.attributes
        attribute.delete_if{|k,v| "sentence_id" == k.to_s }
        train_data << [sentence.id.to_s, Jubatus::Common::Datum.new(attribute)]
      end
  	end
  	=begin
  	cli.train(train_data)
  	results = client.classify(test_data)
    results.each { |result|
      result.each { |r|
        puts(r.label + " " + r.score.to_s)
      }
    }
    =end
  end
end
