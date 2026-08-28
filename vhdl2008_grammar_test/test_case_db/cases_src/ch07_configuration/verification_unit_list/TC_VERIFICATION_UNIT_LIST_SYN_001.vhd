-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: Single verification unit name — exercises the minimal form of verification_unit_list with exactly one verification_unit_name, demonstrating that the list can consist of a single name without commas
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity vul_syn1_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn1_ent;

architecture rtl of vul_syn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use entity work.gate_and(rtl);
    use vunit and_assertion_check;
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
