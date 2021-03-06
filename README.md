- [Using SASS With the 1KB Grid System](http://heygrady.com/blog/2011/02/17/using-sass-with-the-1kb-grid-system/)
- [Compass Grid Plugin and a New Fluid Grid Option](http://heygrady.com/blog/2012/04/20/compass-grid-gem-and-new-fluid-grid/)
- [Original Gist](https://gist.github.com/702760)
- [The 1KB CSS Grid](http://1kbgrid.com/)

## About
Simple grid system inspired by the [the 1KB CSS Grid](http://1kbgrid.com/) designed to utilize [Sass](http://sass-lang.com/) to remove unnecessary classes from the HTML markup and make customization easier. The best part is that it's not exactly 1KB now! Even better than the best part is that it's been extended to support fluid grids as well.

The next better best thing would be fully responsive media query support, but there's [some limitations in Sass as a language](https://github.com/nex3/sass/issues/116#issuecomment-5166163) that make that difficult to do in a Compass plugin. Although there are a few example on how best to support media queries with sass.

- [Responsive Web Design in Sass: Using Media Queries in Sass 3.2](http://thesassway.com/intermediate/responsive-web-design-in-sass-using-media-queries-in-sass-32)
- [Responsive Web Design in Sass Part 2: Media Queries in Sass](http://thesassway.com/intermediate/responsive-web-design-part-2)
- [Responsive Web Design in Sass Part 1: Fluid Layouts and Fluid Images](http://thesassway.com/intermediate/responsive-web-design-part-1)

## Installation
#### Install the Ruby Gem.
```
gem install compass-grid-plugin
```

#### Existing Compass Projects
You can include it in any existing Compass project by including the grid in your config.rb file.

```ruby
# Require any additional compass plugins here.
require 'compass-grid'
```

#### New Compass Projects
You can install the grid plugin as part of a new Compass project.

```
compass create my_project -r compass-grid -u compass-grid
```

## Fixed Grid Usage
The primary grid is a fixed, pixel grid. This grid is ideal for designs that do not require responsive design.

```scss
@import "grid";
```

### Variables 
- **$grid-column-width**: *60px* - The width of 1 column
- **$grid-gutter-width**: *20px* - The space between 2 columns
- **$grid-columns**: *12* - The total number of columns
- **$grid-clearfix-extend:** *false* - Determines if clearfix is applied directly to pages and rows or if an `@extend` directive should be used. Extend directives can make the code more compact but will cause issues in [Sass 3.1.19](http://sass-lang.com/docs/yardoc/file.SASS_CHANGELOG.html#3119) when `@media` queries are used.
- **$grid-clearfix-class:** *clearfix* - Sets the name of the clearfix class to extend if `$grid-clearfix-extend` is set to true.
- **$grid-clearfix-mixin:** *pie-clearfix* - Sets the mixin to use for the clearfix if `$grid-clearfix-extend` is set to false.
- **$grid-clearfix-class**: *true* - Create a `.clearfix` class to extend
- **$grid-support-for-ie6**: *false* - Apply fixes for IE6

### Functions
- **grid-column-width(** *$i*, *[$plus: 0]* **)** - Function for calculating column widths. Useful for integrating standard grid measurements into other elements, besides columns. Particularly useful for using columns widths as margin or padding.
- **grid-row-width(** *$i*, *[$plus: 0]* **)** - Function for calculating the inner width of a row. Useful for calculating percentages in the fluid grid. This function should not be applied to a row directly, row widths are supposed to be set to `auto`.
- **grid-gutter-width(** *[$row: false]* **)** - Function for calculating the width of a gutter. Useful for applying margins to columns and rows. The `$row` argument controls if the returned length is negative or not. Rows require a negative margin.

### Mixins
- **grid(** *$i*, *[$plus: 0]*, *[$with-gutters: false]* **)** - Mixin for applying widths to a column. The `$plus` argument can be used to alter the width to account for borders or padding. The `$with-gutters` argument will optionally output the gutter margins in addition to the width.
- **grid-page(** *[$i: $grid-columns]*, *[$plus: 0]*, *[$extend: $grid-clearfix-extend]* **)** - Mixin for declaring a page element. `$i` is `$grid-columns` by default but can be altered. The `$plus` argument can be used to alter the width to account for borders or padding.
- **grid-row(** *[$page: false]* **)** - Mixing for declaring a column container. The *$page* argument is removing the negative margins when directly inside a page element.
- **grid-column(** *[$i: false]*, *[$plus: 0]*, *[$extend: $grid-clearfix-extend]* **)** - Mixin for declaring a column. Specifying `$i` will call the `grid` mixin. The `$plus` argument is passed to the `grid` mixin if `$i` is also specified.
- **grid-gutters(** *[$row: false]* **)** - Mixin for adding gutter margins to a column or a row. The `$row` argument controls if the returned margins are negative. Rows require a negative margin.
- **grid-row-gutters( )** - Mixin for adding gutter margins to a row.
- **grid-column-gutters( )** - Mixin for adding gutter margins to a column.
- **grid-offset(** *[$i: 1]*, *[$plus: 0]*, *[$side]* **)** - Mixin for altering the left or right margin on a column. Useful for adding empty columns before or after a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width. *$side* can be right, left, top or bottom (although right and left are the most useful).
- **grid-offset-left(** *[$i: 1]*, *[$plus: 0]* **)** - Convenience mixin for setting the left margin on a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width.
- **grid-offset-right(** *[$i: 1]*, *[$plus: 0]* **)** - Convenience mixin for setting the right margin on a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width.
- **grid-css( )** - Outputs the default grid CSS in case those classes are required in the markup.

## Fluid Grid Usage
This is a fluid version of the grid that uses percentages for widths. This grid is ideal for responsive designs that need to scale depending on the device. The fluid grid is more complex because percentage widths depend on their context for meaning. Every function and mixin is similar to the fixed grid but there are two additional variables to provide context.

```scss
@import "grid/fluid";
```

### Variables
The fluid grid uses the variables from the fixed grid module.

- **$fluid-support-for-ie7**: *false* - Creates widths for IE6 and IE7 that have had a half-pixel subtracted to account for IE 7 and below always rounding up on partial pixels.

### Functions
- **fluid-column-width(** *$i*, *[$plus: 0]*, *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$nudge: false]* **)** - Function for calculating column widths. Useful for integrating standard grid measurements into other elements, besides columns. Particularly useful for using columns widths as margin or padding.
- **fluid-gutter-width(** *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$row: false]*, *[$nudge: false]* **)** - Function for calculating the width of a gutter. Useful for applying margins to columns and rows. The `$row` argument controls if the returned length is negative or not. Rows require a negative margin.
- **fluid-width(** *$width*, *[$context-width: grid-column-width($grid-columns, $grid-gutter-width)]*, *[$nudge: false]* **)** - Function for calculating arbitrary widths in percentages. The `$width` is the width of the element you want to calculate and `$context` is the width of the parent element.
- **fluid-nudge(** *[$context-width: grid-column-width($grid-columns, $grid-gutter-width)]*, *[$nudge: false]* **)** - Function for calculating width of a half-pixel. Used for correcting for IE6 and IE7 because they always roundup.

### Mixins
- **fluid(** *$i*, *[$plus: 0]*, *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$with-gutters: false]* **)** - Mixin for applying widths to a column. The `$plus` argument can be used to alter the width to account for borders or padding. The `$with-gutters` argument will optionally output the gutter margins in addition to the width.
- **fluid-page(** *[$i: $grid-columns]*, *[$plus: 0]*, *[$use-max-width: true]*, *[$extend: $grid-clearfix-extend]* **)** - Mixin for declaring a page element. `$i` is `$grid-columns` by default but can be altered. The `$plus` argument can be used to alter the width to account for borders or padding. The `$use-max-width` determines if a pixel max-width is applied as well.
- **fluid-row(** *[$page: false]*, *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$extend: $grid-clearfix-extend]* **)** - Mixin for declaring a column container. The `$page` argument is for removing the negative margins when a row is directly inside a page element.
- **fluid-column(** *[$i: false]*, *[$plus: 0]*, *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$with-gutters: true]* **)** - Mixin for declaring a column. Specifying `$i` will call the `grid` mixin. The `$plus` argument is passed to the *grid* mixin if `$i` is also specified. The `$with-gutters` argument can be used to omit the gutter margins.
- **fluid-offset(** *[$i: 1]*, *[$plus: 0]*, *[$side]*, *[$context: $grid-columns]*, *[$context-plus: 0]* **)** - Mixin for altering the left or right margin on a column. Useful for adding empty columns before or after a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width. `$side` can be right, left, top or bottom (although right and left are the most useful).
- **fluid-gutters(** *[$context: $grid-columns]*, *[$context-plus: 0]*, *[$row: false]* **)** - Mixin for adding gutter margins to a column or a row. The `$row` argument controls if the returned margins are negative. Rows require a negative margin.
- **fluid-row-gutters(** *[$context: $grid-columns]*, *[$context-plus: 0]* **)** - Mixin for adding gutter margins to a row.
- **fluid-column-gutters(** *[$context: $grid-columns]*, *[$context-plus: 0]* **)** - Mixin for adding gutter margins to a column.
- **fluid-offset-left(** *[$i: 1]*, *[$plus: 0]*, *[$context: $grid-columns]*, *[$context-plus: 0]* **)** - Convenience mixin for setting the left margin on a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width.
- **fluid-offset-right(** *[$i: 1]*, *[$plus: 0]*, *[$context: $grid-columns]*, *[$context-plus: 0]* **)** - Convenience mixin for setting the right margin on a column. The `$i` argument specifies the width of the offset in columns. The `$plus` argument can be used to alter the width.
- **fluid-css( )** - Outputs the default fluid grid CSS in case those classes are required in the markup.

## Notes
- You must define a `.clearfix` class for the grid to work properly. The grid attempts to extend an existing `.clearfix` class. By default a clearfix class is output automatically. If you want to use your own, you can set `$grid-clearfix-class: false;`.
- The only thing requiring an IE6 fix is the floats on columns.
- In order to support accurate fluid grid percentages, the number precision in Sass is set to 7.
- The fluid grid uses of `box-sizing` which isn't supported in IE7 or below. This will only matter if borders or padding are added to a column.
- The CSS generated by `@include fluid-css` for the fluid grid will not work in IE6 because of the use of the direct child selector.