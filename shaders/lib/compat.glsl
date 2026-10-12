#ifndef EYECOMFORT_COMPAT_GLSL
#define EYECOMFORT_COMPAT_GLSL

// Iris keeps the compatibility-profile attributes and sampler names stable.
// No raw Minecraft vertex attributes, UBO layouts or Sodium internals are used.
// Minecraft 1.21.6 split environmental fog from render-distance fog.
// MC_VERSION is 12106 for 1.21.6 and 260100 for 26.1 (not 12601).
// Unknown versions use the basic legacy path; no unverified upper-version cap.
#if defined(MC_VERSION) && MC_VERSION >= 12106
    #define EC_SPLIT_FOG 1
#else
    #define EC_SPLIT_FOG 0
#endif

#endif
