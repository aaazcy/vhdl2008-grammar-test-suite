-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: three verification unit names combined with "use configuration" binding — verification_unit_list contains three comma-separated verification unit names, and the compound configuration specification uses "use configuration" rather than "use entity" as binding_indication, verifies list parsing in the configuration binding context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vul_syn7_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn7_ent;

architecture rtl of vul_syn7_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  for u_nor : gate_nor use configuration work.nor_top_cfg;
    use vunit nor_func_check, nor_path_assert, nor_edge_monitor;
  end for;
begin
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
