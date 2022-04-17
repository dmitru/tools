#!/bin/bash

##
# tool-rm: Removes a tool
##

TOOL_NAME=$1
TOOL_DIR=$TOOLS_HOME/src/$TOOL_NAME
rm -rf $TOOL_DIR

tool-link

