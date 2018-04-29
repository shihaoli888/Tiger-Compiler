Tiger Compiler
====

## 环境
Linux 	4.10
GCC 	5.4
Bison 	3.0
Flex 	2.6
Make 	4.1

## 文件清单
- `LJZ_TC/`
  - `include/`
    - balabala
  - `src/`
    - `tiger.lex` 
    - `tiger.y` 
  - `makefile`
  - `parsetest.tig`  语法测试TIGER程序
## 使用指南
- `make all` 

  生成可执行文件`parsetest.out`，并测试TIGER程序语法`parsetest.tig`

  *注意: 第一次生成时显示`没有那个文件或目录`为正常现象*

- `make clean`

  清除依赖文件、目标文件、可执行文件


