---
title: "Coding Node.js"
date: 2019-07-04T15:55:42+08:00
draft: false
images: []
---

## Async/await

    ``` Javascript
    async function f() {

      try {
        let response = await fetch('/no-user-here');
        let user = await response.json();
      } catch(err) {
        // catches errors both in fetch and response.json
        alert(err);
      }
    }

    f();

    // reference: https://javascript.info/async-await
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
    ```
