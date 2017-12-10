defmodule SimpleCan do
  @moduledoc """
  This provides the basic `can?` macro that you can use to check authorization.

  Just `import` the `can?/3` macro into any module to use.

  ## Example

  ```
  def MyApp.SecretPlace do
    import SimpleCan

    def do_awesome_stuff do
      if can?(user, :create, thing) do
        created_thing = create_thing(user)
        {:ok, created_thing}
      else
        {:error, :no_access}
      end
    end
  end
  ```
  """

  @doc """
  The can macro to check if an actor can take an action on a subject. This will
  call the `can?/3` function of an implementation of the `SimpleCan.Can`
  protocol.
  """
  @spec can?(any, atom, any) :: boolean
  defmacro can?(actor, action, subject) do
    quote bind_quoted: [actor: actor, action: action, subject: subject] do
      SimpleCan.Can.can?(actor, action, subject)
    end
  end
end
