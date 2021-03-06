defmodule TaskTracker.Work.Block do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Work.Block

  # a block is a continuous chunk of time with a start and possibly and end_time
  # a block has a task to which its assigned
  schema "blocks" do
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    belongs_to :task, TaskTracker.Work.Task

    timestamps()
  end

  @doc false
  def changeset(%Block{} = block, attrs) do
    block
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :task_id])
  end
end
