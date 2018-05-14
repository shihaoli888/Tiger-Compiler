cmake_minimum_required(VERSION 3.9)
project(LJZ_TC C)

#set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_DEBUG")

include_directories(include)

add_executable(LJZ_TC
        include/absyn.h
        include/env.h
        include/errormsg.h
        include/frame.h
        include/semant.h
        include/symbol.h
        include/table.h
        include/temp.h
        include/translate.h
        include/tree.h
        include/types.h
        include/util.h
        include/y.tab.h
        src/absyn.c
        src/env.c
        src/errormsg.c
        src/frame_x86.c
        src/lex.yy.c
        src/semant.c
        src/symbol.c
        src/table.c
        src/temp.c
        src/translate.c
        src/tree.c
        src/types.c
        src/util.c
        src/y.tab.c

        src/parsetest.c
        include/canon.h src/canon.c)
