-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_RELATIONAL_OPERATOR_TYPE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Rule Description: The operands of a relational operator must be of the same type. Comparison between different types (such as integer and real) is not allowed without explicit conversion.
-- Error Category: Type mismatch
-- Test Focus: SMN: the > operator compares operands of different types——in ia_i > rb_i, ia_i is integer while rb_i is real; a relational operator requires the two operand types to be exactly the same
-- Expected Result: Triggers analysis error: no function declarations for operator ">"
-- Dependencies: None
-- =============================================================
entity relop_int_gt_real is
  port (
    ia_i : in  integer;
    rb_i : in  real;
    y_o  : out boolean
  );
end entity relop_int_gt_real;

architecture vhdl2008 of relop_int_gt_real is
begin
  y_o <= ia_i > rb_i;
end architecture vhdl2008;
