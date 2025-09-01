
require 'recipe_rating'

RSpec.describe 'Recipe and RecipeRating equality and comparison matchers' do
  let(:recipe1) { Recipe.new('Pancakes', RecipeRating.new(5, 'Alice')) }
  let(:recipe2) { Recipe.new('Waffles', RecipeRating.new(4, 'Bob')) }
  let(:rating_a) { RecipeRating.new(5, 'Alice') }
  let(:rating_b) { RecipeRating.new(5, 'Alice') }
  let(:rating_c) { RecipeRating.new(5, 'Bob') }
  let(:rating_d) { RecipeRating.new(4, 'Alice') }

  describe 'eq matcher' do
    it 'checks value equality for numbers' do
      expect(recipe1.rating.value).to eq(5)
    end

    it 'checks value equality for RecipeRating objects' do
      expect(rating_a).to eq(rating_b)
    end
  end

  describe 'eql matcher' do
    it 'checks value and type for numbers' do
      expect(5).to eql(5)
      expect(5).not_to eql(5.0)
    end

    it 'checks value and reviewer for RecipeRating' do
      expect(rating_a).to eql(rating_b)
      expect(rating_a).not_to eql(rating_c)
    end
  end

  describe 'equal matcher' do
    it 'checks object identity for RecipeRating' do
      expect(rating_a).not_to equal(rating_b)
      expect(rating_a).to equal(rating_a)
    end

    it 'checks object identity for strings' do
      a = 'hello'
      b = 'hello'
      expect(a).not_to equal(b)
      expect(a).to eq(b)
    end
  end

  describe 'comparison matchers' do
    it 'checks greater than for rating values' do
      expect(recipe1.rating.value).to be > recipe2.rating.value
    end

    it 'checks less than or equal to for rating values' do
      expect(recipe2.rating.value).to be <= recipe1.rating.value
    end

    it 'checks less than for rating values' do
      expect(recipe2.rating.value).to be < recipe1.rating.value
    end

    it 'checks greater than or equal to for rating values' do
      expect(recipe1.rating.value).to be >= recipe2.rating.value
    end
  end

  describe 'pending specs for students' do
    it 'is pending: test that two Recipe objects with same name and rating are eq but not equal' do
      pending("Student: Write a spec for eq vs equal on Recipe objects")
      raise "Unimplemented pending spec"
    end

    it 'is pending: test that a RecipeRating with higher value is greater than another' do
      pending("Student: Write a spec for > on RecipeRating objects")
      raise "Unimplemented pending spec"
    end
  end
end
