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

Material for each class (i.e. each module) is **written as RST files in `source/`**. Class materials that are actively edited are tracked in version control. Once a module is ready, the **corresponding entry in `source/index.rst` is updated**. This is for the new module to show up in the index and navbar. Next, static pages are rebuilt by **running `make clean`, `make html`, and `make git`**. First two are used to rebuild the static pages from source, last is to copy just the files required into `docs`/.

Given that github.io renders all pages in `docs/`, none of the generated pages are tracked in git by default. Thus, need to **add new class modules in `docs/` to version control** for them to appear on the website.  
