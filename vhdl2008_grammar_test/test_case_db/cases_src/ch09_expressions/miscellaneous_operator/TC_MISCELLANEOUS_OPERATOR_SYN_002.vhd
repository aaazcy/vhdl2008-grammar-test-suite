-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: the abs operator takes the absolute value of an integer — a negative integer signal outputs its absolute value after the abs operation, verifying the syntax of abs as a unary numeric operation of miscellaneous_operator in an expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_abs_int is
  port (
    val_i : in  integer range -128 to 127;
    mag_o : out integer range 0 to 128
  );
end entity ent_abs_int;

architecture rtl of ent_abs_int is
begin
  mag_o <= abs val_i;
end architecture rtl;
