class Card < ApplicationRecord
  has_one :answer, inverse_of: :card
  has_one :group, inverse_of: :card
  accepts_nested_attributes_for :answer

  def self.choose_card
    cards = get_working_cards
    if cards.present?
      cards_out_date = get_out_date_cards(cards)
      if cards_out_date.present?
        cards_out_date.max_by{|k| k[:group_id] }.id
      else
        new_cards = get_new_cards(cards)
        if new_cards.present?
          new_cards.first.id
        else
          CardsController::COMEBACK_LATER
        end
      end
    else
      CardsController::GAME_OVER
    end
  end

  def self.get_working_cards
    Card.where('errors_count < 10 AND group_id <= 11')
  end

  def self.get_out_date_cards(cards)
    cards.where('recall_time <= ?', DateTime.now.strftime('%s').to_i)
  end

  def self.get_new_cards(cards)
    cards.where('group_id = 1')
  end
end
