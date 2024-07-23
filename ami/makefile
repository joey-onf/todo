# -*- makefile -*-

all:

edit-files = $@.files
edit :
	find . -name '*.md' -type f -print > $(edit-files)
	emacs $$(cat $(edit-files))
	$(RM) $(edit-files)

clean :
	@find . -name 'README.html' -print0 | xargs -0 $(RM)

# [EOF]
