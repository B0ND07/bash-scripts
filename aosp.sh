# Mount Directory
cd /rom/aosp

# Sync Repo
repo init -u github.com//android.git -b 10
repo sync --force-sync --no-tags --no-clone-bundle

# Clone Trees
git clone https://github.com//.git -b 10 device/realme/RMX1971
git clone https://github.com//.git -b 10 kernel/realme/RMX1971
git clone https://github.com/ -b 10 vendor/realme/RMX1971

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
lunch aosp_RMX1971-userdebug
make aosp -j$( nproc --all )
