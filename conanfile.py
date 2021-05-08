from conans import ConanFile, CMake, RunEnvironment, tools, __version__ as conan_version

assert conan_version >= tools.Version('1.35'), 'Conan version is too old.'


class UnixCmdConan(ConanFile):
    name = 'unixcmd'
    version = '0.0.0'
    generators = 'cmake', 'cmake_find_package', 'CMakeToolchain', 'qt'

    settings = "os", "arch", "compiler", "build_type"

    exports_sources = (
        'CMakeLists.txt',
        'main.cpp',
        'qml/main.qml',
        'qml.qrc'
    )

    requires = 'qt/5.15.2'

    def configure(self):
        #self.options['*'].shared = True
        self.options['qt'].qtdeclarative = True
        self.options['qt'].qtquickcontrols2 = True
    #    self.options['qt'].qttools = True
    #    self.options['qt'].qtsvg = True
    #    self.options['qt'].qttranslations = True
    #    self.options['qt'].with_freetype = False
        #self.options['qt'].with_mysql = False
        #self.options['qt'].qt3d = False
        #self.options['qt'].opengl = 'es2'

    def build(self):
        build_env = RunEnvironment(self)
        with tools.environment_append(build_env.vars):
            self.cmake.build()

    def package(self):
        self.cmake.install()

    @property
    def cmake(self):
        generator = 'Xcode' if self.settings.os == 'iOS' else 'Ninja'
        print(f"fooooooooooooo {generator} XXXXXXXXXXXXXXXXXXXXXX")
        cmake = CMake(self, generator=generator, set_cmake_flags=True)
        cmake.definitions['USE_CONAN'] = True
        cmake.configure()
        return cmake
