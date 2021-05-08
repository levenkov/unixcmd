include(default)

[settings]
os=iOS
os.version=12.0
arch=armv8
compiler=apple-clang
compiler.libcxx=libc++
compiler.version=12.0
build_type=Release

[options]
*:shared=False
qt:with_mysql=False
qt:with_libpng=False
qt:with_freetype=False
qt:with_sqlite3=False
qt:with_pq=False
qt:with_pcre2=False
qt:with_odbc=False
qt:with_doubleconversion=False
qt:with_zstd=False
qt:opengl=es2
ios-cmake:enable_bitcode=False
