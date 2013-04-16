var page = require('webpage').create();
page.open('http://www.meilishuo.com/guang/report/', function (status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    }
    else {
        //scroll the page (not sure if this is the best way to do so...)
        //page.scrollPosition = { top: page.scrollPosition + 3000, left: 0 };

        var _innerFun = function() {
            var height = page.evaluate(function () {
                window.scrollTo(0, document.documentElement.offsetHeight);
                return document.documentElement.offsetHeight;
            });

            console.log(height);

            // Check if we've hit the bottom
            var hit_bottom = page.evaluate(function() {
                return document.querySelector(".paging_panel").className.indexOf("none_f") === -1;
            });

            //console.log(hit_bottom);

            if (hit_bottom)
            {
                var output="output.png";
                window.setTimeout(function() {
                    page.render(output);
                    console.log(page.content);
                    phantom.exit();
                }, 1000);
            }
            else
            {
                window.setTimeout(_innerFun, 1000);
            }
        };
      
        window.setTimeout(_innerFun, 1000);
    }
});
