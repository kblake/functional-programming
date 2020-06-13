defmodule Coin do
  defstruct side_showing: 0

  def flip(coin) do
    %Coin{coin | side_showing: :random.uniform(2) - 1}
  end

  def equal?(coin1, coin2) do
    coin1.side_showing == coin2.side_showing
  end

  def coin_side(coin) do
    case coin.side_showing do
      1 -> "heads"
      0 -> "tails"
    end
  end
end

# TODO: as exercise
# wrap this in a loop asking user for input: "same" or "different"
# if coins are the same and user guessed the same then they win
# if coins are the different and user guessed different then they win
defmodule CoinGame do
  def run do
    :random.seed(:os.timestamp())

    coin1 = %Coin{}
    coin2 = %Coin{}

    coin1 = Coin.flip(coin1)
    coin2 = Coin.flip(coin2)

    IO.puts(Coin.coin_side(coin1))
    IO.puts(Coin.coin_side(coin2))

    if Coin.equal?(coin1, coin2) do
      IO.puts("They are the same")
    else
      IO.puts("They are different")
    end
  end
end

CoinGame.run()
