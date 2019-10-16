---
title: "Wordpress performance tuning"
date: 2019-08-26T23:38:09+08:00
draft: false
images: []
---

## Disable unused features in theme

I'm using BitPal them so here is what I did:

Appearance -> Customize -> BitPal Performance -> Disable unused features in Icon Packs, Custom Post Types, Shortcodes sections

## Remove/Deactivate unused pages & plugins

- Deactivate used plugins

## Install WP Rocket (license required)

This will give us options to 
- File optimization: Minify & combine css, js files
- Media: Lazy loading
- Enable OPcache
- CDN



## Tools
- [Google page speed](https://developers.google.com/speed/pagespeed/insights/)
- https://gtmetrix.com/
- [Imagify plugin]
- [WP Rocket caching]

## Reference

- [7 Best WordPress Caching Plugins for 2019](https://kinsta.com/blog/wordpress-caching-plugins/)
- [LiteSpeed Cache vs. WP Rocket](https://blog.litespeedtech.com/2019/05/20/litespeed-cache-vs-wp-rocket/)
- [Memcached: What Is It and How to Use It on Your WordPress Site?](https://wp-rocket.me/blog/memcached-what-is-it-how-to-use-it/)
- [Site Cache vs Browser Cache vs Server Cache: What’s the Difference?](https://wp-rocket.me/blog/different-types-of-caching/)
- [WordPress 性能优化：为什么我的博客比你的快](https://blog.wpjam.com/article/wordpress-performance/)
- [优化WordPress性能的高级指南](https://cloud.tencent.com/developer/article/1344258)
- [深入浅出讲述提升 WordPress 性能的九大秘笈](https://blog.csdn.net/wmq880204/article/details/70649749)
- [浅谈我是如何做的 WordPress 站点性能优化](https://zhangzifan.com/wordpress-website-performance-optimization.html)