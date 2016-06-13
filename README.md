
ben
===

[![Build Status](https://travis-ci.org/benjcunningham/ben.svg?branch=master)](https://travis-ci.org/benjcunningham/ben) [![Coverage](https://codecov.io/github/benjcunningham/ben/coverage.svg?branch=master)](https://codecov.io/github/benjcunningham/ben?branch=master)

Personal R package of [Ben Cunningham](http://www.linkedin.com/in/cunninghamben).

This repository is a compilation of functions that I find useful. It is inspired by [Hilary Parker's](http://hilaryparker.com/) article [Personal R Packages](http://hilaryparker.com/2013/04/03/personal-r-packages/). To get started creating your own packages, I recommend [her tutorial](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/).

Installation
------------

``` r
devtools::install_github("benjcunningham/ben")
```

Usage Tips
----------

### Pushbullet

The following options should be set in `.Rprofile` to customize the default behaviour of some functions.

-   `ben.alarms`: Directory of sound assets; for example `~/R/alarms/`

To take advantage of the Pushbullet notification wrappers, `RPushbullet` should be configured with `~/.rpushbullet.json` or equivalent global options.

### Jekyll

To serve Jekyll blog posts that contain JavaScript frames (e.g. Leaflet), follow the following workflow:

-   Write the post using R Markdown and save it in a non-served project directory like `_R`. Include only YAML front matter that pertains to rendering the document as HTML. For example, in the file `_R/test-post.Rmd`:

<!-- -->

    ---
    output:
      html_document:
        theme: null
        self_contained: true
    ---

    Hello world!

-   If using the default directories, make sure an `_includes/htmlwidgets` directory exists before proceeding. Render the post as HTML using:

``` r
ben::knit_htmlwidgets("./_R/test-post.Rmd")
```

-   Create a placeholder R Markdown file in your regular post directory (usually `_source`). Include regular YAML front matter and a Jekyll liquid include to the rendered HTML post. For example, in the file `_source/2016-01-01-test-post.Rmd`:

<!-- -->

    ---
    layout: post
    title: "Test Post"
    date: "January 1, 2016"
    ---

    {% include htmlwidgets/test-post.html %}

-   Build the site with `servr::jekyll()`.

For more information, see the post [Hacking Together htmlwidgets for Jekyll](http://benjcunningham.org/2016/06/13/hacking-together-htmlwidgets-for-jekyll.html).

License
-------

This package is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, version 3, as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose. See the GNU General Public License for more details.

A copy of the GNU General Public License, version 3, is available at <http://www.r-project.org/Licenses/GPL-3>.
