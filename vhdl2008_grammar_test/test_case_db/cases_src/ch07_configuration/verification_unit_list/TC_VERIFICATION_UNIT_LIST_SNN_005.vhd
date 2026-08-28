-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: two consecutive commas with no identifier between them in verification_unit_list — an empty element exists in the list position, no verification_unit_name between the first comma and the second, the syntax requires a legal identifier after each comma
-- Expected Result: Triggers syntax error: empty element in verification_unit_list — expected verification_unit_name between consecutive commas
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1, x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity vul_snn5_ent is
  port(a, b : in bit; y : out bit);
end entity vul_snn5_ent;

architecture rtl of vul_snn5_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  for u_or : gate_or use entity work.gate_or(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- ERROR: empty element — consecutive commas with no name between
    use vunit or_check1,, or_check2;
  end for;
begin
  u_or : gate_or port map(x1 => a, x2 => b, z => y);
end architecture rtl;
