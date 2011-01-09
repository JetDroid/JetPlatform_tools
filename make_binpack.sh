#/bin/bash
#check if we are in the right working directory
if [ -f make_buildpack.sh ]; then 
cd ..
fi 

# copy overlay files and install fixes
cp tools/overlay/* source/out/target/product/GT-S8000/root
#cp -R tools/overlay/system/* source/out/target/product/GT-S8000/system
#cp -R tools/overlay/data/* source/out/target/product/GT-S8000/data
sh tools/keypad_fix.sh

# create the archive
binaryfile="JetPlatform-binary-$(date +%Y%m%d.%s).tar"
cd source/out/target/product/GT-S8000/root
tar cvf ../../../../../../../$binaryfile *
cd ..
tar rvf ../../../../../../$binaryfile system
tar rvf ../../../../../../$binaryfile data
cd ../../../../../../
gzip -9 $binaryfile

