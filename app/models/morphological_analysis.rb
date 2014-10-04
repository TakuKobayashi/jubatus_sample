# == Schema Information
#
# Table name: morphological_analyses
#
#  id          :integer          not null, primary key
#  sentence_id :integer          not null
#  surface     :string(255)      not null
#  reading     :string(255)
#  pos         :string(255)      not null
#  baseform    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_morphological_analyses_on_pos          (pos)
#  index_morphological_analyses_on_sentence_id  (sentence_id)
#  index_morphological_analyses_on_surface      (surface)
#

class MorphologicalAnalysis < ActiveRecord::Base
end
