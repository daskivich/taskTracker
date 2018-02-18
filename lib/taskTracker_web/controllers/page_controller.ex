defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  # renders the main log-in page for the application
  def index(conn, _params) do
    render conn, "index.html"
  end

  # if a user is logged in, render the feed page
  # otherwise redirect to the log-in page (see index above)
  def feed(conn, _params) do
    user_id = get_session(conn, :user_id)

    if user_id do
      tasks = TaskTracker.Work.list_tasks()
      changeset = TaskTracker.Work.change_task(%TaskTracker.Work.Task{})
      users = TaskTracker.Accounts.list_users()
      render conn, "feed.html", tasks: tasks, changeset: changeset, users: users
    else
      conn
      |> redirect(to: page_path(conn, :index))
    end
  end
end
