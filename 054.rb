# frozen_string_literal: true

class Card
  include Comparable
  attr_reader :suit

  SUITS = ['H', 'C', 'S', 'D']
  VALUES_HASH = Hash[(2..9).map { |i| [i.to_s, i] }.concat([['T', 10], ['J', 11], ['Q', 12], ['K', 13], ['A', 14]])]

  def initialize(suit, value)
    fail unless SUITS.include?(suit)
    fail unless VALUES_HASH.keys.include?(value)
    @suit = suit
    @value = value
  end

  # Return numerical value.
  def value
    VALUES_HASH[@value]
  end

  def <=>(other)
    self.value <=> other.value
  end

  def inspect
    "#{@value}#{@suit}"
  end

  class << self
    def parse(str)
      tmp = /(?<value>[2-9TJQKA]+)(?<suit>[HCSD]+)/.match(str)
      Card.new(tmp[:suit], tmp[:value])
    end
  end
end

class PokerGameHand
  include Comparable
  attr_reader :cards

  HAND_CLASSIFICATIONS_HASH = Hash[
    [['High Card', (HIGH_CARD = 1)],
     ['One Pair', (ONE_PAIR = 2)],
     ['Two Pairs', (TWO_PAIRS = 3)],
     ['Three of a Kind', (THREE_OF_A_KIND = 4)],
     ['Straight', (STRAIGHT = 5)],
     ['Flush', (FLUSH = 6)],
     ['Full House', (FULL_HOUSE = 7)],
     ['Four of a Kind', (FOUR_OF_A_KIND = 8)],
     ['Straight Flush', (STRAIGHT_FLUSH = 9)],
     ['Royal Flush', (ROYAL_FLUSH = 10)]
    ]
  ]

  def initialize(*cards)
    fail unless cards.all? { |c| c.class == Card }
    fail unless cards.length == 5
    @cards = cards
  end

  def <=>(other)
    eq_test_result = self.hand_rank <=> other.hand_rank
    if eq_test_result.zero?
      eq_test_result2 = self.values <=> other.values
      fail 'Unable to resolve poker game hand ordering.' if eq_test_result2.zero?
      eq_test_result2
    else
      eq_test_result
    end
  end

  def hand_rank
    @hand_rank ||=
      if royal_flush?
        ROYAL_FLUSH
      elsif straight_flush?
        STRAIGHT_FLUSH
      elsif four_of_a_kind?
        FOUR_OF_A_KIND
      elsif full_house?
        FULL_HOUSE
      elsif flush?
        FLUSH
      elsif straight?
        STRAIGHT
      elsif three_of_a_kind?
        THREE_OF_A_KIND
      elsif two_pairs?
        TWO_PAIRS
      elsif one_pair?
        ONE_PAIR
      else
        HIGH_CARD
      end
  end

  # An array of values in order of decreasing significance (values
  # after first value are only to be used as tie-breakers).
  def values
    case hand_rank
    when ROYAL_FLUSH, STRAIGHT_FLUSH, FLUSH, STRAIGHT, HIGH_CARD
      @cards.sort.map(&:value).reverse
    when FOUR_OF_A_KIND, FULL_HOUSE, THREE_OF_A_KIND, TWO_PAIRS, ONE_PAIR
      # TODO: Improve readability of following code.
      @cards.map(&:value).group_by {|n| n}.values.sort_by {|arr|
        arr.length
      }.reverse.group_by {|arr|
        arr.length
      }.values.map {|arr_of_arr|
        arr_of_arr.sort_by {|arr| arr[0] }.reverse
      }.flatten.uniq
    else # Should never happen
      fail 'Program invariant violated. GUID: p4u930utaptawfpta'
    end
  end

  def royal_flush?
    @cards.map(&:value).include?(Card::VALUES_HASH.values.max) && straight_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    @cards.group_by(&:value).values.any? { |ar| ar.length == 4 }
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    @cards.map(&:suit).uniq.length == 1
  end

  def straight?
    tmp = @cards.sort.map(&:value).uniq
    tmp.length == 5 && ((tmp.max - tmp.min) == 4)
  end

  def three_of_a_kind?
    @cards.group_by(&:value).values.any? { |ar| ar.length == 3 }
  end

  def two_pairs?
    @cards.group_by(&:value).values.select { |ar| ar.length == 2 }.length == 2
  end

  def one_pair?
    @cards.group_by(&:value).values.any? { |ar| ar.length == 2 }
  end

  def high_card?
    true
  end
end

class PokerGame
  attr_reader :player1_hand, :player2_hand

  PLAYER1 = 0
  PLAYER2 = 1

  def initialize(player1_hand, player2_hand)
    fail unless [player1_hand, player2_hand].all? { |hand| hand.class == PokerGameHand }
    @player1_hand = player1_hand
    @player2_hand = player2_hand
  end

  def winner
    @winner ||=
      if player1_hand > player2_hand
        PLAYER1
      elsif player2_hand > player1_hand
        PLAYER2
      else
        fail 'Program invariant violated. GUID: 4u20uta0up902upata'
      end
  end
end

class PokerDealerSession
  attr_reader :game

  def initialize(*cards)
    fail unless cards.length == 10
    @game = PokerGame.new(
      PokerGameHand.new(*cards[0..4]),
      PokerGameHand.new(*cards[5..9])
    )
  end
end

player1_win_count = 0
poker_card_games = File.read('./data/054/p054_poker.txt').strip.split(/\r?\n/).map { |str| str.split(/\s+/) }
poker_card_games.each do |poker_card_game|
  fail if poker_card_game.length.zero?
  poker_dealer_session = PokerDealerSession.new(*poker_card_game.map { |card_str| Card.parse(card_str) })
  player1_win_count = player1_win_count + 1 if poker_dealer_session.game.winner == PokerGame::PLAYER1
end

puts player1_win_count

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 054.rb
376

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=54); please visit the site and donate to it if you find it useful)
Poker hands
Problem 54

In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
High Card: Highest value card.
One Pair: Two cards of the same value.
Two Pairs: Two different pairs.
Three of a Kind: Three cards of the same value.
Straight: All cards are consecutive values.
Flush: All cards of the same suit.
Full House: Three of a kind and a pair.
Four of a Kind: Four cards of the same value.
Straight Flush: All cards are consecutive values of same suit.
Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.
Consider the following five hands dealt to two players:
Hand

Player 1

Player 2

Winner
1

5H 5C 6S 7S KD
Pair of Fives

2C 3S 8S 8D TD
Pair of Eights

Player 2
2

5D 8C 9S JS AC
Highest card Ace

2C 5C 7D 8S QH
Highest card Queen

Player 1
3

2D 9C AS AH AC
Three Aces

3D 6D 7D TD QD
Flush with Diamonds

Player 2
4

4D 6S 9H QH QC
Pair of Queens
Highest card Nine

3D 6D 7H QD QS
Pair of Queens
Highest card Seven

Player 1
5

2H 2D 4C 4D 4S
Full House
With Three Fours

3C 3D 3S 9S 9D
Full House
with Three Threes

Player 1
The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
How many hands does Player 1 win?
=end
