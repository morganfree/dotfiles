### Migrate pass/gpg

1. Export private and public keys to file 
   - `gpg --export-secret-key [key] --armor --output [file.key]`
   - `gpg --export [key] --armor --output [file.pub]`
2. Copy password store directory (default `~/.password-store`
3. Import private and public keys
   - `gpg --import [file.key]`
   - `gpg --import [file.pub]`
4. Trust the imported key
   - `gpg --edit-key [key]
   - trust ultimately (5)
   - type `quit`
