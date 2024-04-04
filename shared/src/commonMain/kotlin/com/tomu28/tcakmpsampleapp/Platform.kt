package com.tomu28.tcakmpsampleapp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform