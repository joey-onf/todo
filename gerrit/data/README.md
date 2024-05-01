Gerrit Patch Data
=================

Add gerrit patches and jira tickets in bulk
-------------------------------------------

- Add new patches in gerrit/data/gerrit.urls
- Add new jira tickets in gerrit/data/jira.urls

Generate
--------

% bin/assemble.sh
The init function will create two types of directories from *.url

- Gerrit patches (numeric)

    - gerrit/data/{id}
    
- Jira tickets (VOL-*)

    - gerrit/data/VOL-5333


Per-patch data
--------------

- Add a list of jira tickets attached to the patch in gerrit/data/{gerrit-id}/jira.
- A list of X urls will render beneath the 'Jira' column.
- Create gerrit/data/{gerrit-id}/notes to track random comments.

Track jira tickets across patches (grid column)
-----------------------------------------------

- Create gerrit/data/VOL-*/common for each jira ticket to track.
- Each gerrit patch with a common jira task added in the file jira will render an 'X beneath the VOL-* column.
