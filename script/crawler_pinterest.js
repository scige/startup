var page = require('webpage').create();
page.open('http://www.meilishuo.com/guang/report/', function (status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    }
    else {
        //scroll the page (not sure if this is the best way to do so...)
        //page.scrollPosition = { top: page.scrollPosition + 3000, left: 0 };

        var _innerFun = function() {
            //滚动到当前网页底部
            var height = page.evaluate(function () {
                window.scrollTo(0, document.documentElement.offsetHeight);
                return document.documentElement.offsetHeight;
            });

            console.log(height);

            //等待滚动后的网页内容渲染完成以后
            window.setTimeout(function() {
                // Check if we've hit the bottom
                var hit_bottom = page.evaluate(function() {
                    return document.querySelector(".paging_panel").className.indexOf("none_f") === -1;
                });

                //console.log(hit_bottom);

                if (hit_bottom)
                {
                    var output="output.png";
                    page.render(output);
                    console.log(page.content);
                    phantom.exit();
                }
                else
                {
                    //没有到达网页底部，再次执行本函数
                    _innerFun();
                }
            }, 1000);
        };
      
        //第一次滚动要等待网页渲染完成以后
        window.setTimeout(_innerFun, 1000);
    }
});
