-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: use of * and / in physical type time computation — a time type value multiplied by an integer frequency factor and divided by an integer division factor, verifying the semantics of multiplying_operator in mixed operations of physical type and integer (physical * integer = physical)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_physical_ops is
  port (
    base_period : in  time;
    factor      : in  integer;
    scaled_o    : out time
  );
end entity ent_physical_ops;

architecture rtl of ent_physical_ops is
begin
  scaled_o <= base_period * factor;
end architecture rtl;
