require_relative 'player'
require_relative 'question'

class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def ask_question
    question = Question.new
    answer = question.ask(@current_player.name)
    check_answer(question, answer)
  end

  def check_answer(question, answer) 
    if answer == question.correct_answer
      puts "Correct answer!"
      @current_player.score += 1
    else 
      puts "Incorrect answer :( The correct answer was #{question.correct_answer}."
      @current_player.lose_life
    end
    display_scores
  end

  def display_scores
    puts "#{@player1.name}: #{@player1.lives} lives, #{@player1.score} points"
    puts "#{@player2.name}: #{@player2.lives} lives, #{@player2.score} points"
  end

  def game_over?
    !@player1.is_alive || !@player2.is_alive
  end

  def announce_winner
    if @player1.is_alive
      winner = @player1
      loser = @player2
    else
      winner = @player2
      loser = @player1
    end
    puts "#{winner.name} wins with #{winner.score} points!"
    puts "#{loser.name} wins with #{loser.score} points!"
  end

  def play 
    until game_over?
      ask_question
      switch_turns unless game_over?
    end
    announce_winner
  end


end
