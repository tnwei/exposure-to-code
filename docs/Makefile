# Minimal makefile for Sphinx documentation
#
# Need to do this to work w/ Github Pages
# cp -r build/html docs
# 
# Set thins up so running `make docs` is enough
# 
# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: Makefile
# 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY : html clean
clean : Makefile
	@$(SPHINXBUILD) -M $@  "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

html : Makefile clean
	@$(SPHINXBUILD) -M $@  "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Then this is for prepping for git upload
.PHONY : docs
docs : html
	rm -rf docs
	cp -r build/html docs
	touch docs/.nojekyll
