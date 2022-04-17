#!/bin/bash

##
# Creates a new tool
##

TOOL_NAME=$1
TOOL_DESC=$2 || '(no description)'

if [[ -z $TOOL_NAME ]]
then
  echo '❌ Usage: tool-mk <tool-name> [<tool-description>]'
  exit 1
fi

TOOL_DIR=$TOOLS_HOME/src/$TOOL_NAME
TOOL_SRC=$TOOL_DIR/$TOOL_NAME.sh

mkdir $TOOL_DIR

cat <<EOF > $TOOL_SRC
#!/bin/bash

##
# $TOOL_NAME: $TOOL_DESC
##

echo "Hello, I'm a new tool, $TOOL_NAME."
EOF

edit $TOOL_SRC

tool-link
$TOOL_NAME