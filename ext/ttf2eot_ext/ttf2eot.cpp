#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <string.h>
#include <ruby.h>

#include <vector>

#ifndef _MSC_VER
# include <stdint.h>
#else
typedef unsigned char uint8_t;
#endif

#include "OpenTypeUtilities.h"

VALUE eTTFConversionError;

static VALUE mTTF2EOT_eot_header(VALUE self, VALUE input) {
  vector<uint8_t> eotHeader(512);
  bool success;
  size_t overlayDst = 0;
  size_t overlaySrc = 0;
  size_t overlayLength = 0;

  if ( TYPE(input) != T_STRING )
    rb_raise(rb_eTypeError, "TTF2EOT.eot_header expects a string as input");

  success = getEOTHeader(
    (unsigned char *) RSTRING_PTR(input),
    RSTRING_LEN(input),
    eotHeader,
    overlayDst,
    overlaySrc,
    overlayLength
  );

  if ( success ) {
    return rb_str_new((char *) &eotHeader[0], eotHeader.size());
  } else {
    rb_raise(
      eTTFConversionError,
      "could not get EOT header - ensure input contains valid TTF font data"
    );
  }
}

extern "C" void Init_ttf2eot_ext() {
  VALUE mTTF2EOT = rb_const_get(rb_cObject, rb_intern("TTF2EOT"));
  eTTFConversionError = rb_define_class_under(mTTF2EOT, "ConversionError", rb_eStandardError);

  rb_define_module_function(mTTF2EOT, "eot_header", (VALUE(*)(...))mTTF2EOT_eot_header, 1);
}
