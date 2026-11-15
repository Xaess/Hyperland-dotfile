---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "gb",
        kb_variant   = "intl",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

for _, name in ipairs({
    "x820uitra",
    "x820uitra-keyboard",
    "x820uitra1-keyboard",
    "x820uitra2-keyboard",
    "x820uitra3-keyboard",
}) do
    hl.device({ name = name, kb_layout = "us", kb_variant = "intl" })
end
