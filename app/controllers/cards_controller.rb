class CardsController < ApplicationController

  CORRECT = "1"
  INCORRECT = "2"
  COMEBACK_LATER = 'Please, come back later'
  GAME_OVER = 'Game Over, all cards has already studied'
  MESSAGES = [COMEBACK_LATER, GAME_OVER]

  def index
    result = Card.choose_card
    if MESSAGES.include? result
      render inline: "<%= link_to 'Новое слово', new_card_path %><div> #{result}  </div>".html_safe
    else
      @card = Card.find(result)
    end
  end

  def new
    @card = Card.new
    @card.build_answer
  end

  def create
    @card = Card.create(card_params)
    @card.group_id = 1
    if @card.save
      redirect_to root_path
    end
  end

  def update
    card = Card.find(params[:id])
    group = Group.find(card.group_id)

    if params[:status] === INCORRECT
      card.errors_count += 1 # start equal 0
      card.group_id = 2
    else
      card.group_id < 11 ?  card.group_id+= 1 : card.group_id = 100
    end

    card.recall_time = DateTime.now.strftime('%s').to_i + group.period unless card.group_id == 100

    if card.save
      redirect_to root_path
      flash[:notice] = 'Good'
    else
      flash[:alert] = 'Attention, something wrong'
    end
  end

  private
  def card_params
    params.require(:card).permit(:eng, answer_attributes: [:word])
  end
end
