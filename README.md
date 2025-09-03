# RSpec: Equality & Comparison Matchers

In this lesson, you'll learn about RSpec's equality and comparison matchers: `eq`, `eql`, `equal`, and the comparison matchers `>`, `<`, `>=`, `<=`. We'll break down what each matcher does, when to use them, and how to avoid common pitfalls. As always, you'll see file path comments, code block language annotations, and plenty of examples.

_Recall from previous lessons: All of these matchers are used with `expect` to set up your test's expectations._

---

## Equality Matchers: eq, eql, equal

RSpec provides three main equality matchers, each with a different purpose:

- **`eq`**: Checks value equality using Ruby's `==` operator. Use this when you want to verify that two objects have the same value, regardless of their type or identity.
- **`eql`**: Checks both value and type equality using Ruby's `eql?` method. Use this when you want to ensure that two objects are not only equal in value but also of the same type.
- **`equal`**: Checks object identity using Ruby's `equal?` method. Use this when you want to confirm that two references point to the exact same object in memory.

Below are examples demonstrating how each matcher works:

```ruby
# /spec/equality_spec.rb
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
```

**Sample Output (passing):**

```shell
Equality Matchers
  demonstrates eq matcher
  demonstrates eql matcher (same type)
  demonstrates eql matcher (different type)
  demonstrates eq vs eql edge case
  demonstrates equal matcher

Finished in 0.01 seconds (files took 0.1 seconds to load)
5 examples, 0 failures
```

**Sample Output (failing):**

```shell
Failure/Error: expect(2).not_to eql(2.0)

  expected: value != 2.0
       got: 2
       (compared using eql?)
```

## Comparison Matchers: >, <, >=, <=

Comparison matchers in RSpec let you check numeric relationships directly, such as greater than, less than, and so on. These matchers use Ruby's actual comparison operators (`>`, `<`, `>=`, `<=`) to compare values.

To use these matchers, you combine them with the `be` matcher. The `be` matcher is a generic matcher that can be used with comparison operators to express expectations about numeric relationships. For example, `expect(x).to be > y` checks that `x` is greater than `y`.

Why use `be`? In RSpec, `be` acts as a bridge to allow you to use Ruby's built-in comparison operators in your expectations. This makes your tests more readable and expressive, closely mirroring how you would write comparisons in regular Ruby code.

Below are examples demonstrating how to use comparison matchers with `be`:

```ruby
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
end

```

**Sample Output (passing):**

```shell
Comparison Matchers
  checks greater than
  checks less than or equal to
  checks less than
  checks greater than or equal to

Finished in 0.01 seconds (files took 0.1 seconds to load)
4 examples, 0 failures
```

---

## Getting Hands-On: Student Instructions

This lesson repo is set up for you to get hands-on practice with RSpec's equality and comparison matchers using a real-world recipe domain (Recipe/RecipeRating).

**To get started:**

1. **Fork and Clone** this repository to your own GitHub account and local machine.
2. **Install dependencies:**

    ```sh
      bundle install
    ```

3. **Run the specs:**

    ```sh
      bin/rspec
    ```

4. **Explore the code:**

    - The main domain code is in `lib/recipe_rating.rb`.
    - The robust example specs are in `spec/equality_spec.rb`.

5. **Implement the pending specs:**

    - There are at least two pending specs marked with `pending` in `spec/equality_spec.rb`.
    - Your task: Remove the `pending` line and implement the expectation so the spec passes.

6. **Experiment:**

    - Try adding your own examples using `eq`, `eql`, `equal`, and comparison matchers.
    - Make the specs fail on purpose to see the error messages and learn from them.

All specs should pass except the pending ones. When you finish, all specs should be green!

---

## Resources

- [RSpec: Equality Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/equality-matchers)
- [RSpec: Comparison Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/comparison-matchers)
- [Better Specs: Matchers](https://www.betterspecs.org/#expect)
