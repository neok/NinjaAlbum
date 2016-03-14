<% if (items.length <= 0) { %>
    <p class="error">Not found</p>
<% } else { %>
<% _.each(items, function(data) { %>
    <div class="image">
        <span>Image Id:<%- data.id %></span>
        <img src="<%- data.path %>" alt="img"/>
    </div>
<% }); %>
<% } %>

<div class="pagination">

</div>

<nav>
    <ul class="pagination">
        <% var paginationItemCount = Math.ceil(total_count/num_items_per_page) + 1 %>
        <% if (typeof current_page_number != 'undefined' && current_page_number > 1) { %>
        <li>
            <a href="#" class="previous" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <% } %>
        <% for(var i = 1; i < paginationItemCount; i++) { %>
            <li class="<% if ((typeof current_page_number != 'undefined' && current_page_number == i)
                || (typeof current_page_number == 'undefined' && i == 1)) { %>
            disabled
            <% } else { %>navigate-to<% } %>"><a href="#"><%-i %></a></li>
        <% } %>

        <% if ((typeof current_page_number != 'undefined' && (paginationItemCount - current_page_number - 1) >= 1) || (typeof current_page_number == 'undefined')) { %>
        <li>
            <a href="#" class="next" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <% } %>

    </ul>
</nav>
