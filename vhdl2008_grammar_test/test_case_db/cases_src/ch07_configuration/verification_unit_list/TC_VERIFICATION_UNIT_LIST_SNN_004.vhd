-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: Missing comma between verification unit names — two verification_unit_name identifiers appear adjacent with no comma separator between them, violating the grammar requirement that multiple names must be separated by commas
-- Expected Result: Triggers syntax error: expected comma between verification unit names
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity vul_snn4_ent is
  port(a, b : in bit; y : out bit);
end entity vul_snn4_ent;

architecture bh of vul_snn4_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use entity work.gate_and(rtl);
    -- ERROR: missing comma between verification_unit_names
    use vunit and_timing and_functional;
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture bh;
