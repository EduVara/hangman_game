defmodule Hangman do
  @moduledoc """
  El juego del ahorcado

  """


  @doc """
  Esta funcion es la que inicia el juego, no tiene parametros,
  al invocarla pedira que escribas la palabra para jugar
  """
  def start_game() do
    word = IO.gets("Escribe la palabra que desee para el juego\n")
    |> clean_string()
    |> String.downcase()

    state = %{word: word, length: String.length(word), misses: [], matches: [], limit: String.length(word)/2 |> trunc(), mask: "_"}
    {mask_word(state), state}
  end

  @doc """
  Esta funcion es un intento, como parametros se pasa la letre entre comillas dobles ("x")
  y el estado para ir actualizandolo con cada intento
  """
  def take_guess(letter, state) do
    size = size_letter(letter)

    if size == 1 do
      state = guess(String.downcase(letter), state)
      final?(state)
      {mask_word(state), state}
    else
      raise ArgumentError, message: "--------------- THE SIZE OF THE LETTER MUST BE 1 ---------------"
    end
  end



  ################ DEF AUXILIARES ################
  defp mask_word(%{word: word, matches: [], mask: mask} = _state) do
    String.replace(word, ~r/./, mask)
  end

  defp mask_word(%{matches: matches, mask: mask, word: word}) do
    matches = Enum.join(matches)
    IO.inspect(String.replace(word, ~r/[^#{matches}]/, mask))
  end

  defp size_letter(letter) do
    letter
    |> to_string()
    |> String.length()
  end

  defp guess(letter, state) do
    %{word: word, misses: misses, matches: matches, limit: limit} = state

    cond do
      String.contains?(word, letter) && !Enum.member?(matches, letter) ->
            %{state | matches: [letter | matches]}
      !String.contains?(word, letter) && !Enum.member?(misses, letter) ->
            %{state | misses: [letter | misses], limit: limit - 1}
      true ->
            IO.puts("Ya esta probada esa letra")
            state
    end
  end

  defp final?(state) do
    %{limit: limit, matches: matches, length: length} = state

    if limit == 0 do
      IO.puts(" GAME OVER!!!!!!!!!!!! ")
      System.halt(0) # Instruccion de parada del sistema
    end

    if length(matches) == length do
      IO.puts(" YOU WIN!!!!!!!!!!!! ")
      System.halt(0)
    end
  end

  defp clean_string(word) when is_binary(word) do
    String.replace(word, "\n", "")
  end
end
