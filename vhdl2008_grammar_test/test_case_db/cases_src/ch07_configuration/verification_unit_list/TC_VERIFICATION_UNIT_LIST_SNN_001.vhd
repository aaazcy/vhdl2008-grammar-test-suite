-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: verification_unit_list starts with a comma — a leading comma appears before the first identifier of the list, the syntax requires the list to start with a verification_unit_name and not with a comma
-- Expected Result: Triggers syntax error: unexpected leading comma in verification_unit_list
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity vul_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity vul_snn1_ent;

architecture rtl of vul_snn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- ERROR: leading comma before first verification_unit_name
    use vunit , and_timing, and_power;
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
