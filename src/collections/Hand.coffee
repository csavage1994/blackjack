class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # debugger

  hit: ->
    @add(@deck.pop())
    #console.log(@hasAce())
    #if @scores()[0] > 21 and @hasAce

  stand: ->
    console.log(@scores())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    if (@minScore() + 10 * @hasAce()) <= 21 
      @minScore() + 10 * @hasAce() 
    else @minScore()



  



    # var x = [@minScore() + 10 * @hasAce(), @minScore()].filter(el){ return el<=21 } 
    # x = x || this.model.reset(); 