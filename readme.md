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
    - `env.h` 值环境和类型环境接口
    - `escape.h` 逃逸分析接口
    - `flowgraph.h` 数据流图生成接口
    - `frame.h` 栈帧相关接口
    - `graph.h` 基本的图结构接口
    - `liveness.h` 活跃分析接口
    - `semant.h` 语义分析接口 涉及类型检查和中间代码树
    - `symbol.h` 符号表接口
    - `table.h`  基础hash表接口
    - `temp.h` 临时变量接口
    - `translate.h` 中间代码翻译接口，由semant调用
    - `tree.h` 中间代码树数据结构
    - `types.h` 类型接口
    - `canon.h` 基本块生成、线性化、trace生成相关接口
    - `color.h` 寄存器着色接口
    - `regalloc.h` 寄存器分配相关接口
    - `absyn.h` 抽象语法树接口
    - `assem.h`汇编代码接口
    - `codegen.h`指令选择接口
    - `errormsg.h`报错接口
    - `util.h`使用函数接口
  - `src/`
    - `env.c` 值环境和类型环境实现
    - `escape.c` 逃逸分析实现
    - `flowgraph.c` 数据流图生成实现
    - `frame_mips.c` 栈帧相关实现
    - `graph.c` 基本的图结构实现
    - `liveness.c` 活跃分析实现
    - `semant.c` 语义分析实现
    - `symbol.c` 符号表实现
    - `table.c`  基础hash表实现
    - `temp.c` 临时变量实现
    - `translate.c` 中间代码翻译实现
    - `tree.c` 中间代码树构造函数
    - `types.c` 类型实现
    - `tiger.lex` lex词法分析
    - `canon.c` 基本块生成、线性化、trace生成相关实现
    - `color.c` 寄存器着色相关实现
    - `regalloc.c` 寄存器分配相关实现，包含对活性分析的调用
    - `tiger.y`yacc语法分析
    - `absyn.c`抽象语法树实现
    - `assem.c`汇编代码结构实现
    - `codegen_mips.c`指令选择实现
    - `errormsg.c`报错函数实现
    - `main.c`程序入口
    - `util.c`实用函数实现
  - `lib/`
    - `libtiger.c` , `libtiger.s` TIGER外部函数
    - `tigerMain.c`, `tigerMain.s` TIGER程序编译结果示例
  - `visualization/` 可视化中间代码树
    - index.html 中间代码树呈现文件
    - ir_vis.txt 生成的原始数据文件
    - index.js 可视化相关处理
    - main.css 可视化处理相关样式
    - Treant.js 可视化用到的库文件
    - Treant.css 可视化用到的库文件
    - vendor 可视化用到的Treant依赖
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



