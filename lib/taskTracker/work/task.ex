defmodule TaskTracker.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Work.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time_invested, :integer
    field :title, :string
    belongs_to :user, TaskTracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time_invested, :completed, :user_id])
    |> validate_required([:title, :description, :time_invested, :completed, :user_id])
  end
end
