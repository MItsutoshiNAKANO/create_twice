/**
 * @file
 * @brief The SQL commands for creating the database role.
 * @date 2025
 * @copyright
 *   Mitsutoshi Nakano <ItSANgo@gmail.com>
 *   SPDX-License-Identifier: MIT
 */

CREATE ROLE sample LOGIN CREATEROLE PASSWORD 'sample';
CREATE DATABASE sample OWNER sample;
