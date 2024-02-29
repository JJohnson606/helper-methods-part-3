# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  released_on :date
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :rated, presence: true
  validates :released, presence: true
  # Add more validations for other attributes as needed

  serialize :ratings, Array

  # def to_partial_path
  #   "movies/movie"
  # end

end

