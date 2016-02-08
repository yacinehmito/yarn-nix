{
  "asciidoctor" = {
    version = "1.5.4";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "0xrli1fjsf1f0h6d9g55vzivxbqac2ygawcacx5ijnqn522wg9qc";
    };
  };
  "asciidoctor-diagram" = {
    version = "1.4.0";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "0yb2gqzzbvgf5im0bhv26s3h09m9m6a0pjlq3swqcvwi1szc64k5";
    };
    dependencies = [
      "asciidoctor"
    ];
  };
}
