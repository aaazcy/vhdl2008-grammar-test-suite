-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_ADDING_OPERATOR_CONCAT_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Rule Description: The concatenation operator & requires both operands to be one-dimensional array types with the same element type.
-- Error Category: Type mismatch
-- Test Focus: SMN: the & operator has operands with different element types - attempting to concatenate bit_vector with std_logic_vector directly, verifying that & requires the element base types of both arrays to be the same, bit and std_ulogic are different base types and the compiler should report a type mismatch
-- Expected Result: Triggers semantic error: type mismatch for & — different element base types (bit vs std_ulogic)
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_smn_concat_mismatch is
  port (
    bv_i : in  bit_vector(3 downto 0);
    sv_i : in  std_logic_vector(3 downto 0);
    y_o  : out bit_vector(7 downto 0)
  );
end entity ent_smn_concat_mismatch;

architecture rtl of ent_smn_concat_mismatch is
begin
  -- ERROR: & operands must have same element type — bit vs std_ulogic are incompatible
  y_o <= bv_i & sv_i;
end architecture rtl;
