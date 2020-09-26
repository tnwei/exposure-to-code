# Notes

tl; dr: just read text in **bold**

## Repo structure

├── build -----> Stores the website static pages, not tracked in version control. Default `sphinx-build` location
├── docs  -----> Copy of build/html, that is tracked in version control and displayed on the website
├── Makefile --> Makefile for `sphinx-build`
├── NOTES.md --> This document
├── README.md -> Repo README
├── **source ----> Working RST files for the course**
└── syllabus --> Contains class syllabus in both Markdown and PDF format

## Creating content

Material for each class (i.e. each module) is **written as RST files in `source/`**. Class materials that are actively edited are tracked in version control. Once a module is ready, the **corresponding entry in `source/index.rst` is updated**. This is for the new module to show up in the index and navbar. Next, static pages are rebuilt by **running `make docs`**. This cleans the build directory, rebuilds the static pages from source, then copies just the `build/html` folder as `docs/`.

Given that github.io renders all pages in `docs/`, none of the generated pages are tracked in git by default. Thus, need to **add new class modules in `docs/` to version control** for them to appear on the website.  

## Requirements

Sphinx 3.2.1
