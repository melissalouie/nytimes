class Term < ActiveRecord::Base
  validates :text, presence: true
end
