-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SNN_006
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative
-- Test Focus: "all" mixed with explicit instantiation labels -- similar to "others", the "all" reserved-word alternative must appear as the sole element in the instantiation_list; combining "all" with explicit labels like "all, u_inst : comp" violates the grammar
-- Expected Result: Triggers syntax error (all mixed with explicit labels)
-- Dependencies: None
-- =============================================================
entity il_snn6_all_label is
  port(r : out bit);
end entity;

architecture bh of il_snn6_all_label is
  component c_drv is
    port(x : in bit; y : out bit);
  end component;

  -- ERROR: "all" cannot be combined with explicit label "u_drv"
  for all, u_drv : c_drv
    use entity work.il_snn6_all_label(bh)
    port map(x => '0', y => r);

  signal s : bit := '0';
begin
  u_drv : c_drv port map(x => '1', y => s);
  r <= s;
end architecture bh;
