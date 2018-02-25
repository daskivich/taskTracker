// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import $ from "jquery";

function end_block_click(ev) {
  let btn = $(ev.target);
  let id = btn.data('id');
  let task_id = btn.data('task-id');
  let start_time = btn.data('start-time');
  let end_time = new Date();

  let text = JSON.stringify({
    block: {
      start_time: start_time,
      end_time: end_time,
      task_id: task_id
    }
  });

  $.ajax(block_path + "/" + id, {
    method: "put",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text
  });
}

function init_end_block() {
  if (!$('.stop-block')) {
    return;
  }

  $('.stop-block').click(end_block_click);
}

$(init_end_block);
