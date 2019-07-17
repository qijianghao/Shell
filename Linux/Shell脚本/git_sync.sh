#!/bin/bash
remote_git=http://qijianghao:wanqjh789.@gitlab.hongru.com/qijianghao/xuhui-test.git
gitclonedir=/home/xuhui-test/xuhui
webdir=/home/xuhui-test/xuhui.com

git config --global credential.helper store
git clone $remote_git $gitclonedir
\cp -rf $gitclonedir/* $webdir/
rm $gitclonedir -rf
