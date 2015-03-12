class Term < ActiveRecord::Base
  validates :term, presence: true
end
