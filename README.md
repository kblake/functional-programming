# A Taste of Functional Programming
Material to introduce functional programming using the Elixir language

## Objectives
* Exposure to functional concepts
* Use functional parts of your existing language of choice you’ve never used before
* Lead you to pursue a functional language more in-depth

## Paradigm evolution
* Mathematics (lambda calculus)
* Computer science
* spawn of languages and paradigms
  * functional, procedural, imperative, declarative, object-oriented programming (OOP)
* OOP overload...

## OOP limitations
```
[W]e’re going to be living in a multicore, distributed, concurrent — all the buzz words — world.
The conventional models we’ve been doing, the OO stuff… is not going to survive in that
kind of environment.” - Dave Thomas
```
```
“OOP promised a cure for the scourge of software complexity. …its weaknesses have become
increasingly apparent. Spreading state all over the place leads to concurrency issues
and unpredictable side effects.” - Dave Thomas
```
## Think in Functions not Objects
* **Functions**
  * Easy to reason about
  * reliable
  * pure
    * don't modify variables outside of scope
    * no side effects
    * deterministic (reproduciable results)
* **Data transformation**
  * ie. Unix pipes - `cat foo.log | grep bar | wc -l`
* **No side-effects**
  * Side effects are:
    * modifying state
    * has observable interaction with external functions
* **Immutability**
  * Immutable data is known data
  * Data that is created is not changed
  * Copy and alter
    * Compilers can perform optimizations because of this
    * Garbage collectors are smart about this
  * Avoid race conditions
* **Higher-order functions**
  * Functions can receive functions as arguments and return functions
* **Where is my *for* loop?**
  * recursion
  * map, reduce, filter, reject, take, etc.

## Some (impure and pure) functional languages
* LISP, Scheme, Clojure, Erlang, Scala, OCaml, Haskell, F#, Elm, Elixir

# Elixir
```
“Elixir is a dynamic, functional language designed for building scalable and
maintainable applications. Elixir leverages the Erlang VM, known for running low-latency,
distributed and fault-tolerant systems, while also being successfully used in web development
and the embedded software domain.” - http://elixir-lang.org
```

## Approachable code examples that highlight functional concepts
* **Anonymous/First-class functions**
  * https://github.com/kblake/functional-programming/tree/master/code/anonymous
* **Pattern Matching**
  * Not an assignment operator but an assertion
  * `=` is a match operator
  * https://github.com/kblake/functional-programming/tree/master/code/pattern_matching
* **Multi-bodied functions**
  * https://github.com/kblake/functional-programming/tree/master/code/multiple_bodies
* **Higher-order functions**
  * Functions that can take functions in as arguments or functions that return functions
  * https://github.com/kblake/functional-programming/tree/master/code/higher_order
* **Side-effects & State**
  * take data, copy it, alter copy, return it
  * always return the same output for any given input
  * https://github.com/kblake/functional-programming/tree/master/code/side_effects
   ```
   Doing the maths:
   (value2 * (value1 + value3)) + value1 * value2

   if value1 = 4, value2 = 2, value3 = 0
   then result should be 16

   (2 * (4 + 0)) + 4 * 2
   8 + 8
   16
   ```

* **Composition**
  * Combining simple functions to make more complicated ones
  * The result of one function is passed to the next; the result of the last function call is the result of the whole
  * Piping
  * Transforming data
  * https://github.com/kblake/functional-programming/tree/master/code/composition
* **Enumerables**
  * https://github.com/kblake/functional-programming/tree/master/code/enumerables
* **Partial function applications**
  * Elixir does not have built-in **currying** like Haskell or Scala
  * https://github.com/kblake/functional-programming/tree/master/code/partial_application
* **Recursion**
  <img src="http://1.bp.blogspot.com/-ipe--pLB7_4/UxKyf6KFD9I/AAAAAAAAAL8/9A91A01cCdk/s1600/11e2e0de282ef4ad1ae93ac9ab508b3b590293527.png" />
  * https://www.google.com/?gws_rd=ssl#safe=active&q=recursion
  * "Recursion in computer science is a method where the solution to a problem depends on solutions to smaller instances of the same problem (as opposed to iteration). The approach can be applied to many types of problems, and recursion is one of the central ideas of computer science." - https://en.wikipedia.org/wiki/Recursion_(computer_science)
  * Looping in traditional languages often times mutate and change data in sometimes unsuspecting ways
  * There is a lot of CS material out there that goes into depth on why this is true. Also you'll find recursion mentioned with terms such as Binary Trees and Binary Search Trees
  * **Tail-call Optimization**
    * If the very last thing a function does is call itself, there is no need to make the call. The runtime can jump back to the start of the function. The recursive call MUST be the last function executed. You may need to accumulate the results as you go.
    * Technique that allows the compiler to call a function without using any additional stack space
  * https://github.com/kblake/functional-programming/tree/master/code/recursion
