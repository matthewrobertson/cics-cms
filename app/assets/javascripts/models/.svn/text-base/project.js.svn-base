CmsRails.Models.Project = Backbone.Model.extend({
	toJSON: function() {
		var json = Backbone.Model.prototype.toJSON.call(this);

		if(!json.users) json.users = [];
		if(!json.resources) json.resources = [];

		return json;
	},

	uploadPhoto: function(imageURI) {
		/*
        var options = new FileUploadOptions();
        options.fileKey="file";
        options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
        options.mimeType="image/jpeg";

        var params = new Object();
        params.name = options.fileName;
        params.description = "description";

        options.params = {"resource": params};

        var ft = new FileTransfer();
        //ft.upload(imageURI, "http://192.168.1.5:3000/projects/1/resources/new.rabl", onPhotoUploadSuccess, onFail, options);
        ft.upload(imageURI, "/projects/" + this.id + "/resources/", function(){
        	alert
        }, function(){}, options);
        */
    }
							
});