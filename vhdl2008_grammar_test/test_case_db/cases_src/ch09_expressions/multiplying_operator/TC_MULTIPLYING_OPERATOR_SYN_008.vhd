-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: use of * and / in physical type time computation — a time type value multiplied by an integer frequency factor, verifying the syntax rules of multiplying_operator in mixed operations of physical type and integer (physical * integer = physical)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_physical_mul is
  port (
    period_i : in  time;
    factor_i : in  integer;
    scaled_o : out time
  );
end entity ent_physical_mul;

architecture rtl of ent_physical_mul is
begin
  scaled_o <= period_i * factor_i;
end architecture rtl;
