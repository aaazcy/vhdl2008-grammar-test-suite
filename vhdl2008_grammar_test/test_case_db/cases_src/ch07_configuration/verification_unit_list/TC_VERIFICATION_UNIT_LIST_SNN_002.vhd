-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: Trailing comma in verification_unit_list — a comma appears after the last verification_unit_name with no subsequent name, violating the grammar rule that each comma must be followed by another verification_unit_name
-- Expected Result: Triggers syntax error: unexpected trailing comma in verification_unit_list
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity vul_snn2_ent is
  port(a, b : in bit; y : out bit);
end entity vul_snn2_ent;

architecture bh of vul_snn2_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  for u_nor : gate_nor use entity work.gate_nor(beh);
    -- ERROR: trailing comma after last verification_unit_name
    use vunit nor_timing, nor_power,;
  end for;
begin
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture bh;
