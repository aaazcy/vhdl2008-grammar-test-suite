-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: the abs operator takes the absolute value of real floating-point type — a negative real signal becomes positive through abs, verifying the numeric semantics of abs on floating-point types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_abs_real is
  port (
    val_i : in  real range -1.0 to 1.0;
    mag_o : out real range 0.0 to 1.0
  );
end entity ent_abs_real;

architecture rtl of ent_abs_real is
begin
  mag_o <= abs val_i;
end architecture rtl;
