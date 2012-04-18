CmsRails.Models.Project = Backbone.Model.extend({
	toJSON: function() {
		var json = Backbone.Model.prototype.toJSON.call(this);

		if(!json.users) json.users = [];
		if(!json.resources) json.resources = [];

		return json;
	}
							
});