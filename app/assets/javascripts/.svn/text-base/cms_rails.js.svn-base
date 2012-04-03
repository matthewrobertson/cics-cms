window.CmsRails = {
  	Models: {},
  	Collections: {},
  	Views: {},
  	Routers: {},
  	init: function() { 
  	}
 }

		var LoginModel = Backbone.Model.extend({
			url:"/sessions.json"			
		});
		
		var LoginView = Backbone.View.extend({
			el: "#login-form",
			
			initialize: function() {
				this.model.on("change:id", this.render, this);
				this.model.on("change:id", this.logged_in, this);
				this.model.on("change:error", this.failed_log_in, this);
			},
			
			events: {
				"click #login": "loginPressed"
			},
			
			render: function() {
				this.$el.toggle(this.model.get("id") === undefined);
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
				//alert("log in successfully as " + this.model.get("email"));
			
				window._projects.fetch();
			},
			
			failed_log_in: function() {
				alert("invalid user name or password");
			}
		});

			var Project = Backbone.Model.extend({
							
			});

			var Projects = Backbone.Collection.extend({
				url:"/projects.json?search=",
				model: Project		
			});
			
			var ProjectView = Backbone.View.extend({
				tagName: "div",
				
				render: function() {
					this.$el.html(this.model.get("name"));
					return this;
				}
			});
		
			var ProjectsView = Backbone.View.extend({
			el: "#projectsDiv",
			
			initialize: function() {
				this.collection.on("reset", this.render, this);
			},
			
			events: {
				
			},
			
			render: function() {
				var projs = this.collection.models;
				for( var i = 0; i < projs.length; i++ ) {
					var v = new ProjectView({model: projs[i]});
					this.$el.append(v.render().el);
				}
				
				return this;
			}
		});
		
$(function() {
	CmsRails.init();
	window._login = new LoginModel();
	window._projects = new Projects();
	window._projectsView = new ProjectsView({collection: window._projects});
	window._loginView = new LoginView({model: window._login});
});
  