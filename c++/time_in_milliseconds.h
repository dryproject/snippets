/* This is free and unencumbered software released into the public domain. */

#ifndef TIME_IN_MILLISECONDS_H
#define TIME_IN_MILLISECONDS_H

#include <chrono>  /* for std::chrono */
#include <cstdint> /* for std::uint64_t */

/**
 * Returns the current time as the milliseconds since the epoch.
 *
 * This function requires at minimum the C++11 standard library.
 *
 * @return the number of milliseconds since the epoch
 * @see http://en.cppreference.com/w/cpp/chrono/steady_clock
 */
static inline std::uint64_t
time_in_milliseconds() {
  using clock = std::chrono::steady_clock; /* a monotonic clock */
  using precision = std::chrono::milliseconds;
  using std::chrono::duration_cast;
  return duration_cast<precision>(clock::now().time_since_epoch()).count();
}

#endif /* TIME_IN_MILLISECONDS_H */
