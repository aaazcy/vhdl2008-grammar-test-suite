-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: bitwise negation of a bit_vector with not — an 8-bit bit_vector negated with not gives the bitwise inverted result, verifying the vector application of the not operator on a one-dimensional logic array
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_not_vector is
  port (
    data_i : in  bit_vector(7 downto 0);
    inv_o  : out bit_vector(7 downto 0)
  );
end entity ent_not_vector;

architecture rtl of ent_not_vector is
begin
  inv_o <= not data_i;
end architecture rtl;
