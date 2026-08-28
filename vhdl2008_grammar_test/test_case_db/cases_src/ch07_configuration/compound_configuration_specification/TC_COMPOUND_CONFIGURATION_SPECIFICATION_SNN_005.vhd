-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative
-- Test Focus: Missing "use" keyword before vunit name — the verification_unit_binding_indication requires "use vunit name"; writing "vunit name" without "use" violates the vunit binding grammar within the compound form
-- Expected Result: Triggers syntax error (missing "use" before vunit)
-- Dependencies: None
-- =============================================================
entity ccs_snn5_ent is port(r:out integer); end entity;
architecture bh of ccs_snn5_ent is
  component comp_x is port(a:in integer; b:out integer); end component;
  -- ERROR: "vunit check_x" without the "use" keyword
  for u_x : comp_x use entity work.ccs_snn5_ent(bh)
    port map(a=>0, b=>r);
    vunit check_x;
  end for;
  signal s:integer:=0;
begin
  u_x : comp_x port map(a=>s, b=>r);
end architecture bh;
