defmodule SimpleCanTest do
  use ExUnit.Case, async: true
  doctest SimpleCan

  defmodule User do
    defstruct [:name, :role]
  end

  defmodule Alien do
    defstruct [:race, :role]
  end

  defimpl SimpleCan.Can, for: User do
    def can?(%User{role: role}, action, subject) do
      case role do
        :admin -> true
        _ -> false
      end
    end
  end

  defimpl SimpleCan.Can, for: Alien do
    def can?(%Alien{role: role}, action, subject) do
      case role do
        :overlord -> true
        :worker -> false
        _ -> false
      end
    end
  end

  describe "can?/3" do
    test "uses the correct implementation" do
      user = %User{role: :admin}
      alien = %Alien{role: :admin}

      assert SimpleCan.can?(user, :create, []) == true
      assert SimpleCan.can?(alien, :create, []) == false
    end
  end
end
