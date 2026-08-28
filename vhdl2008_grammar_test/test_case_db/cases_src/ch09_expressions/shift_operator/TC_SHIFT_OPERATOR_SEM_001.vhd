-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SHIFT_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Rule Description: Shift operators are predefined for one-dimensional arrays of BIT and BOOLEAN types (and their subtypes). The shift amount must be of type INTEGER. The result type is the same as the left operand.
-- Test Focus: Semantic correctness of shift_operator on the three vector types bit_vector/signed/unsigned — each type uses logical shift and arithmetic shift respectively, verifying the vector type requirement of shift_operator and the result type preservation rule
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sem_shift_types is
  port (
    bv_i : in  bit_vector(7 downto 0);
    sv_i : in  signed(7 downto 0);
    uv_i : in  unsigned(7 downto 0);
    bv_o : out bit_vector(7 downto 0);
    sv_o : out signed(7 downto 0);
    uv_o : out unsigned(7 downto 0)
  );
end entity ent_sem_shift_types;

architecture rtl of ent_sem_shift_types is
begin
  bv_o <= bv_i srl 3;
  sv_o <= sv_i sra 2;
  uv_o <= uv_i sll 1;
end architecture rtl;
