workspace(name = "tink_cc_awskms")

http_archive(
    name = "tink_cc",
    urls = ["https://github.com/tink-crypto/tink-cc/archive/main.zip"],
    strip_prefix = "tink-cc-main",
)

load("@tink_cc//:tink_cc_deps.bzl", "tink_cc_deps")

tink_cc_deps()

load("@tink_cc//:tink_cc_deps_init.bzl", "tink_cc_deps_init")

tink_cc_deps_init()

load("@tink_cc_awskms//:tink_cc_awskms_deps.bzl", "tink_cc_awskms_deps")

tink_cc_awskms_deps()
