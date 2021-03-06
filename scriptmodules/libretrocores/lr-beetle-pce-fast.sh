#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-beetle-pce-fast"
rp_module_desc="PCEngine emu - Mednafen PCE Fast port for libretro"
rp_module_section="main"

function sources_lr-beetle-pce-fast() {
    gitPullOrClone "$md_build" https://github.com/libretro/beetle-pce-fast-libretro.git
}

function build_lr-beetle-pce-fast() {
    make clean
    make
    md_ret_require="$md_build/mednafen_pce_fast_libretro.so"
}

function install_lr-beetle-pce-fast() {
    md_ret_files=(
        'mednafen_pce_fast_libretro.so'
        'README.md'
    )
}

function configure_lr-beetle-pce-fast() {
    # remove old install folders
    rm -rf "$rootdir/$md_type/lr-mednafen-pce-fast"

    mkRomDir "pcengine"
    ensureSystemretroconfig "pcengine"

    addSystem 1 "$md_id" "pcengine" "$md_inst/mednafen_pce_fast_libretro.so"
}
