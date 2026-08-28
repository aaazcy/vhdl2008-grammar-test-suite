-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative
-- Test Focus: Empty vunit name after "use vunit" — "use vunit ;" omits the required verification_unit name; the grammar requires a valid verification_unit identifier after 'use vunit'
-- Expected Result: Triggers syntax error (missing vunit name)
-- Dependencies: None
-- =============================================================
entity ccs_snn6_ent is port(r:out integer); end entity;
architecture bh of ccs_snn6_ent is
  component comp_x is port(a:in integer; b:out integer); end component;
  -- ERROR: empty vunit name after "use vunit"
  for u_x : comp_x use entity work.ccs_snn6_ent(bh)
    port map(a=>0, b=>r);
    use vunit ;
  end for;
  signal s:integer:=0;
begin
  u_x : comp_x port map(a=>s, b=>r);
end architecture bh;
