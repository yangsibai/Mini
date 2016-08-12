var CodeType = Backbone.Model.extend({

});

var CodeTypeList = Backbone.Collection.extend({
    model: CodeType
});

var jsType = new CodeType({"name": "JavaScript"});
var cssType = new CodeType({"name": "CSS"});
var htmlType = new CodeType({"name": "HTML"});

var codeTypeList = new CodeTypeList([jsType, cssType, htmlType]);

var CodeTypeView = Backbone.View.extend({
    tagName: "button",
    template: "<%= name =%>",
    model: codeTypeList,
    events: {
        "click button" : "chooseCodeType"
    },
    chooseCodeType: function() {
        this.$el.sibling().removeClass('current');
        this.$el.addClass('current');
    }
});

var codeTypeView= new CodeTypeView();
