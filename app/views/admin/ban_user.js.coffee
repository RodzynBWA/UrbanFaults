<% if @err != nil || !@err.nil? || !@err.empty? %>
  alert 'n + <%= @err %>'
<% else %>
  alert 'done:<%= @user_to_ban %>'
<% end %>
