-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: Arithmetic expression as the index — s_buf(a + b) uses an addition expression as the index; the expression is a simple_expression containing an addition operator, verifying that the index expression of indexed_name may be any legal expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_expr_idx is
  port(offset_a : in natural range 0 to 3;
       offset_b : in natural range 0 to 3;
       val_out : out integer);
end entity;

architecture vhdl2008 of idx_name_expr_idx is
  type t_regfile is array(0 to 7) of integer;
  signal s_rf : t_regfile := (0,1,2,3,4,5,6,7);
  signal base : natural range 0 to 3 := 0;
begin
  process(offset_a, offset_b)
    variable idx : natural range 0 to 7;
  begin
    idx := offset_a + offset_b;
    val_out <= s_rf(idx);
  end process;
end architecture vhdl2008;
