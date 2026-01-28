
A text editor is a "content first" place to write text and/or code. It
separates the process of typing from the process of viewing the result.

You might want to use a text editor because:

- By writing in plain text you make it easier to use the kinds of version
  control systems that are built for collaboration on code (which is plain
  text) (like Github).
- By writing in plain text you want to avoid distractions and focus on writing.
- By writing in plain text you want to future proof your intellectual products
  (plain text is not likely to vanish even if the plain text formatting like
  **for bold text** or \textbf{for bold text} or <strong>for bold text</strong>
  changes.)
- By writing in plain text you want to be able to have flexibility in
  publishing: you can more easily convert between pdf and html (or even docx)
  if you start with something like markdown than if you start with docx, let
  alone versions of formatting used by academic publishing houses (compare the
  LaTeX templates on Overleaf).
- By writing in plain text in a text editor you use a tool that is built for
  writing. 

Now to the editors:

There are two that were designed before the mouse and are still widely used
especially for folks using cluster and high performance computing because they
are lazy and don't want to setup use of a mouse remotely.

- Emacs: There is at least one Science Fiction writer who is a fan of Emacs
  <https://www.emacswiki.org/emacs/NealStephenson>. I wrote my dissertation and
  early papers using Emacs (if you are interested, you can google "emacs for
  Mac" or "emacs for Windows".). 

- Vi/Vim/Neovim: The other main tool that is like emacs is vim --- and the
  latest version is called neovim <https://neovim.io/>. A Gui version for Mac
  is called VimR. You can see some other GUIs that might be better than VimR
  here <https://neovim.io/screenshots/>.

- VS Code: If you want to edit a document on Github in a Codespace, this is
  what starts. All of my professional coder friends use VS Code. You don't have
  to mess up VS Code with extensions like I have. :)  The new integrated
  development environment from the makers of RStudio (Posit) are making
  something called Positron which is a version of VS Code designed to focus on
  R and python and markdown (Quarto, Jupyter).

- Sublime Text editor: I suspect people who liked Sublime text editor are
  moving to VS Code. But you might like it.

- Texifier/TeXShop: These are editors that are focused on editing and viewing
  LaTeX files.

There are lots of other cool editors out there like
[Pulsar](https://pulsar-edit.dev/) or [Zed](https://zed.dev/). I encourage you
to play around with them.

More notes:

- Why not RStudio? I don't like to start R everytime I want to type text. I
  don't like having screen real estate taken up by R related stuff when all I
  want to do is type text.

- What about on the fly spelling checking and grammer etc? All of these editors
  have plugins and extensions to enable them. For example, in VS Code you can
  look for weasel words using the write-good linter
  <https://marketplace.visualstudio.com/items?itemName=travisthetechie.write-good-linter>,
  and you can use that same linter in Neovim or Emacs etc. 



