# Generated on 2019-4-16 1:55:51 by version CURRENT_PROJECT_VERSION of mulle-xcode-to-cmake
# Command line:
#    mulle-xcode-to-cmake export Blank Mack-Oss Screensaver.xcodeproj/
#
# NOTE: AppKit and Screensaver Frameworks had to be manually added to the build dependencies.
# I do not know why this is but mulle-xcode-to-cmake did not seem to detect them.
cmake_minimum_required (VERSION 3.0)

project("Blank Mack-Oss Screensaver" VERSION 1.0.0)


#
# mulle-bootstrap environment
#

# check if compiling with mulle-bootstrap (works since 2.6)

if( NOT MULLE_BOOTSTRAP_VERSION)
  include_directories( BEFORE SYSTEM
dependencies/include
addictions/include
)

  set( CMAKE_FRAMEWORK_PATH
dependencies/Frameworks
addictions/Frameworks
${CMAKE_FRAMEWORK_PATH}
)

  set( CMAKE_LIBRARY_PATH
dependencies/lib
addictions/lib
${CMAKE_LIBRARY_PATH}
)

set( DEPENDENCIES_DIR dependencies)
set( ADDICTIONS_DIR addictions)

endif()


#
# Platform specific definitions
#

if( APPLE)
   # # CMAKE_OSX_SYSROOT must be set for CMAKE_OSX_DEPLOYMENT_TARGET (cmake bug)
   # if( NOT CMAKE_OSX_SYSROOT)
   #    set( CMAKE_OSX_SYSROOT "/" CACHE STRING "SDK for OSX" FORCE)   # means current OS X
   # endif()
   #
   # # baseline set to 10.6 for rpath
   # if( NOT CMAKE_OSX_DEPLOYMENT_TARGET)
   #   set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
   # endif()

   set( CMAKE_POSITION_INDEPENDENT_CODE FALSE)

   set( BEGIN_ALL_LOAD "-all_load")
   set( END_ALL_LOAD)
else()
   set( CMAKE_POSITION_INDEPENDENT_CODE TRUE)

   if( WIN32)
   # windows
   else()
   # linux / gcc
      set( BEGIN_ALL_LOAD "-Wl,--whole-archive")
      set( END_ALL_LOAD "-Wl,--no-whole-archive")
   endif()
endif()


##
## Blank Mack-Oss Screensaver Files
##

# uncomment this for mulle-objc to search libraries first
# set( CMAKE_FIND_FRAMEWORK "LAST")

set( PUBLIC_HEADERS
)

set( PROJECT_HEADERS
"Blank Mack-Oss Screensaver/Blank_Mack_Oss_ScreensaverView.h"
)

set( PRIVATE_HEADERS
)

set( SOURCES
"Blank Mack-Oss Screensaver/Blank_Mack_Oss_ScreensaverView.m"
)

set( STATIC_DEPENDENCIES
)

find_library( FOUNDATION_LIBRARY Foundation)
message( STATUS "FOUNDATION_LIBRARY is ${FOUNDATION_LIBRARY}")
# NOTE: AppKit is only required if using NSColor, NSRectFill(), etc...
find_library( APPKIT_LIBRARY AppKit)
message( STATUS "APPKIT_LIBRARY is ${APPKIT_LIBRARY}")
find_library( SCREENSAVER_LIBRARY Screensaver)
message( STATUS "SCREENSAVER_LIBRARY is ${SCREENSAVER_LIBRARY}")

set( DEPENDENCIES
${FOUNDATION_LIBRARY}
${APPKIT_LIBRARY}
${SCREENSAVER_LIBRARY}
)

set( RESOURCES
)


##
## Blank Mack-Oss Screensaver
##

add_library( Blank-Mack-Oss-Screensaver MODULE
${SOURCES}
${PUBLIC_HEADERS}
${PROJECT_HEADERS}
${PRIVATE_HEADERS}
${RESOURCES}
)

target_include_directories( Blank-Mack-Oss-Screensaver
   PUBLIC
      "Blank Mack-Oss Screensaver"
)

target_link_libraries( Blank-Mack-Oss-Screensaver
${BEGIN_ALL_LOAD}
${STATIC_DEPENDENCIES}
${END_ALL_LOAD}
${DEPENDENCIES}
)

set_source_files_properties(
${RESOURCES}
   PROPERTIES
      MACOSX_PACKAGE_LOCATION
      Resources
)

if (APPLE)
   set_target_properties( Blank-Mack-Oss-Screensaver PROPERTIES
BUNDLE TRUE
MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Blank-Mack-Oss-Screensaver-Info.plist.in"
)
endif()

if (APPLE)
   set_target_properties( Blank-Mack-Oss-Screensaver PROPERTIES
MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Blank-Mack-Oss-Screensaver-Info.plist.in"
)
endif()
