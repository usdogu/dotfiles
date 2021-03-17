#!/usr/bin/env bash
#	default color: 178984
oldglyph=#543216
newglyph=#492c1d

#	Front
#	default color: 36d7b7
oldfront=#9e5e2b
newfront=#8b5438

#	Back
#	default color: 1ba39c
oldback=#6c401d
newback=#5f3926

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
