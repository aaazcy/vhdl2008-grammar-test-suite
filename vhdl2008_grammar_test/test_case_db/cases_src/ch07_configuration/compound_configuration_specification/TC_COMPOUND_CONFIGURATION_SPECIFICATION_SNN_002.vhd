-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative
-- Test Focus: Missing "end for" terminator — the compound form must close with "end for ;", omitting it violates the production's closing syntax
-- Expected Result: Triggers syntax error (unterminated compound configuration)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ccs_no_end_for is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_no_end_for is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: compound configuration missing "end for ;"
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
    use vunit and_check;
  -- missing: end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
