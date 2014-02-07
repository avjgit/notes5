3-1 Intent class
================
activation: explicit or implicit

purposes: operation or event

"I want to do smth"

fields:
-------
action:     action_dial, _edit, _sync, _main
            Intent newInt = new Intent(Intent.ACTION_DIAL);
            or
            Intent newInt = new Intent();
            newInt.setAction(Intent.ACTION_DIAL);
data:       Uri (maps, phones)
category:   _browsable, _launcher
type:       MIME (image/png; text/htmlm)
            Inte
component:  the receiver of this intent
            use only if there is exactly 1 receiver
            Intent newi = Intent(Context pkgContext, Class< ? > cls);
extras:     key-values
            Intent.EXTRA_EMAIL: email recipients
            Intent newi = new Intent(Intent.ACTION_SEND)
            newi.putExtra(
                android.content.Intent.EXTRA_EMAIL,
                new String[]{
                    "asdf@gmail.com", "qwer@gmail.com"
                }
            )
flags:      how handle the intent
            FLAG_ACTIVITY_NO_HISTORY
            FLAT_DEBUG_LOG_RESOLUTION
