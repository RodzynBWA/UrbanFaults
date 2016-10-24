
<% if @err.nil? %>
  alert 'done:' + <%= @user_to_ban %>
<% else %>
  alert 'n' + <%= @err %>
<% end %>
