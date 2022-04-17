#!/bin/bash

rm $TOOLS_HOME/bin/*

for tool in $(ls $TOOLS_HOME/src)
do
  ln -s $TOOLS_HOME/src/$tool/$tool.sh $TOOLS_HOME/bin && echo '✅ '$tool || echo '❌ '$tool
done
ln -s $TOOLS_HOME/link-tools.sh $TOOLS_HOME/bin && echo '✅ link-tools' || echo '❌ link-tools'
chmod +x $TOOLS_HOME/bin/*