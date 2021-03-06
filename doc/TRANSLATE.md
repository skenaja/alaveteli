The software translations are implemented using GNU gettext, and the
resource files are managed in Transifex.

The Transifex project is at
https://www.transifex.net/projects/p/alaveteli/; you'll probably want
an account there (ask on the mailing list).

# Summary

1. Make some changes to the software with `_('translatable strings')`
2. Run `./script/generate_pot.sh`
3. This should just cause the file at `locale/app.pot` to change.  Commit and push
4. Send a message to the alaveteli-dev mailing list warning them that you're going to upload this file to transifex
5. Wait a day or so
6. Update the `app.pot` resource in Transifex
7. When new translations are available, run `tx pull -a` and commit the results to the repository

# Detail

## Finding new translatable strings

To update the POT file with strings from the software source, run
`rake gettext:find` from the Alaveteli software.  This will also
update all the PO files for all the languages, which you don't
actually want, because these are all handled in Transifex; so you'll
want to revert these files again using git.

The script at `./script/generate_pot.sh` does these steps for you.

When you've changed the POT file, and committed it, you should warn
people on the mailing list before logging into Transifex and pressing
the button to import it into that system.  Otherwise, translators
might lose some of their old but useful translations.

## Pulling translations from Transifex
  
To update the local translation files using the Transifex command-line client, first install it:

    # easy_install transifex-client
  
Then you can run the following from the root of your Alaveteli install:

    tx pull -a
    
Finally, commit these translations to github as usual.
