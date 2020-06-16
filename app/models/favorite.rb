class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :self_analysis

end
