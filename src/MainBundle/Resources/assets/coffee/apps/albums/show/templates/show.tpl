<div>
    Items per page <%- num_items_per_page %>
    <p><%- id %> <%- name %></p>
    <% if (items.length <= 0) { %>
        Not found
    <% } else { %>
        <% _.each(items, function(data) { %>
    <div  class="image">
        <p>Image Id:<%- data.id %><p>
        <img src="<%- data.path %>" alt="img"/> </p>
    </div>
        <% }); %>
    <% } %>

    <div class="pagination">

        <% for(var i = 1; i < Math.ceil(total_count/num_items_per_page) + 1; i++) { %>
            <div class="btn btn-primary" id="navigate-to"><%-i %></div>
        <% } %>
    </div>
</div>