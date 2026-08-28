-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: type conversion used in a signal assignment: y <= integer(v) embeds a type conversion as the complete assignment expression in a concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_signal is
  port (
    v : in  real;
    y : out integer
  );
end entity ent_tc_signal;

architecture sig_conv of ent_tc_signal is
begin
  y <= integer(v);
end architecture sig_conv;
