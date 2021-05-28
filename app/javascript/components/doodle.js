const initDoodle = () => {
  let canvas = document.getElementById("canvas");
  let restore = document.getElementById("restore-canvas");
  let clear = document.getElementById("clear-canvas");
  let colors = document.getElementById("colors-canvas");
  let width = document.getElementById("width-canvas");
  if (canvas) {
    canvas.width = window.innerWidth - 60;
    canvas.height = window.innerHeight * 0.72;
    let context = canvas.getContext("2d");
    context.fillStyle = "white";
    context.fillRect(0, 0, canvas.width, canvas.height);
    let restore_array = [];
    let start_index = -1;
    let stroke_color = 'black';
    let stroke_width = "2";
    let is_drawing = false;

    colors.addEventListener("change", () => {
      stroke_color = colors.value;
    });

    width.addEventListener("change", () => {
      stroke_width = width.value;
    });

    function change_color(element) {
      stroke_color = element.style.background;
    }

    function change_width(element) {
      stroke_width = element.innerHTML
    }

    function start(event) {
      is_drawing = true;
      context.beginPath();
      context.moveTo(getX(event), getY(event));
      event.preventDefault();
    }

    function draw(event) {
      if (is_drawing) {
        context.lineTo(getX(event), getY(event));
        context.strokeStyle = stroke_color;
        context.lineWidth = stroke_width;
        context.lineCap = "round";
        context.lineJoin = "round";
        context.stroke();
      }
      event.preventDefault();
    }

    function stop(event) {
      if (is_drawing) {
        context.stroke();
        context.closePath();
        is_drawing = false;
      }
      event.preventDefault();
      restore_array.push(context.getImageData(0, 0, canvas.width, canvas.height));
      start_index += 1;
    }

    function getX(event) {
      if (event.pageX == undefined) {return event.targetTouches[0].pageX - canvas.offsetLeft}
      else {return event.pageX - canvas.offsetLeft}
      }


    function getY(event) {
      if (event.pageY == undefined) {return event.targetTouches[0].pageY - canvas.offsetTop}
      else {return event.pageY - canvas.offsetTop}
    }

    canvas.addEventListener("touchstart", start, false);
    canvas.addEventListener("touchmove", draw, false);
    canvas.addEventListener("touchend", stop, false);
    canvas.addEventListener("mousedown", start, false);
    canvas.addEventListener("mousemove", draw, false);
    canvas.addEventListener("mouseup", stop, false);
    canvas.addEventListener("mouseout", stop, false);

    let save = document.getElementById('save-doodle');
    save.addEventListener("click", () => {
      downloadCanvas(save);
    })

    async function downloadCanvas(el) {
      const imageURI = canvas.toDataURL("image/jpg");
      el.href = imageURI;
    };

    restore.addEventListener("click", () => {
      if (start_index <= 0) {
        Clear();
      } else {
          start_index += -1;
          restore_array.pop();
          if ( event.type != 'mouseout' ) {
            context.putImageData(restore_array[start_index], 0, 0);
          }
        }
    });

    clear.addEventListener("click", () => {
      Clear();
    });

    function Clear() {
        context.fillStyle = "white";
        context.clearRect(0, 0, canvas.width, canvas.height);
        context.fillRect(0, 0, canvas.width, canvas.height);
        restore_array = [];
        start_index = -1;
    }
  }
};

export { initDoodle }
