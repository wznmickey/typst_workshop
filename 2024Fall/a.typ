
#import "@preview/codly:1.0.0": *
#import "@preview/gentle-clues:1.0.0": *
#set text(font: ("Noto Sans", "Noto Sans CJK SC"))
#show: codly-init.with()
#set page(height: auto, width: 35cm)
#let LaTeX = {
  set text(font: "New Computer Modern")
  box(
    width: 2.55em,
    {
      [L]
      place(top, dx: 0.3em, text(size: 0.7em)[A])
      place(top, dx: 0.7em)[T]
      place(top, dx: 1.26em, dy: 0.22em)[E]
      place(top, dx: 1.8em)[X]
    },
  )
}
#let getExample(ex) = {
  example[
    #columns()[
      #raw(ex, block: true, lang: "typst")
      #colbreak()
      #eval(ex, mode: "markup")
    ]
  ]
}
= Typst workshop
王梓宁 Zining Wang

#link("mailto:first@wznmickey.com")

#datetime.today().display()

== 介绍

Typst 是一个Markup语言，目前是用 `Rust` 写的实现，支持多种模式，包括*标记模式*、*数学模式*和*代码模式*。它的设计目标是提供一种更加直观、易用的文档编辑方式，同时提供 #LaTeX 的强大功能。

== 使用Typst的方式

文件名后缀为`.typ`，可以通过以下方式使用Typst：

1. 在Typst的官网上使用在线编辑器 https://typst.app/
2. 使用Typst的VSCode插件，在vscode中编辑



== 一些资源
=== 文档
- https://typst-doc-cn.github.io/docs/packages/
- https://typst.app/docs/
=== 包和模板
- https://typst.app/universe/
- https://github.com/wznmickey/JI_Lab_Report_typst_template


== 三种模式 参考 https://typst.app/docs/reference/syntax/
- 标记模式 Markup Mode (类似 Markdown)
  - 默认模式
- 数学模式 Math Mode (类似 #LaTeX)
  - 在 `$` 与 `$`之间输入，同时支持行间公式和行内公式
- 代码模式 Code Mode (类似 一般编程代码)
  - 使用`#` 开头。
  - 所有的标记模式里面的格式实际上都是代码模式里的部分函数的语法糖，可以通过函数方式调用以与其他代码协同

=== 标记模式

- 标题
  #getExample("= 我是标题1
== 我是标题2")
- 列表
  #getExample("1. 有序列表
  1. 有序列表
  2. 有序列表
    1. 有序列表
2. 有序列表
- 无序列表
- 无序列表
  - 无序列表
  - 无序列表
    - 无序列表
+ 有序列表
+ 有序列表
  + 有序列表
  ")
- 强调
  #getExample("*强调* _emphasis_")

=== 数学模式

- 行内公式
  #getExample("这是一个行内公式 $a^2 + b^2 = c^2$ 这是一个行内公式")
- 行间公式
  #getExample("这是一个行间公式 $ a^2 + b^2 = c^2 $ 这是一个行间公式")
- 各类符号
  #getExample("$alpha dot beta dots gamma sum_(-15)^(infinity) 3<=10  overline(1 + 2 + ... + 5) , a eq 3, b eq.not 3, a in NN^* sqrt(123) sin(x) = sin (2 pi), 1/2, 1/((2+2^e + 4/c)^(3^delta)) integral arrow.r.double.bar Delta sect \\u{2229} ∩$
$ alpha dot beta dots gamma sum_(-15)^(infinity) 3<=10  overline(1 + 2 + ... + 5) $
$ a eq 3, b eq.not 3, a in NN^* sqrt(123) sin(x) = sin (2 pi), 1/2 $
$ 1/((2+2^e + 4/c)^(3^delta)) integral arrow.r.double.bar Delta sect \\u{2229} ∩ $")

- 分段函数、矩阵等多行情况
  #getExample("$ f(x, y) := cases(
  1 \"if\" (x dot y)/2 <= 0,
  2 \"if\" x \"is even\",
  3 \"if\" x in NN,
  4 \"else\",
) mat(
  1, 2, ..., 10;
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, 10, ..., 10;
) $
")


== 代码模式 语法 （与rust语法不同，请不要混淆）
- 以`#` 开头（如果需要多行命令，使用大括号包起来）。 部分内容需要一定的编程基础。


=== 部分常用的 #LaTeX 和 markdown 功能在typst使用方法
1. 代码: 原生自带，使用`raw`函数或\`导入， 与markdown类似 https://typst.app/docs/reference/text/raw/
#getExample("`a = 5` ")
#getExample("```python
a = 5
b = 10
``` ")
#getExample("#raw(\"int x = 5;\")")
#getExample("#raw(\"int x = 5;\",block: true, lang: \"c++\")")
2. bibliography: 原生自带，使用`bibliography`函数导入，需要引用时使用`@`（也可以引用如图片之类的内部材料）。 https://typst.app/docs/reference/model/bibliography/

#getExample("@madje2022programmable")

#getExample("#bibliography(\"a.bib\")")

3. 图片: 原生自带，使用`image`函数导入 https://typst.app/docs/reference/visualize/image/
#getExample("#image(\"Feishu_Group.jpg\",width: 70%) ")

4. 表格: 原生自带，使用`table`函数导入

#getExample("#table(columns:3)[Name][ID][Score][Zining Wang][520370910042][A+]")

5. beamer: 使用第三方包（比如`touying`)

6. 引用：原生自带，使用`quote`函数导入
#getExample("#quote()[Hello, world!]")
#getExample("#quote(block:true)[Hello, world!]")


=== 代码编写

- 以`#` 开头（如果需要多行命令，使用大括号包起来）。
#getExample("#text(\"123\")")
#getExample("#set text(size: 1.5em)
#text(\"123\")")
#getExample("#{set text(size: 1.5em)
text(\"123\")
}")

