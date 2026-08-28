-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: eight comma-separated verification unit names — verification_unit_list extended to eight verification unit names, tests the parsing capability of the { , verification_unit_name } repetition pattern in a larger list, covering complete verification scenarios from functional verification to timing checks
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vul_syn5_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn5_ent;

architecture rtl of vul_syn5_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl)
    port map(x1 => a, x2 => b, z => y);
    use vunit cov, ast, tmg, stm, mon, fcv, pwr, dbg;
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
