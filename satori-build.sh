#!/bin/sh -x
curl -L http://cpanmin.us | perl - --curl --wget -L perl5 --save-dists dists Task::Kensho
mkdir cpan
cd cpan
find ../dists/ -type f | xargs -I % tar -xvzf %
for dir in `ls`; do  mv $dir `perl -E'$_ = shift; s/-\d.*$//; say;' $dir`; done
find ./ -name Makefile.PL | xargs -I % mv % %.cpan
rm -rf perl5/ dists/
cd ..
rsync -avz cpan/ ~/dev/perl/cpan/

