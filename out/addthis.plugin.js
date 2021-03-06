// Generated by CoffeeScript 1.9.1
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  module.exports = function(BasePlugin) {
    var addThisPlugin;
    return addThisPlugin = (function(superClass) {
      extend(addThisPlugin, superClass);

      function addThisPlugin() {
        return addThisPlugin.__super__.constructor.apply(this, arguments);
      }

      addThisPlugin.prototype.name = 'addthis';

      addThisPlugin.prototype.addthisWidget = function(type, style, trackUrlCopy) {
        var blockAddThisFloating, bulk, preferred_btns, trackCode;
        if (trackUrlCopy === true) {
          trackCode = "<script type=\"text/javascript\">var addthis_config = {\"data_track_addressbar\":true};</script>";
        } else {
          trackCode = "";
        }
        preferred_btns = "<a class=\"addthis_button_preferred_1\"></a>\n		<a class=\"addthis_button_preferred_2\"></a>\n		<a class=\"addthis_button_preferred_3\"></a>\n		<a class=\"addthis_button_preferred_4\"></a>\n		<a class=\"addthis_button_compact\"></a>";
        switch (type) {
          case 'std':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_default_style\" style=\"" + style + "\">\n<a class=\"addthis_button_facebook_like\" fb:like:layout=\"button_count\"></a>\n<a class=\"addthis_button_tweet\"></a>\n<a class=\"addthis_button_pinterest_pinit\"></a>\n<a class=\"addthis_counter addthis_pill_style\"></a>\n</div>";
            break;
          case 'flaot':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_floating_style addthis_counter_style\" style=\"" + style + "\">\n<a class=\"addthis_button_facebook_like\" fb:like:layout=\"box_count\"></a>\n<a class=\"addthis_button_tweet\" tw:count=\"vertical\"></a>\n<a class=\"addthis_button_google_plusone\" g:plusone:size=\"tall\"></a>\n<a class=\"addthis_counter\"></a>\n</div>";
            break;
          case 'thirtytwo':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style\" style=\"" + style + "\">\n" + preferred_btns + "\n<a class=\"addthis_counter addthis_bubble_style\"></a>\n</div>";
            break;
          case 'sm_bub':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_default_style\" style=\"" + style + "\">\n" + preferred_btns + "\n<a class=\"addthis_counter addthis_bubble_style\"></a>\n</div>";
            break;
          case 'addthis_btn':
            bulk = "<!-- AddThis Button BEGIN -->\n<a class=\"addthis_button\" href=\"http://www.addthis.com/bookmark.php?v=300&amp;pubid=ra-513e32f975a0171d\"><img src=\"http://s7.addthis.com/static/btn/v2/lg-share-en.gif\" width=\"125\" height=\"16\" alt=\"Bookmark and Share\" style=\"" + style + "border:0\"/></a>";
            break;
          case 'vert32':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_floating_style addthis_32x32_style\" style=\"{style}\">\n" + preferred_btns + "\n</div>";
            break;
          case 'vert16':
            bulk = "<!-- AddThis Button BEGIN -->\n<div class=\"addthis_toolbox addthis_floating_style addthis_16x16_style\" style=\"" + style + "\">\n" + preferred_btns + "\n</div>";
        }
        blockAddThisFloating = ("<!-- AddThis Button BEGIN -->\n" + bulk + "\n" + trackCode + "\n<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-513e32f975a0171d\"></script>\n<!-- AddThis Button END -->").replace(/^\s+|\n\s*|\s+$/g, '');
        return blockAddThisFloating;
      };

      addThisPlugin.prototype.extendTemplateData = function(arg) {
        var me, templateData;
        templateData = arg.templateData;
        me = this;
        templateData.getAddThisBlock = function(type, style, trackUrlCopy) {
          this.referencesOthers();
          return me.addthisWidget(type, style, trackUrlCopy);
        };
        return this;
      };

      return addThisPlugin;

    })(BasePlugin);
  };

}).call(this);
