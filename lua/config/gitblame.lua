require('gitblame').setup {
    --Note how the `gitblame_` prefix is omitted in `setup`
    message_template = "<author> • <summary>",
    enabled = false,
}
