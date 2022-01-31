<h1>Create a post</h1>
<%= form_with url: user_posts_path, scope: :data do |form| %>
<div class="form-container d-flex">
	<section>
		<%= form.label :title, "Title", class: "label" %>
		<%= form.text_field :title, placeholder: "Title", required: true %>
	</section>
	<section>
		<%= form.text_area :text, placeholder: "Type here...", rows: 14, required: true %>
	</section>
	<%= form.submit "Post", class: "submit-btn" %>
  </div>
<% end %>