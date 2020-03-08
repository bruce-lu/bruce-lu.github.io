---
title: "Promise, async and await"
date: 2019-07-04T15:55:42+08:00
draft: false
images: []
---

## Promise, async and await

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

## A full html for demo and testing

  ``` HTML

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demo of async await promise</title>
  </head>

  <body>
    Demo of async await promise

    <script lang="javascript">

      /*
        ## Promise
          The Promise object represents the eventual completion (or failure) of an asynchronous operation, and 
          its resulting value.
          A Promise is a proxy for a value not necessarily known when the promise is created. It allows you 
          to associate handlers with an asynchronous action's eventual success value or failure reason. This 
          lets asynchronous methods return values like synchronous methods: instead of immediately returning 
          the final value, the asynchronous method returns a promise to supply the value at some point in the future.

          A Promise is in one of these states:
          pending: initial state, neither fulfilled nor rejected.
          fulfilled: meaning that the operation completed successfully.
          rejected: meaning that the operation failed.

          A pending promise can either be fulfilled with a value, or rejected with a reason (error). 
          When either of these options happens, the associated handlers queued up by a promise's then method 
          are called. (If the promise has already been fulfilled or rejected when a corresponding handler is 
          attached, the handler will be called, so there is no race condition between an asynchronous operation 
          completing and its handlers being attached.)

          It has then, catch and finally methods.

          My understanding: Promise resolved the problem of callback hell. It allows you to associate/attach 
          handlers instead of treat them as function parameters. 
            loadScript(src, callback1, callback2, callback3);
            loadSomething(src).then(callback1)
                              .then(callback2)
                              .then(callback3);

        ## async, await (a -> asynchronous)
          async keyword, which you put in front of a function declaration to turn it into an async function. 
          An async function is a function which knows how to expect the possibility of the await keyword being 
          used to invoke asynchronous code.

          The real advantage of async functions becomes apparent when you combine it with the await keyword. 
          This can be put in front of any async promise-based function to pause your code on that line until 
          the promise fulfills, then return the resulting value. In the meantime, other code that may be 
          waiting for a chance to execute gets to do so.

          You can use await when calling any function that returns a Promise, including web API functions.

          async myFetch(url){
            let res = await fetch(url);
          }

          The return value of async function is a Promise, you can call then on it.

          My understanding: async & await make writing async code like sync code, easier to read & maintain.

        ## Ref
        [Async_await](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Async_await)
        [js info](https://javascript.info/async)
      */

      // async await demo
      async function fun() {
        let res = null;
        // await can be put in front of any async promise-based function to pause your code on that 
        // line until the promise fulfills, then return the resulting value. 
        res = await new Promise((resolve, reject)=>{
          //setTimeout(() =>{console.log('in promise');}, 1000);
          // To simulate a delay
          setTimeout(() =>{resolve('Resolved'); console.log('in promise');}, 1000);
        
        });
        console.log('res: ' + res);
        return res;
      }
      
      // promise demo
      let myPromise = new Promise((resolve, reject)=>{
        // use setTimeout to simulate some async time consuming work
        setTimeout(() => resolve("Done myPromise!"),3000);
      });

      console.log("start..");
      myPromise.then(data => {console.log(data)});
      console.log(fun());
      console.log("end.");

      /* Output may look like:

        start..
        Promise {<pending>}
        end.
        in promise
        res: Resolved
        Done myPromise!

      */
      
    </script>
  </body>

  </html>

  ```