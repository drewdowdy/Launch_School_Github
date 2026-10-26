`index.html`:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practice</title>
    <link rel="stylesheet" href="./index.css">
    <script src="./solution.js"></script>
  </head>
  <body>
    <div class="composer">
      <textarea placeholder="Enter your message"></textarea>
      <p class="counter"></p>
      <button type="submit">Post Message</button>
    </div>
  </body>
</html>
```

`index.css`:

```css
.composer {
  background: #f5f5f5;
  padding:  1em;
  width:  30em;
}

.composer textarea {
  width: 100%;
  height: 4em;
}

.composer textarea.invalid {
  color: red;
}
```

`solution.js`:

```javascript
let counter = document.querySelector('.counter');
console.log(counter);
```