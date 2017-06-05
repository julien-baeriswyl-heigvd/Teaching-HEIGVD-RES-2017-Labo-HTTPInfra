$(
    function()
    {
        function loadPlaces ()
        {
            $.getJSON(
                "/api/places/",
                function (places)
                {
                    if (places.length > 0)
                    {
                        $(".header-content-inner>h1").text(places[0].country + " " + places[0].text);
                        $(".screen>img").attr('src',places[0].image);
                    }
                }
            )
        }
        
        setInterval(loadPlaces, 4000);
    }
);
