#set -x

source ../../../configure_paths.sh

export INCLUDES="-I${MKL_PREFIX}/include/"
export LIBRARIES="${MKL_FLAGS} -lisl -lz -lpthread -ldl "
export LIBRARIES_DIR="-L${MKL_PREFIX}/lib/${MKL_LIB_PATH_SUFFIX}"

source ${MKL_PREFIX}/bin/mklvars.sh ${MKL_LIB_PATH_SUFFIX}

gcc -DMKL_ILP64 -m64 ${INCLUDES} conv_relu_maxpool_generator_mkl.c -o conv_relu_maxpool_mkl ${LIBRARIES_DIR} -Wl,--no-as-needed -lmkl_intel_ilp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl
./conv_relu_maxpool_mkl