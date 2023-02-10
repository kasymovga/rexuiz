package com.rexuiz.app;

public class RexuizActivity extends org.libsdl.app.SDLActivity {
    protected String[] getLibraries() {
        return new String[] {
                "hidapi",
                "SDL2",
                "rexuiz-android"
        };
    }
    protected String[] getArguments() {
        String args[] = new String[7];
        args[0] = "-basedir";
        args[1] = "rexuiz";
        args[2] = "-userdir";
        args[3] = getExternalFilesDir(null) + "/";
        args[4] = "-rexuiz";
        args[5] = "+gl_max_size";
        args[6] = "256";
        return args;
    }
}
