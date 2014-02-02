1. Set up the Android SDK
    ADT; Intel Hardware Accelerated Execution Manager (HAXM) enabled
2. Create a new Android application.
    ok, app3 created
3. Create an Android Virtual Device and start the Android Emulator.
    ok, virt3 created; with snapshots
4. Run the application you created in Part 2.
    [2014-02-01 18:09:57 - app3] Success!
    [2014-02-01 18:09:57 - app3] Starting activity com.example.app3.MainActivity on device emulator-5554
    [2014-02-01 18:09:58 - app3] ActivityManager: Starting: Intent { act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] cmp=com.example.app3/.MainActivity }
5. Import an application project.
    ok, 42; note: "copy project to workspace"
6. Debug an Android application.
    private static final String TAG = "WikiNotes";
    LogCat - log.i/d/e/v
    ok: 02-01 11:41:34.305: I/TheAnswer(1078): Again - Printing answer to life
7. Further explore the IDE
    screenshot - ok
    telnet
        telnet localhost 5554

        sms send <sender’s phone nmber> <message>

        network speed edge
        KO: invalid <speed> argument, see 'help network speed' for valid values
          gsm      GSM/CSD
          hscsd    HSCSD
          gprs     GPRS
          edge     EDGE/EGPRS
          umts     UMTS/3G
          hsdpa    HSDPA
          full     no limit
          <num>    selects both upload and download speed
          <up>:<down> select individual upload/download speeds

        doesn't seem very much difference on emulator...

    label texts -
        res/values/string.xml
        res/values-ru/string.xml

    HOW TO EDIT UI:
    DDMS Perspective/ "dump view hierarchy to UI automator"

    how to find out field usage - Open Call Hierarchy

    select process/ update heap/ heap tab/ Cauce GC btn

    method profiling
    calc test didn't started