* **Concurrency**
  * **Nodes** (distributed chat cluster)
    * Simple Chat - https://github.com/kblake/functional-programming/tree/master/code/concurrency/nodes/simple_chat
      * Steps for building the chat client: https://gist.github.com/kblake/63db44d13a933d6811d80d5ea5c2bd2f
    * Slash Chat - https://github.com/kblake/functional-programming/tree/master/code/concurrency/nodes/slash_chat
* **Examples**
  * Parallel Map
    * https://github.com/kblake/functional-programming/blob/master/code/examples/pmap.exs
  * OOP to Functional
    * Shopping Cart
      * OOP: https://github.com/kblake/functional-programming/blob/master/code/examples/shopping_cart.rb
      * Functional: https://github.com/kblake/functional-programming/blob/master/code/examples/shopping_cart.exs
    * Coin game
      * OOP: https://github.com/kblake/functional-programming/blob/master/code/examples/coin_game.rb
      * Functional: https://github.com/kblake/functional-programming/blob/master/code/examples/coin_game.exs
* **OTP**
  * Genservers
    * Shopping Cart
      * https://github.com/kblake/functional-programming/blob/master/code/otp/shopping_cart_genservers.exs
  * Supervision
    * Dynamic Supervision of products
      * https://github.com/kblake/functional-programming/blob/master/code/otp/shopping_cart_supervised.exs

## Sources
* http://nerd.kelseyinnis.com/blog/2012/12/17/slides-from-learning-functional-programming-without-growing-a-neckbeard/
* http://reactivex.io/learnrx/
* https://medium.com/@jugoncalves/functional-programming-should-be-your-1-priority-for-2015-47dd4641d6b9#.dzkjdoldo
* http://blog.jenkster.com/2015/12/what-is-functional-programming.html
* http://blog.jenkster.com/2015/12/which-programming-languages-are-functional.html
* https://devchat.tv/react-native-radio/20-CycleJS-Cycle-Native-and-RXJS-with-Andre-Staltz
* https://en.m.wikipedia.org/wiki/Functional_programming
* http://www.vasinov.com/blog/16-months-of-functional-programming/
* http://phuu.net/2014/08/31/csp-and-transducers.html
* https://medium.com/@cameronp/functional-programming-is-not-weird-you-just-need-some-new-patterns-7a9bf9dc2f77#.dmx784uc7
* http://www.elmbark.com/2016/03/16/mainstream-elm-user-focused-design
* https://github.com/hemanth/functional-programming-jargon
* http://www.infoq.com/presentations/functional-declarative-style
* http://michaelfeathers.typepad.com/michael_feathers_blog/2012/03/tell-above-and-ask-below-hybridizing-oo-and-functional-design.html
* http://eloquentjavascript.net/05_higher_order.html
* https://en.wikipedia.org/wiki/Function_composition_(computer_science)
* http://version2beta.com/articles/functional_first_development/
* [Basics of functional Programming by Siddharth Kulkarni](https://youtu.be/iSs3LdUZziU)
* https://engineering.pinterest.com/blog/re-architecting-pinterests-ios-app
* https://medium.com/@sarahabimay/writing-oo-in-a-functional-state-of-mind-5d6f56052d23#.b63k5pqo2
* http://blog.patrikstorm.com/function-currying-in-elixir
* **TODO**: Read about Category Theory - https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
* https://medium.com/@jugoncalves/functional-programming-should-be-your-1-priority-for-2015-47dd4641d6b9#.jzimhgjpv
* https://blog.codeship.com/statefulness-in-elixir/
* http://www.pebra.net/blog/2015/12/24/fun-prog-1/
* http://novarac.com/recursion-in-the-wild-elixir/
* http://trevork-csc148.blogspot.com/2014/03/recursion.html
* https://rosettacode.org/wiki/Walk_a_directory/Recursively#Elixir
