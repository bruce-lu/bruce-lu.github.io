---
title: How I Built This Web Site within an hour
date: 2019-07-03
draft: false
---

## Objective

Build a web site like this within an hour.

## Local env.

- macOS Mojave
- Hugo v0.55.6 for Mac
- git version 2.20.1 (client)

## Prepare local env.

- Install Hugo
  
    brew install hugo

- Install git client

    brew install git

## On Github

- Log on Github
- Create a public repository named bruce-lu.github.io

    Where bruce-lu is my Github account name. I create a new repository bruce-lu.github.io on Github.

## On local env.

- Create workspace
  
    mkdir ~/ws && cd ~/ws

- Clone the new repository

    git clone https://github.com/bruce-lu/bruce-lu.github.io.git

- Create a Hugo site and get pulp theme

    cd bruce-lu.github.io

    mkdir site && cd site && git submodule add https://github.com/koirand/pulp.git themes/pulp

    cp -r themes/pulp/exampleSite/* ./

- Run the web site locally

    hugo server -D

- The first test

    http://localhost:1313

- Make changes in config.toml

    baseurl = "https://bruce-lu.github.io/"
    title = "Bruce Lu's pages"
    theme = "pulp"

- Add some content

    hugo new blog/first.md
    vim content/blog/first.md
    change draft: from true to false

- The second test

    http://localhost:1313/blog

## Publish to Github

- Generate static web pages

    hugo

    There would be a public folder generated.

- copy files in public folder to root folder
    cp -r public/* ../

    The folder structure looks like this:

    ``` Bash
    ├── 404.html
    ├── blog
    │   ├── emoji-support
    │   │   └── index.html
    │   ├── index.html
    │   ├── index.json
    │   ├── markdown-syntax
    │   │   └── index.html
    │   ├── math-typesetting
    │   │   └── index.html
    │   ├── placeholder-text
    │   │   └── index.html
    │   ├── rich-content.md.bk
    │   └── second
    │       └── index.html
    ├── bundle.min.87ff415004641d66f3d4fb9cbf76ce073ce8a10dd5b67afca5054b00be4ebc9a.js
    ├── css
    │   └── custom.css
    ├── img
    │   ├── avatar-border.svg
    │   ├── avatar.jpg
    │   ├── clear.png
    │   ├── favicon.ico
    │   └── search.png
    ├── index.html
    ├── index.xml
    ├── js
    │   └── custom.js
    ├── resources
    │   └── _gen
    │       ├── assets
    │       └── images
    ├── series
    │   ├── index.html
    │   └── index.xml
    ├── site
    │   ├── config.toml
    │   ├── content
    │   │   └── blog
    │   ├── public
    │   │   ├── 404.html
    │   │   ├── blog
    │   │   ├── bundle.min.87ff415004641d66f3d4fb9cbf76ce073ce8a10dd5b67afca5054b00be4ebc9a.js
    │   │   ├── css
    │   │   ├── img
    │   │   ├── index.html
    │   │   ├── index.xml
    │   │   ├── js
    │   │   ├── series
    │   │   ├── sitemap.xml
    │   │   ├── style.min.60c59e75c5046f0eded1491ec81bdadd4a68c3cb5d8aa97aeaa80d79260917d3.css
    │   │   └── style.min.a6cab246517742ad1189b209575fc61556550e663cdfe02a0aab0632b39e978b.css
    │   ├── resources
    │   │   └── _gen
    │   ├── series
    │   │   ├── index.html
    │   │   └── index.xml
    │   ├── static
    │   │   ├── css
    │   │   ├── img
    │   │   └── js
    │   └── themes
    │       └── pulp
    ├── sitemap.xml
    └── style.min.a6cab246517742ad1189b209575fc61556550e663cdfe02a0aab0632b39e978b.css
    ```


- Push code

    cd ~/ws/bruce-lu.github.io
    git add .
    git commit -m "Initial publish"
    git push

- Validate

    Wait for like 1 or 2 minutes, open https://bruce-lu.github.io/

## Feel free to add more blogs and enjoy

  ``` Bash
  ;-)
  ```

## Analysis

- Add Google Analysis support

  Edit bruce-lu.github.io/site/config.toml

  ``` Bash
  # Put your tracking id here and rebuild & publish the site.
  googleAnalytics = "MyGoogleAnalyticsTrackingID"

  # Visit Google Analytics console:	https://analytics.google.com/ for real time metrics
  ```

## Reference

- [Hugo quick-start guide](https://gohugo.io/getting-started/quick-start/)
- [Getting Started with GitHub Pages](https://guides.github.com/features/pages/)
- [pulp theme guide](https://github.com/koirand/pulp)
