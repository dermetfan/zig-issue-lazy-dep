# Zig Issue [#21771](https://github.com/ziglang/zig/issues/21771)

## Problem Description

If two dependencies depend on the same package,  
but one does so lazily and the other one does not,  
the `build.zig` of the latter fails to compile  
if it does not use `lazyDependency()`  
(which it should not need to use as the dependency is not lazy).

Graphically:

```
         A
        / \
       B   C
(eager) \ / (lazy)
         D
```

`B` fails to compile.

## How to Reproduce

    zig build
