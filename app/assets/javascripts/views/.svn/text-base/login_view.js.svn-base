CmsRails.Views.LoginView = Backbone.View.extend({

	template: JST['login_template'],
	
	initialize: function() {
		this.model.on("change:id", this.logged_in, this);
		this.model.on("change:error", this.failed_log_in, this);
	},
	
	events: {
		"click #login": "loginPressed"
	},
	
	render: function() {
		this.$el.html(this.template({}));
		return this;
	},
	
	loginPressed: function(e) {
		e.preventDefault();
		console.log("attempting to log in");
		var password = this.$("#password").val();
		var email = this.$("#email").val();
		this.model.set({
			email: email,
			password: password
		});
		this.model.save();
	},
	
	logged_in: function() {
		window._user = new CmsRails.Models.User(this.model.attributes);
		window.app.navigate("projects", {trigger: true});

	},
	
	failed_log_in: function() {
		alert("invalid user name or password");
	}
});