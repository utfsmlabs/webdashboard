$(document).keydown = (e) -> 
  keyCode = e.keyCode || e.which
  arrow = {left: 37, up: 38, right: 39, down: 40 }
  switch (keyCode)
    when arrow.left then alert("left")
    when arrow.up then alert("up")
    when arrow.right then alert("right")
    when arrow.down then  alert("down")