
include(SelectLibraryConfigurations)
include(FindPackageHandleStandardArgs)

find_path(Brotli_INCLUDE_DIR brotli/decode.h)

if (NOT Brotli_LIBRARIES)
	
	find_library(Brotli_Common_LIBRARY_RELEASE NAMES brotlicommon brotlicommon-static PATHS ${CMAKE_PREFIX_PATH}/lib NO_DEFAULT_PATH)
	find_library(Brotli_Common_LIBRARY_DEBUG NAMES brotlicommon brotlicommon-static PATHS ${CMAKE_PREFIX_PATH}/debug/lib NO_DEFAULT_PATH)
    
	find_library(Brotli_Dec_LIBRARY_RELEASE NAMES brotlidec brotlidec-static PATHS ${CMAKE_PREFIX_PATH}/lib NO_DEFAULT_PATH)
	find_library(Brotli_Dec_LIBRARY_DEBUG NAMES brotlidec brotlidec-static PATHS ${CMAKE_PREFIX_PATH}/debug/lib NO_DEFAULT_PATH)
    
	find_library(Brotli_Enc_LIBRARY_RELEASE NAMES brotlienc brotlienc-static PATHS ${CMAKE_PREFIX_PATH}/lib NO_DEFAULT_PATH)
	find_library(Brotli_Enc_LIBRARY_DEBUG NAMES brotlienc brotlienc-static PATHS ${CMAKE_PREFIX_PATH}/debug/lib NO_DEFAULT_PATH)
    
	SELECT_LIBRARY_CONFIGURATIONS(Brotli_Common)
	SELECT_LIBRARY_CONFIGURATIONS(Brotli_Dec)
	SELECT_LIBRARY_CONFIGURATIONS(Brotli_Enc)
	
endif()

mark_as_advanced(Brotli_Common_FOUND Brotli_INCLUDE_DIR Brotli_Common_LIBRARY_RELEASE Brotli_Common_LIBRARY_DEBUG)
mark_as_advanced(Brotli_Dec_FOUND Brotli_INCLUDE_DIR Brotli_Dec_LIBRARY_RELEASE Brotli_Dec_LIBRARY_DEBUG)
mark_as_advanced(Brotli_Enc_FOUND Brotli_INCLUDE_DIR Brotli_Enc_LIBRARY_RELEASE Brotli_Enc_LIBRARY_DEBUG)

find_package_handle_standard_args(Brotli REQUIRED_VARS Brotli_INCLUDE_DIR Brotli_Common_LIBRARIES Brotli_Dec_LIBRARIES Brotli_Enc_LIBRARIES)
	
if(Brotli_Common_FOUND AND Brotli_Dec_FOUND AND Brotli_Enc_FOUND)
	set(Brotli_INCLUDE_DIRS ${Brotli_INCLUDE_DIR})
	set(Brotli_LIBRARIES ${Brotli_Dec_LIBRARIES} ${Brotli_Enc_LIBRARIES} ${Brotli_Common_LIBRARIES})
endif()
