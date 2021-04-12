class Answer < ApplicationRecord
  belongs_to :card, inverse_of: :answer
end
