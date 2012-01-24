#!/bin/sh -x
curl -L http://cpanmin.us | perl - --curl --wget -L perl5 --save-dists dists Task::Kensho
find dists/ -type f | xargs -I % tar -xvzf %
for dir in `ls`; do  mv $dir `perl -E'$_ = shift; s/-\d.*$//; say;' $dir`; done
find ./ -name Makefile.PL | xargs -I % mv % %.cpan
rm -rf perl5/ dists/
find . -type d -depth 1 | xargs -I % mv % ~/dev/perl/cpan/

