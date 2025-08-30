# RSpec: Equality & Comparison Matchers

Welcome to Lesson 12! In this lesson, you'll learn about RSpec's equality and comparison matchers: `eq`, `eql`, `equal`, and the comparison matchers `>`, `<`, `>=`, `<=`. We'll break down what each matcher does, when to use them, and how to avoid common pitfalls. As always, you'll see file path comments, code block language annotations, and plenty of examples.

_Recall from previous lessons: All of these matchers are used with `expect` to set up your test's expectations._

---

## Equality Matchers: eq, eql, equal

```ruby
# /spec/equality_matchers_spec.rb
RSpec.describe "Equality Matchers" do
  it "demonstrates eq matcher" do
    expect(2 + 2).to eq(4) # passes if values are ==
  end

  it "demonstrates eql matcher (same type)" do
    expect(2.0).to eql(2.0) # passes if values and types are the same
  end

  it "demonstrates eql matcher (different type)" do
    expect(2).not_to eql(2.0) # fails because 2 (Integer) != 2.0 (Float)
  end

  it "demonstrates eq vs eql edge case" do
    expect(2).to eq(2.0)   # passes: 2 == 2.0
    expect(2).not_to eql(2.0) # fails: 2 is not the same type as 2.0
  end

  it "demonstrates equal matcher" do
    a = "hello"
    b = a
    expect(a).to equal(b) # passes if a and b are the same object
    expect(a).not_to equal("hello") # fails: different objects with same value
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

Comparison matchers let you check numeric relationships directly. These use the actual comparison operators, not equality (`==`).

```ruby
# /spec/comparison_matchers_spec.rb
RSpec.describe "Comparison Matchers" do
  it "checks greater than" do
    expect(5).to be > 3 # passes if 5 > 3
  end

  it "checks less than or equal to" do
    expect(3).to be <= 3 # passes if 3 <= 3
  end

  it "checks less than" do
    expect(2).to be < 5 # passes if 2 < 5
  end

  it "checks greater than or equal to" do
    expect(10).to be >= 10 # passes if 10 >= 10
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

## Common Pitfalls

- `eq` checks value equality (`==`), not object identity.
- `eql` checks value and type.
- `equal` checks object identity (`.equal?`).
- Use comparison matchers for numeric comparisons, not `eq`—`eq` can pass for numbers of different types (e.g., 2 and 2.0), but `eql` will not.

## Practice Prompts

Try these exercises to reinforce your learning. For each, write your own spec in the appropriate file (e.g., `/spec/equality_matchers_spec.rb`).

1. Write specs using `eq`, `eql`, and `equal` for different data types (integers, floats, strings, arrays).
2. Write specs using `>`, `<`, `>=`, and `<=` for numbers. Try with both integers and floats.
3. Try to make a test fail by mixing up `eq` and `equal`—what happens? What does the failure message tell you?

---

## Resources

- [RSpec: Equality Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/equality-matchers)
- [RSpec: Comparison Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/comparison-matchers)
- [Better Specs: Matchers](https://www.betterspecs.org/#expect)
