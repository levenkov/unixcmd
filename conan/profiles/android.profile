[settings]
os=Android
os.api_level=21
arch=armv8
compiler=clang
compiler.version=11
compiler.libcxx=c++_shared
build_type=Release

[build_requires]
android-ndk/r22

[options]
openssl:shared=True
qt:shared=True
qt:opengl=no
qt:with_mysql=False
qt:with_sqlite3=False
qt:with_pq=False
qt:with_odbc=False
libpq:with_openssl=True
