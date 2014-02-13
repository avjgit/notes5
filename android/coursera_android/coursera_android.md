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

3-2 Intent class
================
how to find target activity?
    - explicitly set
    - implicitly determined

EXPLICIT:
Intent helloAndroidIntent = new Intent(CONTEXT, CLASS);

Intent helloAndroidIntent = new Intent(
        LoginScreen.this,
        HelloAndroid.class
);

loginButton.setOnClickListener(new OnClickListener() {
            public void onClick(View v) {
                if (checkPassword(uname.getText(), passwd.getText())) {
                    Intent helloAndroidIntent = new Intent(
                            LoginScreen.this,
                            HelloAndroid.class
                    );
                    startActivity(helloAndroidIntent);
                } else {
                    uname.setText("");
                    passwd.setText("");
                }
            }
        }

IMPLICIT: (aka Intent resolution):
    1) from one side, intent says which operation it wants
    2) from other side, activities have told, which operations they can handle
        (in manifest) - IntentFilter

eg:
<activity>
    <intent-filter>
        <action android:name="android.intent.action.DIAL"

        <data
            android:mimetype="string"
            android:scheme="geo" //for google maps
            </activity>

eg, for map app:
<intent-filter>
    <action android:name="android.intent.action.VIEW"/>
    // responds to browser links
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme="geo"/>
</intent-filter>

priorities: between -1000 and 1000