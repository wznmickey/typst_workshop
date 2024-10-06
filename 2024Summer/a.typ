#import "@preview/polylux:0.3.1": *
#import "@preview/codly:1.0.0": *
#set page(paper: "presentation-16-9")
#set text(size: 20pt)
#set text(font: ("IBM Plex Serif", "Noto Sans CJK SC"))
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

#polylux-slide[
  #align(horizon + center)[
    = Typst workshop
    Part 2
    #side-by-side[
      王梓宁 Zining Wang

      #link("mailto:first@wznmickey.com")

      2024 年 07 月 31 日
    ][
      #image("Feishu_Group.jpg", width: 10em)
    ]



  ]


]

#polylux-slide[
  == 一些资源
  === 文档
  - https://typst-doc-cn.github.io/docs/packages/
  - https://typst.app/docs/
  === 包和模板
  - https://typst.app/universe/

]
#polylux-slide[
  == 三种模式
  - 标记模式 Markup Mode (类似 Markdown)
    - 默认模式
  - 数学模式 Math Mode (类似 #LaTeX)
    - 在 `$` 与 `$`之间输入，同时支持行间公式和行内公式
  - 代码模式 Code Mode (类似 一般编程代码)
    - 使用`#` 开头。
    - 所有的标记模式里面的格式实际上都是代码模式里的部分函数的语法糖，可以通过函数方式调用以与其他代码协同
]
#polylux-slide[
  == 部分常用的 #LaTeX 包的typst替代
  1. 代码：原生自带，使用`raw`函数或\`导入
  2. bibtex：原生自带，使用`bibliography` 函数导入
  3. 图片：原生自带，使用`image` 函数导入
  4. 表格：原生自带，使用`table` 函数导入
  5. beamer：使用第三方包（比如`polylux`）
]

#polylux-slide[
  == 代码模式 语法 （与rust不同）
  - 以`#` 开头（如果需要多行命令，使用大括号包起来）。
  #side-by-side[
    ```
    #text("123")
    ```][
    #text("123")
  ]

  - 如果临时要使用标记模式的文本材料，使用`[]`包起来。
  #side-by-side[
    ```
    #[*Hello*]
    ```][
    #[*Hello*]
  ]
  - 表达式（函数等的返回值)会以默认文本格式显示

  #side-by-side[
    ```
    "hello".len()
    ```][
    #"hello".len()
  ]
]
#polylux-slide[
  - 使用`let` 赋值与（解）绑定
  #side-by-side[
    ```
    #{
      let x = 1
      x
    }
    ```][
    #{
      let x = 1
      x
    }
  ]

  #side-by-side[
    ```
    #{
      let (a,..,b) = (1,2,3,4,5)
      b
    }
    ```][
    #{
      let (a, .., b) = (1, 2, 3, 4, 5)
      b
    }
  ]
  #side-by-side[
    ```
    #{
      let myFun(x,y) = {x+y}
      myFun(1,2)
    }
    ```][
    #{
      let myFun(x, y) = {
        x + y
      }
      myFun(1, 2)
    }
  ]
]

#polylux-slide[
  - 有 `if`, `while`. `for` 是 in-range 设计
  #side-by-side[
    ```
    #{
      let array = (1, 2, 3)
      for i in array {
        if i >= 2 [#i]
      }
    }
    ```][
    #{
      let array = (1, 2, 3)
      for i in array {
        if i >= 2 [#i]
      }
    }
  ]
  - 使用`.`访问 字段和方法
  #side-by-side[
    ```
    #let it = [== Typst]
    #it.depth
    #let dict = (name: "JI")
    #dict.at("name")
    #dict.values()
    ```][
    #let it = [== Typst]
    #it.depth
    #let dict = (name: "JI")
    #dict.at("name")
    #dict.values()
  ]


]

#polylux-slide[
  - 类型
    - 字符串 String`""`            
    - 数组(变长) Array`()`
    - 字典 Dict `(key:value)`
  - `set` and `show` 修改文档的样式属性
]

