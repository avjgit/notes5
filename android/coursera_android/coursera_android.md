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

3-3 Permissions
================
android built-in and application custome
    contacts, sms, camera

in manifest

<uses-permission android:name="android.permission.CAMERA">
<uses-permission android:name="android.permission.internet>
<uses-permission android:name="android.permission.precise location>

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="course.examples.MapLocationFromContacts"
    android:versionCode="1"
    android:versionName="1.0" >

    <uses-permission android:name="android.permission.READ_CONTACTS" >
    </uses-permission>

example with BOOM application:

    <permission
        android:name="course.examples.permissionexample.BOOM_PERM"
        android:description="@string/boom_perm_string"
        android:label="@string/boom_permission_label_string">
    </permission>

activity permissions
    startactivity()
service permissions
    context.starteservice()
broadcast receivers permissions
contentprovider permissions

3-3 Fragments 1
================
a behavior/ portion of UI within an activity
activity can have many fragments
fragment can be reused in misc activities

resumed     - visible
paused      - another activity in foreground
stopped

onattach()          - when fragment is being attached to activity
oncreate()          - no UI set up
onCreateView()      - creates view
onActivityCreated() -

onStart()           - hosting activity about to become visible
onResume()          - ... and ready to user interaction
onPause()           - smth in foreground
onStop()            - not visible
onDestroyView()     - detached from actitivy; clean up resources
onDestroy()         - fragment no longer in user; release fragment resources
onDetach()          - no longer attached; null out refs to host activity

3-4 Fragments 2
================
add to activity -
    statically, in activity layout
    or via fragment manager

    oncreateview() returns UI for host activity

STATICALLY
which class implements this fragment:
    class="course.examples.Fragments.StaticLayout.TitlesFragment" />

    <fragment
        android:id="@+id/titles"
        android:layout_width="0px"
        android:layout_height="match_parent"
        android:layout_weight="1"
        class="course.examples.Fragments.StaticLayout.TitlesFragment" />

    <fragment
        android:id="@+id/details"
        android:layout_width="0px"
        android:layout_height="match_parent"
        android:layout_weight="2"
        class="course.examples.Fragments.StaticLayout.QuotesFragment" />

@Override
public View onCreateView(LayoutInflater inflater, ViewGroup container,
        Bundle savedInstanceState) {
    return inflater.inflate(R.layout.quote_fragment, container, false);
}

DYNAMICALLY
1 ref to fragmentmngr
2 fragmenttransaction
3 add fragment
4 commit

check:
framelayouts

    @Override
    public void onListSelection(int index) {
        if (!mQuoteFragment.isAdded()) {
            FragmentTransaction fragmentTransaction = mFragmentManager
                    .beginTransaction();
            fragmentTransaction.add(R.id.quote_fragment_container,
                    mQuoteFragment);
            fragmentTransaction.addToBackStack(null);
            fragmentTransaction.commit();
            mFragmentManager.executePendingTransactions();
        }
        if (mQuoteFragment.getShownIndex() != index) {
            mQuoteFragment.showIndex(index);
        }
    }

setretaininstance