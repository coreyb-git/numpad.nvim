Rebind a section of the keyboard to become a number pad after pressing the *Trigger* sequence of keys while in INSERT mode.  Escape from numpad mode by by pressing the *Escape* sequence, or by leaving INSERT mode.

Why?

Not all keyboards have a number pad, and it's far easier to type long numbers on a numpad than on the top numerical row.

```
return {
  "coreyb-git/numpad.nvim",
	opts = {
	  TopRow = "890",
	  MiddleRow = "iop",
	  BottomRow = "kl;",
	  Zero = ",",
	  Dot = ".",

	  Trigger = "kk",
	  Escape = "j",
	},
	lazy = false,
}
```
