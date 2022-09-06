# frozen_string_literal: true

require_relative 'game'

puts <<~INTRO

Let's play Mastermind!!

Mastermind is a code-breaking game between two players:
  - The code BREAKER
  - The code SETTER

The code SETTER sets the code, which is a sequence of four
numbers, chosen from (1-6).

The code BREAKER attempts to guess the code within twelve turns.
After each guess, up to four clues will be provided. An 'o' indicates
the guess contains a correct number in the wrong position, while an
'x' means a correct number AND position.

NOTE that these clues appear in no particular order, so the breaker won't
explicitly know WHICH numbers have been guessed correctly via the keys alone.

INTRO

Game.new
