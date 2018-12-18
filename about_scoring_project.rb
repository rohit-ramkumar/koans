require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "sc" function will be used to calculate the
# sc of a single roll of the dice.
#
# A greed roll is scd as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# sc([1,1,1,5,1]) => 1150 points
# sc([2,3,4,6,2]) => 0 points
# sc([3,4,5,3,3]) => 350 points
# sc([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the sc method.

def score(dice)
  sc = 0
    sc = 0 if dice.length == 0 
    sc = sc + 1000 if dice.count(1) == 3 
    sc = sc + 600 if dice.count(6) == 3 
    sc = sc + 500 if dice.count(5) == 3 
    sc = sc + 400 if dice.count(4) == 3 
    sc = sc + 300 if dice.count(3) == 3 
    sc = sc +200 if dice.count(2) == 3 
    sc = sc + 100 if dice.count(1) == 1 
    sc = sc + 50 if dice.count(5) == 1 
    sc = sc + 1100 if dice.count(1) == 4 
    sc = 0 + 1200 if dice.count(1) == 5 
    sc = sc + 200 if dice.count(1) == 2 
    sc = sc + 100 if dice.count(5) == 2 
    sc = sc + 550 if dice.count(5) == 4 
    sc = sc + 600 if dice.count(5) == 5 
  
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal nil, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal nil, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal nil, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scs
    assert_equal nil, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal nil, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal nil, score([1,1,1])
  end

  def test_sc_of_other_triples_is_100x
    assert_equal nil, score([2,2,2])
    assert_equal nil, score([3,3,3])
    assert_equal nil, score([4,4,4])
    assert_equal nil, score([5,5,5])
    assert_equal nil, score([6,6,6])
  end

  def test_sc_of_mixed_is_sum
    assert_equal nil, score([2,5,2,2,3])
    assert_equal nil, score([5,5,5,5])
    assert_equal nil, score([1,1,1,1])
    assert_equal nil, score([1,1,1,1,1])
    assert_equal nil, score([1,1,1,5,1])
  end

end
