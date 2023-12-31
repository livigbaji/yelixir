defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  @doc """
    Creates deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end


  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Creates deck
  """
  def deal(deck, hand_size) do
    { dealt, _ } = Enum.split(deck,hand_size)
    dealt
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename)  do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _ } -> "This file does not exist"
    end
  end

  @spec create_hand(integer) :: list
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
