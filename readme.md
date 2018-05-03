#### Easily create a hex color gradient between any two colors using plain old Ruby. Use on the command line, or integrate into any Ruby application to generate gradients on the fly.
---

### USAGE:
1. Create a new Gradient with the two end colors, and the amount of steps you'd like your gradient to have in between:
    -- i.e. `gradient = Gradient.new("ffffff", "#d80015", 5)`
2. This will print the gradient to the console, and return a Gradient object. The gradient colors are stored as an array, to access them either type `gradient.output` or run `gradient.generate`
3. To increase/decrease the number of steps in your gradient, simply run `.generate(steps)` with the new number of steps you'd like to use. i.e. `more_detailed_gradient = gradient.generate(15)`.

### Notes"
Gradients will automatically be generated from lightest color -> darkest color.
You can enter the initial colors either with or without the # sign at the front.

#### Example:
Creating a new gradient
```ruby
load "ruby_gradient.rb"
gradient = Gradient.new("d80015", "#ffffff")
=> Colors:
      1: #ffffff
      2: #f5bfc4
      3: #eb7f8a
      4: #e13f4f
      5: #d80015
#<Gradient:0x007fae5b02f920>
```

Changing the level of detail (steps):
```ruby
# Uses the same Gradient object created in the above sample. No need to re-input the colors.
gradient.generate(15)
=> ["#ffffff",
     "#fcecee",
     "#f9dadd",
     "#f6c8cc",
     "#f3b6bc",
     "#f1a3ab",
     "#ee919a",
     "#eb7f8a",
     "#e86d79",
     "#e55b68",
     "#e34857",
     "#e03647",
     "#dd2436",
     "#da1225",
     "#d80015"
   ]
```