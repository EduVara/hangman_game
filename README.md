# HangmanGame

Juego del ahoracado basado en el proyecto de Platzi cambiando las funcionalidades y yendo un paso mas alla respecto a este.
En este juego podemos usar cualquier palabra, mayusculas, minusculas, lo que queramos.

Para ejecutar el proyecto hay que seguir los siguientes pasos:

  1er PASO:
    Tener elixir y erlang instalado en el PC 
    
  2o PASO:  
    Ejecutarlo con el comando iex -S mix (o iex.bat -S mix si usas Windows)


  3er PASO:  
    Llamamos a la primera funcion para iniciar el juego de la siguiente forma:
      {word, state} = Hangman.start_game() 
            --> {word, state} es para guardar en las variables word y state la palabra con la que vamos a jugar y el estado del juego para pasarlo mas adelante
  4o PASO: 
    Llamamos a la segunda funcion principal para empezar a probar letras:
      {word, state} = Hangman.take_guess("letra", state)
            --> Donde pone "letra", hay que poner una letra, si se mete mas de una el programa te indica que 
            solo se puede poner de 1 en 1
  5o PASO:
    Repetir continuamente el 4o PASO con diferentes letras hasta ganar o perder la partida

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hangman_game` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hangman_game, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hangman_game>.

