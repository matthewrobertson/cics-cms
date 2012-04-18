CmsRails.Routers.AppRouter = Backbone.Router.extend({

    hasView: true,
 
    routes:{
        "": "home",
        "login": "login",
        "projects": "projects",
        "project/:id": "proj_page"
    },

    home: function() {
        if(!window._user) {
            if(window.current_user) {
                window._user = new CmsRails.Models.User(window.current_user);
                this.projects();
            }
            else {
                this.login();
            }
        }
        else {
            this.projects();
        }
    },
 
    login: function () {
        var view = new CmsRails.Views.LoginView({
            model: new CmsRails.Models.LoginModel
        });
        this.changePage(view);
    },

    projects: function() {
        if(!window._projects) {
            window._projects = new CmsRails.Collections.Projects();
        }
        var view = new CmsRails.Views.ProjectsView({collection: _projects});
        _projects.fetch();
        this.changePage(view);
    },  

    proj_page: function(id) {
        var that = this;
        var doShow = function() {
            var view = new CmsRails.Views.ProjectView({model: _projects.get(id)});
            that.changePage(view);
        }

        if(!window._projects) {
            $.mobile.showPageLoadingMsg();
            window._projects = new CmsRails.Collections.Projects();
            window._projects.fetch({
                success: doShow
            })
        }
        else {
            doShow();
        }
        
    },
 
    changePage:function (page) {
        $(page.el).attr('data-role', 'page');
        page.render();
        $('body').append($(page.el));
        $.mobile.changePage($(page.el), {changeHash:false});
        
    },

 
});