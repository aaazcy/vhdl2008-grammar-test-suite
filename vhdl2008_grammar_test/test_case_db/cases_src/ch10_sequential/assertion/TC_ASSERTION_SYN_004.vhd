-- =============================================================
-- Case ID: TC_ASSERTION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive
-- Test Focus: Full clauses with report+severity: assert + boolean_expression + report string expression + severity note
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_full_ent is
  port (
    op_valid : in  boolean;
    op_sel   : in  integer range 0 to 7;
    op_done  : out boolean
  );
end entity assert_full_ent;

architecture pipeline of assert_full_ent is
begin
  process(op_valid, op_sel) is
  begin
    assert op_valid
      report "Invalid operation code: " & integer'image(op_sel)
      severity note;
    op_done <= op_valid;
  end process;
end architecture pipeline;
