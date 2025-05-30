Rebind a section of the keyboard to become a number pad after pressing the *Trigger* sequence of keys while in INSERT mode.  Escape from numpad mode by pressing the *Escape* sequence, or by leaving INSERT mode.

Why?

Not all keyboards have a number pad, and it's far easier to type long numbers on a numpad than on the top numerical row.

```
return {
  "coreyb-git/numpad.nvim",
	opts = {
		TopRow = "uio",
		MiddleRow = "jkl",
		BottomRow = "m,.",
		Zero = " ",
		Dot = "h",
		Addition = "a",
		Subtraction = "s",
		Multiplication = "d",
		Division = "f",

		Trigger = "kk",
		Escape = "q",

		ExtraSpacebar = "g",  --because space is rebound to 0

		--UnbindOnEnter = { "jk" },  --uncomment if you use the typical jk insert mode escape sequence
		--BindOnEnter = { { "", "" }, },
		--UnbindOnExit = { "" },
		--BindOnExit = { { "jk", "<ESC>" }, },  --uncomment if using jk
	},
	lazy = false,
}
```
