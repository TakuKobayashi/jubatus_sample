class User < ActiveRecord::Base
  has_many :sns, class_name: "Sns", foreign_key: :user_id
end
