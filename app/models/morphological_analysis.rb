# == Schema Information
#
# Table name: morphological_analyses
#
#  id          :integer          not null, primary key
#  sentence_id :integer          not null
#  surface     :string(255)      not null
#  reading     :string(255)      not null
#  pos         :string(255)      not null
#  baseform    :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_morphological_analyses_on_baseform     (baseform)
#  index_morphological_analyses_on_pos          (pos)
#  index_morphological_analyses_on_sentence_id  (sentence_id)
#

class MorphologicalAnalysis < ActiveRecord::Base
end
