// A self-executing anonymous function,
// standard technique for developing jQuery plugins.

(function($){

    $.fn.splashScreen = function(settings){

        // Providing default options:

        settings = $.extend({
            textLayers		: [],
            textShowTime	: 500,
            textTopOffset	: 80
        },settings);

        var promoIMG = this;

        // Creating the splashScreen div.
        // The rest of the styling is in splashscreen.css

        var splashScreen = $('<div>',{
            id	: 'splashScreen',
            css:{
                backgroundImage		: promoIMG.css('backgroundImage'),
                backgroundPosition	: 'center '+promoIMG.offset().top+'px',
                height				: $(window).height()
            }
        });

        $('body').append(splashScreen);

        for(var i=0;i < settings.textLayers.length; i++) {
            var img = new Image();
            img.src = settings.textLayers[i];

            var text = $('<img>',{
                src:settings.textLayers[i],
                id: 'img'+i,
                css: {
                    position : 'absolute'
                }
            }).hide();

            text.load(function() {
                $(this).css({
                    marginTop : -($(this).height()/2),
                    marginLeft : -($(this).width()/2)
                })
            })

            //text.css('margin-left', $(text).offsetWidth/2+'px');
            //text.css('margin-top', $(text).offsetHeight/2);

            splashScreen.append(text);
        }


//        splashScreen.click(function(){
//            splashScreen.fadeOut('slow');
//        });

        // Binding a custom event for changing the current visible text according
        // to the contents of the textLayers array (passed as a parameter)

        splashScreen.bind('changeText',function(e,newID){

            // If the image that we want to show is
            // within the boundaries of the array:

            if(settings.textLayers[newID]){
                showText(newID);
            }
            else {
                splashScreen.fadeOut('slow');
                //splashScreen.click();
            }
        });



        splashScreen.trigger('changeText',0);

        // Extracting the functionality into a
        // separate function for convenience.

        function showText(id){
            var text = $('#img'+id);;

            text.fadeIn(1500);
            setTimeout(function() {
                splashScreen.trigger('changeText',[id+1]);
            }, settings.textShowTime);//delay(settings.textShowTime);

        }

        return this;
    }

})(jQuery);