class UserSport < ApplicationRecord
  belongs_to :user
  belongs_to :sports
end
