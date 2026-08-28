-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: minimal form: the not operator negates a bit signal — a single bit input output after logical negation with not, verifying the minimal unary operation syntax of not as a miscellaneous_operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_not_bit is
  port (
    a_i : in  bit;
    y_o : out bit
  );
end entity ent_not_bit;

architecture rtl of ent_not_bit is
begin
  y_o <= not a_i;
end architecture rtl;
