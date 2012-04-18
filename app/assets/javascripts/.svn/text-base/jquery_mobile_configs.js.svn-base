$( document ).bind( "mobileinit", function() {
    // Make your jQuery Mobile framework configuration changes here!
    $.mobile.allowCrossDomainPages = true;
    $.mobile.ajaxEnabled = false;
    $.mobile.linkBindingEnabled = false;
    $.mobile.hashListeningEnabled = false;
    $.mobile.pushStateEnabled = false;
});

$('div[data-role="page"]').live('pagehide', function (event, ui) {
    $(event.currentTarget).remove();
});

// Extend the backbone framework
Backbone.View.prototype.datas = {};
Backbone.View.prototype.apply_datas = function() {
	for(var x in this.datas) {
		//this.$el.data(x, this.datas[x]);
		this.$el.attr("data-" + x, this.datas[x]);
	}
};