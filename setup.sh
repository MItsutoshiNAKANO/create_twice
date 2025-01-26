#! /bin/sh -eux

##
# @file
# @brief Setup the database for the sample project.
# @date 2025
# @copyright
#   Mitsutoshi Nakano <ItSANgo@gmail.com>
#   SPDX-License-Identifier: MIT

dir=$(dirname "$0")
cd "$dir"

sudo sudo -u 'postgres' psql -f './sql/0010-create_role.sql'
make
