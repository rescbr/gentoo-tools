#!/bin/sh

# a couple notes on the pipes:
# grep -i '^.* .*$' # print only lines containing use flags
# sed 's/^/>=/g'  # prefixes line with >=
# sed 's/$/xxx/g' # suffixes line with xxx

TOOLDIR=`dirname $0`

echo '# autogenerated package.use'
echo '#' `cat $0 | tail -n 1`
$TOOLDIR/list-gentoo-packages.sh | sed 's/+//g' | sed 's/ abi_x86_64//g' | sed 's/ abi_x86_32//g' | grep -i '^.* .*$' | sed 's/^/>=/g'
