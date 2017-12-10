defprotocol SimpleCan.Can do
  @moduledoc """
  The protocol you should implement for each type of actor you want to check
  authorization for.
  """

  @doc """
  Can the given actor perform the desired action on the subject?
  """
  @spec can?(any, atom, any) :: boolean
  def can?(actor, action, subject)
end
