// cmp: {{_input_:target}}
if diff := cmp.Diff({{_input_:want}}, {{_input_:got}}); diff != "" {
    t.Errorf("{{_input_:target}} mismatch (-want, +got):%s\n", diff)
}
