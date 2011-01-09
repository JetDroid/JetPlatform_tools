#/bin/sh
#check if the source directory exists
if [ -d source ]; then
echo "Starting build ..."
cd source
. build/envsetup.sh 
lunch jet-eng
make -i -j4
#make -i -j4 PRODUCT-sec_GT-S8000-user otapackage dist
else
echo "source directory does not exist. Please use tools/get_source.sh to fetch the source."
fi

