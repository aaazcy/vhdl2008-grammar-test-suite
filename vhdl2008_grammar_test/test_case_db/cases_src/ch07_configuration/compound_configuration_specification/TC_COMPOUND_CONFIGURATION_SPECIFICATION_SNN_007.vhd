-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative
-- Test Focus: Missing semicolon after binding_indication within compound form — the compound form requires a semicolon after the binding_indication before the first vunit clause; omitting the semicolon breaks the grammar separation
-- Expected Result: Triggers syntax error (missing semicolon after binding_indication)
-- Dependencies: None
-- =============================================================
entity ccs_snn7_ent is port(r:out integer); end entity;
architecture bh of ccs_snn7_ent is
  component comp_x is port(a:in integer; b:out integer); end component;
  -- ERROR: missing semicolon after entity binding before vunit clause
  for u_x : comp_x use entity work.ccs_snn7_ent(bh)
    port map(a=>0, b=>r)
    use vunit check_x;
  end for;
  signal s:integer:=0;
begin
  u_x : comp_x port map(a=>s, b=>r);
end architecture bh;
