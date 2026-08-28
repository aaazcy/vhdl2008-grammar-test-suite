-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: Four comma-separated verification unit names — exercises multiple repetitions of the { , verification_unit_name } pattern, demonstrating that the list can contain an arbitrary number of comma-separated names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nand;

architecture beh of gate_nand is
begin
end architecture beh;

entity vul_syn3_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn3_ent;

architecture rtl of vul_syn3_ent is
  component gate_nand is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nand;
  for u_nand : gate_nand use entity work.gate_nand(beh);
    use vunit nand_func_cov, nand_toggle_check, nand_delay_assert, nand_stimulus;
  end for;
begin
  u_nand : gate_nand port map(x1 => a, x2 => b, z => y);
end architecture rtl;
