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

require 'test_helper'

class SentenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
