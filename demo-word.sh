make
if [ ! -e text8 ]; then
  wget http://mattmahoney.net/dc/text8.zip -O text8.gz
  gzip -d text8.gz -f
fi
time ./word2vec -train text8 -output vectors.bin -cbow 0 -size 200 -window 5 -negative 25 -hs 0 -sample 1e-3 -threads 1 -binary 1 -iter 1
./distance vectors.bin
