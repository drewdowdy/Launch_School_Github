/*
1. change x on mouse click
document.addEventListener('click', (event) => {
  let x = document.querySelector('.x');
  
  x.style.left = String(event.clientX) + 'px';
  x.style.top = String(event.clientY) + 'px';
})

2. cange x on mouse move
document.addEventListener('mousemove', (event) => {
  let x = document.querySelector('.x');
  
  x.style.left = String(event.clientX) + 'px';
  x.style.top = String(event.clientY) + 'px';
})

3. Update your solution to the previous problem to change the color of the red X to blue when the user presses the b key, green in response to the g key, and red in response to r. The X should continue to follow the mouse around.
document.addEventListener('mousemove', (event) => {
  let x = document.querySelector('.x');
  
  x.style.left = String(event.clientX) + 'px';
  x.style.top = String(event.clientY) + 'px';
})

document.addEventListener('keydown', (event) => {
  let color;
  
  if (event.key === 'r') {
    color = 'red';
  } else if (event.key === 'g') {
    color = 'green';
  } else if (event.key === 'b') {
    color = 'blue';
  }
  
  if (color) {
    let x = document.querySelector('.x');
    
    for (let i = 0; i < x.children.length; i++) {
      let child = x.children[i];
      child.style.background = color;
    }
  }
})
*/

