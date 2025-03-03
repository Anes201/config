#!/bin/bash          

num=0
for i in *.*
do
  num=$((num+1))
  mv "$i" "$num-$i"
done

