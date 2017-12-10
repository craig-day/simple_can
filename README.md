# SimpleCan

A simple library to facilitate authorization in your app. This was inspired by [Canada](https://github.com/jarednorman/canada) but with a more flexible API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_can` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_can, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/simple_can](https://hexdocs.pm/simple_can).

## Usage

1. Define an implementation of the `SimpleCan.Can` protocol for a specific module

    ```elixir
    defimpl SimpleCan.Can, for: MyApp.User do
      def can?(%MyApp.User{role: role}, :create, %MyApp.OtherResource{}) do
        case role do
          :admin -> true
          :user -> false
          _ -> false
        end
      end

      def can?(%MyApp.User{}, action, %MyApp.OtherResource{}) when action in [:read, :view] do
        true
      end
    end
    ```

1. Import `SimpleCan` and use it
    _note:_ (you can optionally specify `only: [can?: 3]` but that is the only function defined anyway)

    ```elixir
    import SimpleCan

    def create_object(object) do
      if can?(current_user, :create, object) do
        {:ok, create(object)}
      else
        {:error, :unauthorized}
      end
    end
    ```
