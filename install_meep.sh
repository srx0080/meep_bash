#!/bin/bash

# 1. Build and install FFTW 
wget http://www.fftw.org/fftw-3.3.4.tar.gz
tar -xf fftw-3.3.4.tar.gz
cd fftw-3.3.4
CC=mpicc CXX=mpicxx F77=mpif77 ./configure --enable-mpi --enable-openmp
make -j4
sudo make install
cd ..

# 2. Libctl
wget http://ab-initio.mit.edu/libctl/libctl-3.2.2.tar.gz
tar -xf libctl-3.2.2.tar.gz
cd libctl-3.2.2
CC=mpicc CXX=mpicxx F77=mpif77 ./configure
make -j4
sudo make install
cd ..

# 3. MPB
# 3.1 without MPI support
wget http://ab-initio.mit.edu/mpb/mpb-1.5.tar.gz
tar -xf mpb-1.5.tar.gz
cd mpb-1.5/
CC=mpicc CXX=mpicxx F77=mpif77 ./configure
make -j4 
sudo make install
make distclean
# 3.2 with MPI support
CC=mpicc CXX=mpicxx F77=mpif77 ./configure --with-mpi --with-openmp
make -j4 
sudo make install
cd ..

# 4. Harminv
wget http://ab-initio.mit.edu/harminv/harminv-1.4.tar.gz
tar -xf harminv-1.4.tar.gz
cd harminv-1.4/
CC=mpicc CXX=mpicxx F77=mpif77 ./configure
make
sudo make install
cd ..

# 5. Meep
# 5.1 without MPI 
wget http://ab-initio.mit.edu/meep/meep-1.3.tar.gz
tar -xf meep-1.3.tar.gz
cd meep-1.3/
CC=mpicc CXX=mpicxx F77=mpif77 ./configure
make -j4
sudo make install
make distclean
# 5.2 with MPI
CC=mpicc CXX=mpicxx F77=mpif77 ./configure --with-mpi
make -j4
sudo make install

# 6. h5utils
wget http://ab-initio.mit.edu/h5utils/h5utils-1.12.1.tar.gz
tar -xf h5utils-1.12.1.tar.gz
cd h5utils-1.12.1
CC=mpicc CXX=mpicxx F77=mpif77 ./configure
make -j4 
sudo make install
cd ..
