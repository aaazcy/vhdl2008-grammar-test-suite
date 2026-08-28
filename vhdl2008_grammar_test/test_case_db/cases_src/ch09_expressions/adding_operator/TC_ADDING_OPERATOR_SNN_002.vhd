-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Test Focus: SNN: incompatible operand types for the concatenation operator & - attempting to concatenate integer with bit_vector, verifying that & as an adding_operator requires both operands to be one-dimensional arrays with the same element type, the compiler reports a type mismatch error
-- Expected Result: Triggers semantic error: type mismatch for concatenation operator &
-- Dependencies: None
-- =============================================================
entity ent_bad_concat_type is
  port (
    num_i : in  integer;
    vec_i : in  bit_vector(3 downto 0);
    y_o   : out bit_vector(7 downto 0)
  );
end entity ent_bad_concat_type;

architecture rtl of ent_bad_concat_type is
begin
  -- ERROR: & requires both operands to be array types; integer is not an array
  y_o <= vec_i & num_i;
end architecture rtl;
