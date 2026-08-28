-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative (Semantic)
-- Test Focus: instantiation_list label references a non-existent instantiation -- the label "u_bad" is listed in the configuration specification's instantiation_list but no corresponding component instantiation with that label exists in the architecture body; this results in an unresolvable binding target
-- Expected Result: Triggers semantic error (unresolvable instantiation label)
-- Dependencies: None
-- =============================================================
entity il_smn_bad_label is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of il_smn_bad_label is
  component inv_gate is
    port(a : in bit; y : out bit);
  end component;

  -- ERROR: "u_bad" is not an instantiation label in this architecture
  for u_inv, u_bad : inv_gate
    use entity work.il_smn_bad_label(bh)
    port map(a => '0', y => open);

  signal mid : bit := '0';
begin
  u_inv : inv_gate
    port map(a => din, y => mid);
  dout <= mid;
end architecture bh;
