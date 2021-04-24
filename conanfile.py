from conans import ConanFile, CMake, __version__ as conan_version
from conans.tools import Version

assert conan_version >= Version('1.35'), 'Conan version is too old.'


class UnixCmdConan(ConanFile):
    name = 'unixcmd'
    version = '0.0.0'
    generators = 'cmake', 'cmake_find_package'

    exports_sources = (
        'CMakeLists.txt',
        'main.cpp',
        'qml/main.qml',
        'qml.qrc'
    )

    requires = 'qt/6.0.1'

    #def configure(self):
        #self.options['qt'].shared = True
        #self.options['qt'].qtdeclarative = True
        #self.options['qt'].qtquickcontrols2 = True
        #self.options['qt'].qttools = True
        #self.options['qt'].qtsvg = True
        #self.options['qt'].qttranslations = True

    def build(self):
        self.cmake.build()

    def package(self):
        self.cmake.install()

    @property
    def cmake(self):
        cmake = CMake(self, generator='Ninja')
        print(cmake.command_line)
        cmake.configure()
        return cmake
