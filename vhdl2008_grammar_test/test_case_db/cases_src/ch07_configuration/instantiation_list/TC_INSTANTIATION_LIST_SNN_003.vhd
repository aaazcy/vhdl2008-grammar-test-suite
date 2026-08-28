-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative
-- Test Focus: 'others' mixed with label names — 'others' must be the sole alternative; cannot be combined with explicit labels like 'others, u1'
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity il_snn3_ent is port(r:out bit); end entity;
architecture bh of il_snn3_ent is
  component c is port(x:in bit; y:out bit); end component;
  -- ERROR: 'others' mixed with explicit labels
  for others, u1 : c use entity work.il_snn3_ent(bh) port map(x=>'0', y=>r);
  signal s : bit := '0';
begin
  u1 : c port map(x=>s, y=>r);
end architecture bh;
