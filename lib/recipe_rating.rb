# frozen_string_literal: true

# Represents a recipe with a name and a rating
class Recipe
  attr_reader :name, :rating

  def initialize(name, rating)
    @name = name
    @rating = rating
  end
end

# Represents a rating for a recipe, with value and reviewer
class RecipeRating
  attr_reader :value, :reviewer

  def initialize(value, reviewer)
    @value = value
    @reviewer = reviewer
  end

  def ==(other)
    other.is_a?(RecipeRating) && value == other.value
  end

  def eql?(other)
    other.is_a?(RecipeRating) && value.eql?(other.value) && reviewer.eql?(other.reviewer)
  end

  def equal?(other)
    super
  end

  def <=>(other)
    value <=> other.value
  end
end