- 如果临时要使用标记模式的文本材料，使用`[]`包起来。
#getExample("#[= Hello]")
- 表达式（函数等的返回值）会以默认文本格式显示
#example[
  #columns(3)[

    ```typst
    "hello".len()
    ```
    #colbreak()
    #"hello".len()

    #colbreak()
    ```python
    print(len("hello"))
    ```
    ```c
    printf("%d",strlen("hello"));//严格来说这一句有点小问题，因为strlen返回的是size_t类型，但是printf的格式化符号是%d，应该是%zu
    ```
    ```matlab
    disp(strlength("hello"));
    ```
  ]
]

- 使用`let` 赋值与（解）绑定
#example[
  #columns(3)[
    ```
    #{
      let x = 1
      x
    }
    ```
    #colbreak()
    #{
      let x = 1
      x
    }

    #colbreak()
    ```python
    x = 1
    print(x)
    ```
    ```c
    int x = 1;
    printf("%d",x);
    ```
    ```matlab
    x = 1;
    disp(x);
    ```

  ]
]

#example[
  #columns(3)[
    ```
    #{
      let myFun(x,y) = {x+y}
      myFun(1,2)
    }
    ```
    #colbreak()
    #{
      let myFun(x, y) = {
        x + y
      }
      myFun(1, 2)
    }
    #colbreak()
    ```python
    def myFun(x, y):
      return x + y
    print(myFun(1, 2))
    ```
    ```c
    int myFun(int x, int y) {
      return x + y;
    }
    printf("%d", myFun(1, 2));
    ```
    ```matlab
    function z = myFun(x, y)
      z = x + y;
    end
    disp(myFun(1, 2));
    ```
  ]
]

- 函数调用的一些语法糖
#getExample("#{
  let alert1(body, fill: red) = {
    rect(
      fill: fill,
      [*Warning:\ #body*],
    )
  }
  let alert2(fill: red, body) = {
    rect(
      fill: fill,
      [*Warning:\ #body*],
    )
  }
  alert1[
    Danger is imminent!
  ]

  alert1(fill: blue)[
    KEEP OFF TRACKS
  ]

  alert1(\"KEEP OFF TRACKS\",fill: blue)
  alert2(\"KEEP OFF TRACKS\",fill: blue)
}
")
- 有 `if`, `while`。 `for` 是 in-range 设计。
#example[
  #columns(3)[
    ```
    #{
      let array = (1, 2, 3)
      for i in array {
        if i >= 2 [#i]
      }
    }
    ```
    #colbreak()
    #{
      let array = (1, 2, 3)
      for i in array {
        if i >= 2 [#i]
      }
    }
    #colbreak()
    ```python
    array = (1, 2, 3)
    for i in array:
      if i >= 2:
        print(i)
    ```
    ```c
    int array[] = {1, 2, 3};
    for (int i = 0; i < 3; i++) {
      if (array[i] >= 2) {
        printf("%d", array[i]);
      }
    }
    ```
    ```matlab
    array = [1, 2, 3];
    for i = array
      if i >= 2
        disp(i);
      end
    end
    ```
  ]]


- `set` and `show` 修改文档的样式属性 https://typst.app/docs/reference/styling
  - `set` 设置属性
  #getExample("#set text(size: 1em,style:\"italic\")
交大\ 密院\
#set text(size: 1.5em)
交大\ 密院\
#set text(style:\"normal\")
上海\ 闵行\
#highlight[SJTU]
#highlight[Shanghai]
#set highlight(fill:blue)
#highlight[China]
#highlight[Asia]")
  - `show` 修改文档的默认设置
#getExample("#{
  set heading(numbering: \"I.I\")
  show heading: it => [
    #set align(center)
    \~ #emph(it.body)
    #counter(heading).display(it.numbering) \~
  ]
  [
    = Typst
      == A
      == B

    = Markdown

    === D
  ]
}")

=== 代码编写 Advanced
- 类型
  - 字符串 String`""`
  - 数组(变长) Array`()`
  - 字典 Dict `(key:value)`
- 使用`.`访问字段和方法
#example[
  #columns()[
    ```
    #let it = [== Typst]
    #it.depth
    #let dict = (name: "JI")
    #dict.at("name")
    #dict.values()
    ```
    #colbreak()
    #let it = [== Typst]
    #it.depth
    #let dict = (name: "JI")
    #dict.at("name")
    #dict.values()

  ]]
- 使用let解包数组
#example[
  #columns()[
    ```
    #{
      let (a,..,b) = (1,2,3,4,5)
      b
    }
    ```
    #colbreak()
    #{
      let (a, .., b) = (1, 2, 3, 4, 5)
      b
    }
  ]]

== Lab 模板

https://github.com/wznmickey/JI_Lab_Report_typst_template