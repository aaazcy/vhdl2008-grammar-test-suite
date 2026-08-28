-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SMN: function and signal with the same name in the block declarative part — the function name and the signal name conflict in the same scope
-- Expected Result: Triggers semantic error: duplicate identifier for function and signal
-- Dependencies: None
-- =============================================================
entity bdp_smn1_ent is
  port(a : in integer; y : out integer);
end entity;
architecture bh of bdp_smn1_ent is
begin
  b_bad : block
    signal s_calc : integer := 0;
    function s_calc(x : integer) return integer is
    begin
      return x + 1;
    end function;
  begin
    s_calc <= a;
    y <= s_calc;
  end block;
end architecture bh;
