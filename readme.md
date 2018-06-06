Tiger Compiler
====

## 构造编译器环境

Linux 	4.10
GCC 	5.4
Bison 	3.0
Flex 	2.6
Make 	4.1

## 生成可执行文件环境

在以下环境正常工作：

Linux debian-mips 3.2.0-4-4kc-malta

## 文件清单
- `LJZ_TC/`
  - `include/`
    - balabala
  - `src/`
    - `tiger.lex` 

    - `tiger.y` 
  - `lib/`
    - `libtiger.c` , `libtiger.s` TIGER外部函数
    - `tigerMain.c`, `tigerMain.s` TIGER程序编译结果示例
  - `visualization/` 可视化中间代码树
    - index.html
    - ir_vis.txt
    - ...
  - `makefile`
  - `CMakeLists.txt`
  - `customtests/` 测试用例
  - `testcases/` 书本测试用例


## 构造编译器指南
- `make all` 

  生成可执行文件`LJZ_TC`

  *注意: 第一次生成时显示`没有那个文件或目录`为正常现象*

- `make clean`

  清除依赖文件、目标文件、可执行文件

## 编译器使用指南


- `LJZ_TC <input file>`
	如：`LJZ_TC customtests/merge.tig`
	默认输出为`a.s`
	其余选项使用`help` 查看

- `gcc libtiger.s <assemble file>`
	连接外部库`libtiger.s`，生成可执行文件



