﻿# k9S Chocolatey Package

A [Chocolatey package](https://chocolatey.org) for [k9s](https://k9scli.io/).

Note: This is not the official package definition.  I made this just to learn how to create a Chocolatey package.

## Contributing

1. Make changes to [k9s.nuspec](./k9s.nuspec).
2. Build an updated chocolatey package

   ```powershell
   choco pack
   ```

3. Install the package and verify everything works

   ```powershell
   choco install -dv -s . --pre
   ```
