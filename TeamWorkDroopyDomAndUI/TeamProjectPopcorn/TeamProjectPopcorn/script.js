"use strict";
initializePopcorn();

function initializePopcorn() {
    var canvas = document.getElementById("firstCanvas"),
        ctx = canvas.getContext('2d'),
        coordX = 400,
        coordY = 455,
        radius = 15,
        width = 800,
        height = 500,
        updateX = 5,
        updateY = 5,
        step = 5,
        brickWidth = 50,
        brickHeight = 20,
        brickCols = 16,
        brickRows = 5,
        brickX = 0,
        brickY = 0,
        centralBrickStep = 15,
        centralBrickX = 350,
        centralBrickY = 470,
		centralBrickWidth = 100,
		centrarBrickHeight = 20,
        started = false,
		isCollision = false,
		life = 3;

    canvas.width = 800;
    canvas.height = 500;    

    addBricks();
    moveBall();
    moveCentralBrick();

    function moveCentralBrick() {
        document.addEventListener('keydown', function (e) {
            if (e.keyCode === 37) {
                if (centralBrickX - centralBrickStep >= 0) {
                    centralBrickX -= centralBrickStep;
                }
                addRectangle(centralBrickX, centralBrickY, centralBrickWidth, centrarBrickHeight, "purple");
            } else if (e.keyCode === 39) {
                if (centralBrickX + centralBrickStep <= width - centralBrickWidth) {
                    centralBrickX += centralBrickStep;
                }
                addRectangle(centralBrickX, centralBrickY, centralBrickWidth, centrarBrickHeight, "purple");
            }
        });
    }

    function gameOver() {
        alert("GAME OVER");
        ctx.measureText("GAME OVER"); // check this
        initializePopcorn();
    }

    function addRectangle(x, y, width, height, fillcolor) {
        ctx.beginPath();
        ctx.strokeStyle = "lightblue";
        ctx.fillStyle = fillcolor;
        ctx.lineWidth = '2';
        ctx.fillRect(x, y, width, height);
        ctx.fill();
        ctx.strokeRect(x, y, width, height);
    }

    function addBricksCols() {
        var colors = ['red', 'yellow', 'darkblue', '#1849ff', 'purple', '#3a7aff'],
            randomColor,
            i;

        for (i = 0; i < brickCols; i++) {
            randomColor = Math.floor((Math.random() * colors.length - 1) + 1);
            addRectangle(brickX, brickY, brickWidth, brickHeight, colors[randomColor]);
            brickX += brickWidth;
        }

        brickX = 0;
    }

    function addBricks() {
        for (var j = 0; j < brickRows; j++) {
            addBricksCols();
            brickY += brickHeight;
        }

        brickY = 0;
    }

    function detectCentralBrickCollision(coordX, coordY) {
        if (coordY === centralBrickY && (coordX >= centralBrickX && coordX <= (centralBrickX + centralBrickWidth))) {
            isCollision = true;
        }
        return isCollision;
    }

    function moveBall() {
        ctx.clearRect(0, (brickRows * brickHeight), width, height);
        draw();
        if (started) {
            if (coordY <= radius + (brickRows * brickHeight)) {
                updateY -= step;
            }

            if (coordX >= (width - radius)) {
                updateX -= step;
            }

            if (coordX <= radius) {
                updateX += step;
            }

            if (coordY >= (height + radius)) {
                if (life !== 0) {
                    //updateY += step;
                    life--;
                    render();
                } else {
                    //gameOver();
                }                
            }

            isCollision = detectCentralBrickCollision(coordX, coordY);
            if (isCollision) {
                updateY += step;
                isCollision = false;
            }

            coordX += updateX;
            coordY -= updateY;
        }

        document.addEventListener('keydown', function (e) {
            started = true;
        });

        requestAnimationFrame(moveBall);
    }

    function render() {
        draw();
        initializePopcorn();        
    }

    function draw() {
        ctx.fillStyle = 'orange';
        ctx.strokeStyle = 'lightblue';
        ctx.beginPath();
        ctx.arc(coordX, coordY, radius, 0, 2 * Math.PI);
        ctx.fill();
        ctx.stroke();
        // draw central brick        
        addRectangle(centralBrickX, centralBrickY, centralBrickWidth, centrarBrickHeight, 'purple');
    }
}