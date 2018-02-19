# TaskTracker by Daniel Daskivich

Design Decisions

  * The "logged in as", "log out", and "update info" header only shows
    for logged-in users. If you're not logged in, the screen should be
    simple to help prompt you to log in and/or create an account; otherwise
    you shouldn't really have any other options for actions.
  * The user email is constrained to be unique so as to prevent
    multiple accounts with the same email; this helps minimize
    the proliferation of fake accounts and allows for simpler behavor 
    when querying the database by email, e.g., with the get_user_by_email() 
    method.
  * The page controller redirect requests for the feed page
    back to the index page if there is no current user. If a visitor is
    not logged in, they should not see an "empty" feed page; instead
    they should be directed to created an account (through the index page).
  * The feed page contains task/new.html within it for convenience;
    when a new task is created, the feed page reloads
    (with the new task if the current user assigned it to him/herself)--
    unless the new task was passed an invalid changeset,
    in which case task controller redirects to the stand alone task/new.html
    to validate the changeset.
  * When a new task is created, the time_invested and completed inputs
    are hidden with default values of 0 and false respectively;
    when new tasks are created, the assumption is they haven't
    been worked on yet and are not completed. The time_invested and completed
    fields should only be altered by the task assignee, 
    which may not be the task creator.
  * Accounts.list_users() sorts by user name so that when a new task
    is created, its user select will be sorted. This helps people find
    users to assign the new task to more easily.
  * The feed page receives all tasks and then filters these tasks
    to show only those that are assigned to the current user
    via a rendering of task/show.html, thus there is no reason to identify 
    who each tasked is assigned to in the "YourTasks" feed, 
    since they're all assigned to the current user,
    and the current user is noted in the application header.
  * The current user's tasks are sorted in the feed page,
    with the newest tasks at the top; incomplete tasks are noted
    with a red status background. This helps bring both newer and incomplete
    tasks to the current user's attention.
  * From the feed page, listed tasks cannot be edited in place;
    the "edit" button with each task routes through the task controller
    to the appropriate tasks/task.id/edit page, which redirects back
    to the current user's feed when submitted.
  * The "log out" link in the application header simply terminates
    the current session and redirects back to the main index page.
  * The "update info" link in the application header routes to
    user/current_user.id/edit.html through the user controller;
    submissions from this page redirect to the current user's feed.
  * All "cancel" buttons return to the currnet user's feed page; 
    since all actions can be executed from the application header
    or from one page removed from the feed back, no additional
    navigation links are required (i.e., no "home" or "back" buttons
    are required).

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides]
(http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
