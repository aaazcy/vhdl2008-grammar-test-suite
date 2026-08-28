-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: procedure specification with missing 'procedure' keyword at declaration start; designator with parameter list appears as bare invalid declaration
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_noproc_ent is
  port(done: out bit);
end entity;
architecture bh of ps_noproc_ent is
  -- ERROR: missing 'procedure' keyword; designator bare without procedure token
  p_reset(signal v: out bit) is
  begin
    v <= '0';
  end p_reset;
  signal s_done: bit;
begin
  p_reset(s_done);
end architecture bh;
