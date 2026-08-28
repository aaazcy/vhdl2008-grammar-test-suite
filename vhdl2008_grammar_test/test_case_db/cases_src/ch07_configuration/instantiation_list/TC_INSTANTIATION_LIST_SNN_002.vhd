-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative
-- Test Focus: Trailing comma in instantiation_list — a trailing comma after the last label in the configuration specification is invalid syntax
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity il_snn2_ent is port(r:out bit); end entity;
architecture bh of il_snn2_ent is
  component c is port(x:in bit; y:out bit); end component;
  -- ERROR: trailing comma in instantiation_list
  for u_c, : c use entity work.il_snn2_ent(bh) port map(x=>'0', y=>r);
begin
  u_c : c port map(x=>'0', y=>r);
end architecture bh;
