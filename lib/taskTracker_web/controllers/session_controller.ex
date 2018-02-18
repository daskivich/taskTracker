defmodule TaskTrackerWeb.SessionController do
  use TaskTrackerWeb, :controller

  # if the given email is in the db, create a SessionController
  # then redirect to the user's feed (page/feed)
  # otherwise, redirect to the main log-in page (page/index)
  def create(conn, %{"email" => email}) do
    user = TaskTracker.Accounts.get_user_by_email(email)

    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back, #{user.name}!")
      |> redirect(to: page_path(conn, :feed))
    else
      conn
      |> put_flash(:error, "Cannot create session!")
      |> redirect(to: page_path(conn, :index))
    end
  end

  # deletes the current user's session
  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "You have logged out!")
    |> redirect(to: page_path(conn, :index))
  end
end
