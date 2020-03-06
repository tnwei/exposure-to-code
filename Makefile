# Minimal makefile for Sphinx documentation
#
# Need to do this to work w/ Github Pages
# cp -r build/html docs
# 
# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: Makefile
# 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Since I only make html and clean, might as well
.PHONY : html clean
html : Makefile
	@$(SPHINXBUILD) -M $@  "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean : Makefile
	@$(SPHINXBUILD) -M $@  "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Then this is for prepping for git upload
.PHONY : git
git : html
	rm -rf docs
	cp -r build/html docs
	touch docs/.nojekyll
