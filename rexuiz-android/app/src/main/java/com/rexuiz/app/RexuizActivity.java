package com.rexuiz.app;

import java.io.File;

public class RexuizActivity extends org.libsdl.app.SDLActivity {
    protected String[] getLibraries() {
        return new String[] {
                "hidapi",
                "SDL2",
                "rexuiz-android"
        };
    }
    protected String[] getArguments() {
        String mediaDir = null;
        File mediaDirs[] = getExternalMediaDirs();
        for (int i = 0; i < mediaDirs.length; i++) {
            if (mediaDirs[i] == null) continue;
            mediaDir = mediaDirs[i].getAbsolutePath();
            break;
        }
        if (mediaDir == null)
            mediaDir = getExternalFilesDir(null) + "/";

        String args[] = new String[9];
        args[0] = "-basedir";
        args[1] = "rexuiz";
        args[2] = "-extradir1";
        args[3] = getExternalFilesDir(null) + "/";
        args[4] = "-userdir";
        args[5] = mediaDir + "/";
        args[6] = "-rexuiz";
        args[7] = "+gl_max_size";
        args[8] = "256";
        return args;
    }
}
