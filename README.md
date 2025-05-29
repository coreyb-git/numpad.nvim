Rebind a section of the keyboard to become a numpad after pressing the *Trigger* sequence of keys while in INSERT mode.  Escape from this mode by leaving insert mode, or by pressing the *Escape* sequence.

Why?

Not all keyboards have a numpad, and it's far easier to type long numbers on a numpad than on the top numerical row.

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
