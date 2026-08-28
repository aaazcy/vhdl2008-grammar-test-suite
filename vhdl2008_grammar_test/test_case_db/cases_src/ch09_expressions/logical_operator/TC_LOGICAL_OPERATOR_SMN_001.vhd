-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_LOGICAL_OPERATOR_TYPE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Rule Description: Both operands of a logical operator must be of the same type. Bit and std_ulogic are different base types and cannot be mixed in a logical operation.
-- Error Category: Type mismatch
-- Test Focus: SMN: the left and right operand types of logical_operator differ — a bit signal and a std_logic signal used in an and operation, verifying that logical_operator requires exactly the same type on both sides, bit and std_ulogic are different base types and cannot be mixed
-- Expected Result: Triggers semantic error: type mismatch — bit and std_ulogic are different types for logical_operator
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_smn_type_mismatch is
  port (
    ba_i : in  bit;
    sa_i : in  std_logic;
    y_o  : out bit
  );
end entity ent_smn_type_mismatch;

architecture rtl of ent_smn_type_mismatch is
begin
  -- ERROR: type mismatch — bit and std_ulogic are different types
  y_o <= ba_i and sa_i;
end architecture rtl;
