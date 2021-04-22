# Ubuntu 20.04

# Download PAPI library source code
cd /home
wget http://icl.utk.edu/projects/papi/downloads/papi-6.0.0.tar.gz

# Extract source code
tar -xvf papi-6.0.0.tar.gz
cd papi-6.0.0

# Build PAPI binaries
cd src
./configure --prefix=$PWD/install
make && make install

# Test binaries
cd install/bin
./papi_avail
sudo sh -c 'echo -1 >/proc/sys/kernel/perf_event_paranoid'
./papi_avail

# Execute a test example
cd ../../src/ctests
./serial_hl

# Add PAPI library environment variables
export PAPI_DIR=/home/papi-6.0.0/src/install
export PATH=${PAPI_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PAPI_DIR}/lib:$LD_LIBRARY_PATH

# Check if PAPI binaries are added to environment variables
papi_avail
papi_mem_info

# Write and build first PAPI code
cd /home
mkdir hello_papi
vim hello_papi.c
gcc hello_papi.c -I/${PAPI_DIR}/include -L/${PAPI_DIR}/lib -o hello_papi -lpapi
./hello_papi