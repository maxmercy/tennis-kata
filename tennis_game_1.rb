class TennisGame1

  def initialize(player1_name, player2_name)
    raise "hell" if player1_name == player2_name
    @player1_name = player1_name
    @player2_name = player2_name
    @player1_points = 0
    @player2_points = 0
  end

  def won_point(player_name)
    raise "hell" unless [@player1_name, @player2_name].include?(player_name)
    if player_name == @player1_name
      @player1_points += 1
    else
      @player2_points += 1
    end
  end

  def score
    result = ""
    tempScore=0
    if points_delta.zero?
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@player1_points, "Deuce")

    elsif (@player1_points>=4 or @player2_points>=4)
      case points_delta.abs
      when 1
        result = "Advantage #{winner_name}"
      else
        result = "Win for #{winner_name}"
      end

    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @player1_points
        else
          result+="-"
          tempScore = @player2_points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end

  def points_delta
    @player1_points - @player2_points
  end

  def winner_name
    if @player1_points > @player2_points
      @player1_name
    elsif @player1_points < @player2_points
      @player2_name
    else
      raise "hell"
    end
  end
end
