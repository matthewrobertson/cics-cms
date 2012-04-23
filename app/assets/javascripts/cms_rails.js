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
		
 document.addEventListener("deviceready",function() {
        window.pictureSource=navigator.camera.PictureSourceType;
        window.destinationType=navigator.camera.DestinationType;
},false);

		
$(function() {
//  $(document).bind('pageinit', function(){
	CmsRails.init();
});
  