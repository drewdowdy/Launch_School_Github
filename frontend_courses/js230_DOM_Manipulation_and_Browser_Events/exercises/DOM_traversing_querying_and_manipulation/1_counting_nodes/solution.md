## Diagram Key

| Color | Meaning |
|-|-|
| <span style="color:#00FFFF">aqua</span> | element nodes |
| <span style="color:#FFA500">orange</span> |  text nodes with content |
| <span style="color:#FFFFF">white</span> | text nodes with whitespaces |

## HTML Snippet 1

```html
<body>
  <div>
    <p>Then press the <em>Draw</em> button</p> 
  </div>
</body>
```

```mermaid
---
  title: Snippet 1
---
flowchart TD
  classDef element fill:#00FFFF
  classDef text fill:#FFA500
  classDef emptyText fill:#FFFFFF

  1(HTML):::element --> 2(HEAD):::element
  1(HTML):::element --> 3(BODY):::element

  3(BODY):::element --> 4(DIV):::element

  4(DIV):::element --> 5(#text):::emptyText
  4(DIV):::element --> 6(P):::element
  4(DIV):::element --> 7(#text):::emptyText

  6(P):::element --> 8(#text: Then press the ):::text
  6(P):::element --> 9(EM):::element
  6(P):::element --> 10(#text: button):::text

  9(EM):::element --> 11(#text: Draw):::text
```

## HTML Snippet 2

```html
<body>
  <div><p>Then press the <em>Draw</em> button.</p></div>
</body>
```

```mermaid
---
  title: Snippet 2
---
flowchart TD
  classDef element fill:#00FFFF
  classDef text fill:#FFA500
  classDef emptyText fill:#FFFFFF

  1(HTML):::element --> 2(HEAD):::element
  1(HTML):::element --> 3(BODY):::element

  3(BODY):::element --> 4(DIV):::element

  4(DIV):::element --> 5(P):::element

  5(P):::element --> 6(#text: Then press the ):::text
  5(P):::element --> 7(EM):::element
  5(P):::element --> 8(#text: button):::text

  7(EM):::element --> 9(#text: Draw):::text
```