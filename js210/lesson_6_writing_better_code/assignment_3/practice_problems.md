# Practice Problems

## Identify the code that violates the Airbnb JavaScript style guide, and update the code to fix the issues you identify. There may be more than one issue in each code snippet.

### 1.

```javascript
let title = "The Three-Body Problem";
```

#### Answer

Strings should be wrapped in single quotes '' unless they already contain single quotes within them.

### 2.

```javascript
let title = 'The Three-Body Problem',
    author = 'Cixin Liu',
    page_count = 400;
```

#### Answer

Each variable declaration should have its own let to make the intention clearer.

Also, variables should use camelCase so page_count should be pageCount.

### 3.

```javascript
let completed = lastPageRead == 400;
```

#### Answer

For equality check, we should use strict equality with a triple equal signs ===.

### 4.

```javascript
if (finishedBook())
  console.log('You have finished reading this book');
```

#### Answer

Multi-line blocks should be wrapped in curly braces {} but single line blocks don't have to be.

### 5.

```javascript
function read(pages) {
      console.log('You started reading.');
      for (let page=0; page<pages; page++) {
              let message = 'You read page '+page;
              console.log(message);
      }
}

read(400);
```

#### Answer

- For assignment and comparison, each sign (= or <) should have spaces before and after them.
- Indentations should be 2 spaces
- Avoid ++ or -- in favor of += and -=
- Show intention with type coersion page should be String(page)
- Use more distinct / descriptive variable names. page and pages are too similar. page could be currentPage.
- 