- [Blog post](http://heygrady.com/blog/2011/02/17/using-sass-with-the-1kb-grid-system/)
- [Gist](https://gist.github.com/702760)
- [The 1KB CSS Grid](http://1kbgrid.com/)

Simple grid system based on [the 1KB CSS Grid](http://1kbgrid.com/) designed to utilize [SASS](http://sass-lang.com/) to remove unnecessary classes from the HTML markup and make customization easier. The best part is that it's not exactly 1KB now!

## Usage

### Variables 
- **$column-width**: *60px* - The width of 1 column
- **$gutter-width**: *20px* - The space between 2 columns
- **$columns**: *12* - The total number of columns
- **$grid-css**: *false* - Output the generic CSS styles
- **$grid-support-for-ie6**: *false* - Apply fixes for IE6

### Functions
- **grid-width( $i, [$plus] )** - Function for calculating column widths. Useful for integrating standard grid measurements into other elements, besides columns. Particularly useful for using columns widths as margin or padding.

### Mixins
- **grid( $i, [$plus] )** - Mixin for applying widths to a column. The *$plus* argument can be used to alter the width to account for borders or padding.
- **grid-page( [$i], [$plus] )** - Mixin for declaring a page element. *$i* is *$columns* by default but can be altered. The *$plus* argument can be used to alter the width to account for borders or padding.
- **grid-row( $page )** - Mixing for declaring a column container. The *$page* argument is removing the negative margins when directly inside a page element.
- **grid-column( [$i], [$plus] )** - Mixin for declaring a column. Specifying *$i* will call the *grid* mixin. The *$plus* argument is passed to the *grid* mixin if *i* is also specified.
- **grid-offset( [$i], [$plus], [$side] )** - Mixin for altering the left or right margin on a column. Useful for adding empty columns before or after a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width. *$side* can be rigt, left, top or bottom (although right and left are the most useful).
- **grid-offset-left( [$i], [$plus] )** - Convenience mixin for setting the left margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.
- **grid-offset-right( [$i], [$plus] )** - Convenience mixin for setting the right margin on a column. The *$i* argument specifies the width of the offset in columns. The *$plus* argument can be used to alter the width.

## Notes
- You must define your own clearfix class for the grid to work properly. The grid attempts to extend an existing .clearfix class. If you're using [Compass](http://compass-style.org), I'd recommend using their [PIE Clearfix](http://compass-style.org/reference/compass/utilities/general/clearfix/#mixin-pie-clearfix): `.clearfix { @include pie-clearfix; }`
- The only thing requiring an IE6 fix is the floats on columns. The implemented fix is wrapped in an `.ie6` class that relies on the [HTML5 Boilerplate](http://html5boilerplate.com/) fix for [conditional styles](http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/) to avoid applying nonsense rules to other browsers.