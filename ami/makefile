# -*- makefile -*-

all:

edit-files = $@.files
edit :
	find . -name '*.md' -type f -print > $(edit-files)
	emacs $$(cat $(edit-files))
	$(RM) $(edit-files)

clean :
	$(RM) README.html

# [EOF]
