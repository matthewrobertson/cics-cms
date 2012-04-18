window.CmsRails = {
  	Models: {},
  	Collections: {},
  	Views: {},
  	Routers: {},
  	init: function() { 
  		//window._login = new LoginModel();
		//window._projects = new Projects();
		//window._projectsView = new ProjectsView({collection: window._projects});
		//window._loginView = new LoginView({model: window._login});
		window.app = new CmsRails.Routers.AppRouter();
		Backbone.history.start({pushState: false, root: "/mobile/"})
  	}
 };
		
	//Camera code Begin
		var pictureSource;   
	    var destinationType;  
		document.addEventListener("deviceready",onDeviceReady,false);
	
	    function onDeviceReady() {
	    	pictureSource=navigator.camera.PictureSourceType;
	        destinationType=navigator.camera.DestinationType;
	    }
	    function onPhotoURISuccess(imageURI) {
	    	
	      var largeImage = document.getElementById('largeImage');
	      largeImage.style.display = 'block';
	      largeImage.src = imageURI;
	    }
	
	    function capturePhoto() {
	      navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 50, destinationType : Camera.DestinationType.DATA_URL });
	    }
	
	    function getPhoto(source) {
	      navigator.camera.getPicture(uploadPhoto, onFail, { quality: 50, 
	        destinationType: destinationType.FILE_URI,
	        sourceType: source });
	    }
	    
		function uploadPhoto(imageURI) {
            var options = new FileUploadOptions();
            options.fileKey="file";
            options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
            options.mimeType="image/jpeg";

            var params = new Object();
            params.name = options.fileName;
            params.description = "description";

            options.params = params;

            var ft = new FileTransfer();
            //ft.upload(imageURI, "http://192.168.1.5:3000/projects/1/resources/new.rabl", onPhotoUploadSuccess, onFail, options);
            ft.upload(imageURI, "http://128.189.228.144:3000/projects/1/resources/", onPhotoUploadSuccess, onFail, options);
        }

		function onPhotoUploadSuccess(imageURI) {
	    	alert("Upload Success");
	    }
		
	    function onFail(message) {
	      alert('Failed because: ' + message);
	    }
		//Camera code End
		
$(function() {
	CmsRails.init();
});
  