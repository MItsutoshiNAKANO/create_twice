#ifndef SQL_ERROR_H
#define SQL_ERROR_H 1

/// @file
/// @brief SQL error handling.
/// @date 2025
/// @copyright
///   Mitsutoshi Nakano <ItSANgo@gmail.com>
///   SPDX-License-Identifier: MIT

#include <stdarg.h>

/// @brief PostgreSQL Warning.
#define SQL_WARN(...) sql_warn(__FILE__, __LINE__, __func__, __VA_ARGS__)

/// @brief PostgreSQL Error.
#define SQL_ERROR(...) sql_error(__FILE__, __LINE__, __func__, __VA_ARGS__)

void vsql_warn(
    const char *file, long line, const char *func, const char *fmt, va_list ap
);
void
sql_warn(const char *file, long line, const char *func, const char *fmt, ...);
[[noreturn]] void vsql_error(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, va_list ap
);
[[noreturn]] void sql_error(
    const char *file, long line, const char *func, int exit_status,
    const char *fmt, ...
);

#endif // End of ifndef SQL_ERROR_H
