#!/bin/bash

##
# Links all the tools to the $TOOLS_HOME/bin directory
##

rm $TOOLS_HOME/bin/*

for tool in $(ls $TOOLS_HOME/src)
do
  ln -s $TOOLS_HOME/src/$tool/$tool.sh $TOOLS_HOME/bin/$tool || echo '❌ '$tool
done
ln -s $TOOLS_HOME/tool-link.sh $TOOLS_HOME/bin/tool-link && echo '✅ tool-link' || echo '❌ tool-link'
chmod +x $TOOLS_HOME/bin/*