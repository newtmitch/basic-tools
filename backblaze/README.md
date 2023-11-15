# Backblaze custom settings

I've captured my custom changes to my backblaze exclusions list and settings here.

I referenced this article: https://gist.github.com/jb510/7f52f0f4c13020b56e30ac72eb733efb and noted that my bzfileids.dat file is 2.4GB in size. Nope. Going to add the new rules and reset my entire backup history, see how that goes.

Here are the additions I made to `/Library/Backblaze.bzpkg/bzdata/bzexcluderules_editable.xml`:

```xml
<!-- rsm: additions for node_modules and VCS systems. From here: 
https://gist.github.com/jb510/7f52f0f4c13020b56e30ac72eb733efb -->
<!-- Below here is for node_modules. -->
<excludefname_rule plat="mac" osVers="*"  ruleIsOptional="t" skipFirstCharThenStartsWith="users/" contains_1="/node_modules/" contains_2="*" doesNotContain="*" endsWith="*" hasFileExtension="*" />

<!-- Below here is for Version Control Systems (VCS) for things like: .git, .svn, .hg -->
<excludefname_rule plat="mac" osVers="*"  ruleIsOptional="t" skipFirstCharThenStartsWith="users/" contains_1="/Sites/" contains_2="/.git/" doesNotContain="*" endsWith="*" hasFileExtension="*" />
<excludefname_rule plat="mac" osVers="*"  ruleIsOptional="t" skipFirstCharThenStartsWith="users/" contains_1="/Sites/" contains_2="/.svn/" doesNotContain="*" endsWith="*" hasFileExtension="*" />
<excludefname_rule plat="mac" osVers="*"  ruleIsOptional="t" skipFirstCharThenStartsWith="users/" contains_1="/Sites/" contains_2="/.hg/" doesNotContain="*" endsWith="*" hasFileExtension="*" />
```

