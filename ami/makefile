# -*- makefile -*-

all:

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
edit-files = $@.files
edit :
	find . -name '*.md' -type f -print > $(edit-files)
	emacs $$(cat $(edit-files))
	$(RM) $(edit-files)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
repo ?= $(error repo= is required)
repo-path := repo/$(repo)/README.md
repo : $(repo-path)

# -----------------------------------------------------------------------
# Intent: create repo/{repo}/README.md
# -----------------------------------------------------------------------
$(repo-path) : clean
	mkdir -p $(dir $@)
	rsync -rv --checksum repo/template/. $(dir $@)/.
	@sed -i'' -e 's/repo: template/repo: $(repo)/' $@
	@echo '| [$(repo)](repo/$(repo)/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |' >> README.md
	@emacs README.md

## -----------------------------------------------------------------------
## Intent: Create README.md storage beneath tests/
## -----------------------------------------------------------------------
name ?= $(error name= is required)
create-test :
	$(MAKE) "test/$(name)" name="$(name)"

rsync-args += --checksum
rsync-args += --exclude='*~'
test/$(name) :
	mkdir -p "$@"
	rsync -rv $(rsync-args) test/template/. "$@/."
	@sed -i'' -e 's/test: template/test: $(name)/' "$@/README.md"
	@echo '| [$(name)](test/$(name)/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |' >> "$@/README.md"

	-mdl "$@/README.md"
	emacs "$@/README.md"

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
clean :
	@find . -name 'README.html' -print0 | xargs -0 $(RM)
	@~/etc/cleanup

# [EOF]
