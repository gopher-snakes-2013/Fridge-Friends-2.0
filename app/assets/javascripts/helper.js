;(function( $, window, document, undefined){
    var setMediaQueries = function(media){
        console.log('QUERY | ' + media);
    };
    var defaults = {
        media: [{name:'tablet',min:35,max:70,color:'red'},{name:'phone',max:34.99,color:'black'},{name:'screen',min:70.01,color:'blue'}],
        colors: [],
        size: 0.5,
        nodes: "<div id='responsive-check'><div class='msg' id='screen'><p>screen</p></div><div class='msg' id='tablet'><p>tablet</p></div><div class='msg' id='phone'><p>phone</p></div></div>",
        styles: "<style>#responsive-check{visibility: hidden;display: none;}.msg {visibility: hidden;display:none;position: absolute;z-index: 100000000000000000000;right: 1em;top: 1em;width: 4em;height: 4em;text-align: center;border: 3px solid black;background-color: white;color: black;font-size: 0.5em;}@media only screen and (max-width: 34.99em){#responsive-check{visibility: visible;display: block;}#phone {visibility: visible;display: block;}}@media only screen and (min-width: 35em) and (max-width: 70em){/* Style adjustments for viewports that meet the condition */#responsive-check{visibility: visible;display: block;}#tablet {visibility: visible;display: block;border: 3px solid red;background-color: white;color: red;}}@media only screen and (min-width: 70.01em) {#responsive-check{visibility: visible;display: block;}#screen {visibility: visible;display: block;border: 3px solid blue;background-color: white;color: blue;}}</style>"
    };

    $.fn.responsive_util = function() {

        // your plugin logic
        /**
        1. create DOM nodes
        2. create CSS
        3. create console functions for enabling and disabling on the fly
        4. detect prexisting media quries OR set default media queries if they aren't found
        5. allow for options object to override defaults (including adding fewer OR extra media contexts)
        6. need function to destroy DOM nodes, CSS entries, <script> include, and JS objects -- FULL DESTROY command
        7. maybe have that destroy be set on a time for testing and then it executes--this should be setable in the OPTIONS object
        8. maybe set an option to look for a flag in the session cookie to be visibly only when a specific variable is present. -- this will allow for integration with certain CMSs (Drupal, WordPress, Concrete 5, etc.)


        **/
        //I'll incorporate this OPTIONS object later.
        var options = {};
        var nodes = "<div id='responsive-check'><div class='msg' id='screen'><p>screen</p></div><div class='msg' id='tablet'><p>tablet</p></div><div class='msg' id='phone'><p>phone</p></div></div>";
        var styles = "<style>#responsive-check{visibility: hidden;display: none;}.msg {visibility: hidden;display:none;position: absolute;z-index: 100000000000000000000;right: 1em;top: 1em;width: 4em;height: 4em;text-align: center;border: 3px solid black;background-color: white;color: black;font-size: 0.5em;}@media only screen and (max-width: 34.99em){#responsive-check{visibility: visible;display: block;}#phone {visibility: visible;display: block;}}@media only screen and (min-width: 35em) and (max-width: 70em){/* Style adjustments for viewports that meet the condition */#responsive-check{visibility: visible;display: block;}#tablet {visibility: visible;display: block;border: 3px solid red;background-color: white;color: red;}}@media only screen and (min-width: 70.01em) {#responsive-check{visibility: visible;display: block;}#screen {visibility: visible;display: block;border: 3px solid blue;background-color: white;color: blue;}}</style>";
        $('body').append(nodes);
        $('head').append(styles);

        console.log('responsive_util: loaded');
        return this;

  };
})( jQuery );