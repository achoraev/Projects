var memoryArray = [
   '#FF3557', '#FF3557', '#388AFF', '#388AFF', '#606060', '#606060', '#4CFF00', '#4CFF00', '#FAFF02', '#FAFF02', '#FF54E8', '#FF54E8', '#FF7B00', '#FF7B00',
   '#8605FF', '#8605FF', '#007F0E', '#007F0E', '#2014FF', '#2014FF', '#7F3300', '#7F3300', '#252525', '#252525'];

//var memoryArray = [
//   'red', 'red', 'blue', 'blue', 'gray', 'gray', 'green', 'green', 'yellow', 'yellow', 'purple', 'purple', 'orange', 'orange',
//   'pink', 'pink', 'greenyellow', 'greenyellow', 'darkblue', 'darkblue', 'brown', 'brown', '#252525', '#252525'];

var redrawn = [],
    arr = [],
    posArr = [];

var logo = new Image();
logo.src = "images/teleriklogo.png";
var xOffset = 0,
    xIncr = 0;

Array.prototype.createMemoryBoard = function () {
    var i = this.length, j, temp;
    while (--i > 0) {
        j = Math.floor(Math.random() * (i + 1));
        temp = this[j];
        this[j] = this[i];
        this[i] = temp;
    }
};

function reDraw(id) {
    clickCount++;
    if (clickCount > 2 && redrawn.length === 2) {
        if (redrawn[0] !== redrawn[1]) {
            if (arr[redrawn[0]].attr("fill") === arr[redrawn[1]].attr("fill")) {
                arr[redrawn[0]].click({
                });
                arr[redrawn[1]].click({
                });
                //doTimer("scale_decr()");
                redrawn = [];
                clickCount = 1;
            } else {
                for (var i = 0; i < redrawn.length; i++) {
                    backToOriginal(redrawn[i]);
                    //doTimer("scaleDecr()");
                }
                redrawn = [];
                clickCount = 1;
            }
        } else {
            for (var j = 0; j < redrawn.length; j++) {
                backToOriginal(redrawn[j]);
            }
            redrawn = [];
            clickCount = 1;
        }
    }
    redrawn.push(id);

    arr[id].attr({
        fill: memoryArray[id]
    });
}

function backToOriginal(id) {
    arr[id].attr({
        fill: "url('images/teleriklogo.png')"
    });
}

function initialize() {
    var counterX,
       rows = 4,
       cols = 6,
       logoWidth = 110,
       logoHeight = 105,
       i,
       j;

    for (i = 0; i < rows; i++) {
        counterX = 120;
        for (j = 0; j < cols; j++) {
            arr.push(paper.rect(-90 + counterX, -90 + conterY, logoWidth, logoHeight)
                 .attr({
                     fill: "url('images/teleriklogo.png')",
                     stroke: "gray",
                     "stroke-width": 2,
                     //"stroke-linejoin": 'round',
                 })
                 .click(function () {
                     reDraw(this.id);
                 })
            );
            context.drawImage(logo, -90 + 142 + counterX, -90 + 30 + conterY);
            counterX += 110;
        }
        conterY += 105;
    }
}

//function scaleDecr() {
//    context.clearRect(0, 0, logo.width, logo.height);
//    context.drawImage(logo, 10, 10, logo.width - xOffset, 100);
//    xOffset = xOffset + 10;
//    if (xOffset >= logo.width) {
//        stopTimer();
//    }
//}

//function scaleIncr() {
//    context.clearRect(-10, -10, logo.width, logo.height);
//    context.drawImage(logo, 10, 10, xOffset + xIncr, 100);
//    xIncr = xIncr + 10;
//    if (xIncr >= logo.width) {
//        stopTimer();
//    }
//}

//function doTimer(funct) {   
//    var x_pos = this;
//    var timerID = setInterval(funct, 50);
//}

//function stopTimer() {
//    clearInterval(timerID);
//}