# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :sns, class_name: "Sns", foreign_key: :user_id
  has_many :sentences
end
