if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO PoseLib/PoseLib
    REF fa7280fee27f97aff31ae7f98bab7f583fac7d08
    SHA512 624c8789bf99113ef23b987736eabc9b7844afdb2fd4d39e0bae086bcb59375f29e011d1bec82c8aff53df5515f4e84d6ec79ec0714e0c04db45992db56050e8
    HEAD_REF master
    PATCHES
        fatal-errors.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DMARCH_NATIVE=OFF
        -DWITH_BENCHMARK=OFF
        -DPYTHON_PACKAGE=OFF
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/PoseLib)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
