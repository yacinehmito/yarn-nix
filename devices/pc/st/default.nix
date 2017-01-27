{ st }:

st.override {
  conf = builtins.readFile ./config.def.h;
  patches = [ ./st-scrollback.patch ];
}
