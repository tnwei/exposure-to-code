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

+ To run code in the course contents, refer to `environment.yml`. 
+ To build docs: `conda install sphinx=3.2.1`, and use the Makefile in this repo.
+ To lint RestructuredText: `conda install restructuredtext_lint`, and use the `rst-lint` CLI utility.

## RST syntax quirks
+ Use "::" right after another line, then open a newline and indent one tab to insert a code chunk. The code chunk must be preceded by a blank line, then followed by a blank line. 
+ Stick to using 4 spaces as tab instead of the tab character. 
+ Comments are prefaced w/ ".." but not sure how the behaviour works!
    + This is commented out correctly: .. [ ] Show how above's repeated comparisons can be reduced by using elif
    + But this is not: .. [X] Format of if-else (indent after colon, un-indent to signify end) - add some examples
    + But removing the trailing space after the bracket does: .. [X]Format of if-else (indent after colon, un-indent to signify end) - add some examples

## Repo branches

Each week is developed in its own branch, e.g. `week6` branch for Week 6 content. A new branch for each week needs to be created from existing branches or from an existing remote branch, as so:

```
# Create branch from master
git checkout -b week6 master

# Create branch from remote
git checkout -b week6 origin/test
```

When the content is ready to be shown on Github Pages, each branch is merged to master:
```
git checkout master
git merge week6
```

Typically a few more changes will need to be pushed to master for final touches before / during / after class. After that, merge the changes from master back to the respective branches, then tag the branches as archives and have them deleted. 
```
# Merge changes to week6
git checkout week6
git merge master

# Can't delete week6 while it is checked out
git checkout master

# Tag as "archive/week6", and push
git tag archive/week6 week6
git push origin archive/week6

# Push the tag to github
git push origin archive/week9

# Delete locally and also on origin
git branch -d week6
git push -d origin week6
```