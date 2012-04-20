- [Blog post](http://heygrady.com/blog/2011/02/17/using-sass-with-the-1kb-grid-system/)
- [Gist](https://gist.github.com/702760)
- [The 1KB CSS Grid](http://1kbgrid.com/)

Simple grid system based on [the 1KB CSS Grid](http://1kbgrid.com/) designed to utilize [SASS](http://sass-lang.com/) to remove unnecessary classes from the HTML markup and make customization easier. The best part is that it's not exactly 1KB now!

## Fixed Grid Usage
The primary grid is a fixed pixel grid. This grid is ideal for designed that do not require responsive design.

### Variables 
- **$grid-column-width**: *60px* - The width of 1 column
- **$grid-gutter-width**: *20px* - The space between 2 columns
- **$grid-columns**: *12* - The total number of columns
- **$grid-clearfix-class**: *true* - Create a `.clearfix` class to extend
- **$grid-support-for-ie6**: *false* - Apply fixes for IE6

### Functions
- **grid-column-width( $i, [$plus: 0] )** - Function for calculating column widths. Useful for integrating standard grid measurements into other elements, besides columns. Particularly useful for using columns widths as margin or padding.

### Mixins
- **grid( $i, [$plus: 0] )** - Mixin for applying widths to a column. The *$plus* argument can be used to alter the width to account for borders or padding.
- **grid-page( [$i: $grid-columns], [$plus: 0] )** - Mixin for declaring a page element. *$i* is *$columns* by default but can be altered. The *$plus* argument can be used to alter the width to account for borders or padding.
- **grid-row( [$page: false] )** - Mixing for declaring a column container. The *$page* argument is removing the negative margins when directly inside a page element.
- **grid-column( [$i: false], [$plus: 0] )** - Mixin for declaring a column. Specifying *$i* will call the *grid* mixin. The *$plus* argument is passed to the *grid* mixin if *i* is also specified.
- **grid-offset( [$i: 1], [$plus: 0], [$side] )** - Mixin for altering the left or right margin on a column. Useful for adding empty columns before or after a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width. *$side* can be rigt, left, top or bottom (although right and left are the most useful).
- **grid-offset-left( [$i: 1], [$plus: 0] )** - Convenience mixin for setting the left margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.
- **grid-offset-right( [$i: 1], [$plus: 0] )** - Convenience mixin for setting the right margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.
- **grid-css( )** - outputs the default grid CSS in case those classes are required in the markup.

## Notes
- You must define a `.clearfix` class for the grid to work properly. The grid attempts to extend an existing `.clearfix` class. By default a clearfix class is output automatically. If you want to use your own, you can set `$grid-clearfix-class: false;`.
- The only thing requiring an IE6 fix is the floats on columns.

## Fluid Grid Usage
There is also a fluid version of the grid that uses percentages for widths. This grid is ideal for responsive designs that need to scale depending on the device. The fluid grid is more complex because percentage widths depend on their context for meaning. Every function and mixin is similar to the fixed grid but there are two additional variables to provide context.

### Variables
The fluid grid uses the variable from the fixed grid module

### Functions
- **fluid-column-width( $i, [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Function for calculating column widths. Useful for integrating standard grid measurements into other elements, besides columns. Particularly useful for using columns widths as margin or padding.
- **fluid-width( $i, [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Function for calculating arbitrary widths.

### Mixins
- **fluid( $i, [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Mixin for applying widths to a column. The *$plus* argument can be used to alter the width to account for borders or padding.
- **fluid-page( [$i: $grid-columns], [$plus: 0], [$use-max-width: true] )** - Mixin for declaring a page element. *$i* is *$columns* by default but can be altered. The *$plus* argument can be used to alter the width to account for borders or padding.
- **fluid-row( [$page: false], [$parent: $grid-columns], [$parent-plus: 0] )** - Mixing for declaring a column container. The *$page* argument is removing the negative margins when directly inside a page element.
- **fluid-column( [$i: false], [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Mixin for declaring a column. Specifying *$i* will call the *grid* mixin. The *$plus* argument is passed to the *grid* mixin if *i* is also specified.
- **fluid-offset( [$i: 1], [$plus: 0], [$side], [$parent: $grid-columns], [$parent-plus: 0] )** - Mixin for altering the left or right margin on a column. Useful for adding empty columns before or after a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width. *$side* can be rigt, left, top or bottom (although right and left are the most useful).
- **fluid-offset-left( [$i: 1], [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Convenience mixin for setting the left margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.
- **fluid-offset-right( [$i: 1], [$plus: 0], [$parent: $grid-columns], [$parent-plus: 0] )** - Convenience mixin for setting the right margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.
- **fluid-css( )** - outputs the default fluid grid CSS in case those classes are required in the markup.