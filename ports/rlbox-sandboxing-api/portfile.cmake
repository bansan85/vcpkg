vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bansan85/rlbox_sandboxing_api
    REF 4fcd78a3106387c20156a234c5065eda0e330393
    SHA512 eb87f35809829f4aaa15eaf34feeb83cfa2ccb6387198061144a3b8d19d3d0c37c377a0de50702c33393556908e43c1da37e41afd8023218a308189cc23eeb00
    HEAD_REF find_package
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(REMOVE_RECURSE
     "${CURRENT_PACKAGES_DIR}/debug"
)
