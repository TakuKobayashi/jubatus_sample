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

require 'test_helper'

class SentenceJubatusResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
