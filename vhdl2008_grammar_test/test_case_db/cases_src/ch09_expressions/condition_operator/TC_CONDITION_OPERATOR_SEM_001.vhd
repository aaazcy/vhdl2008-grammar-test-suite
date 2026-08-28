-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Rule Description: The condition operator ?? converts a value of type BIT or STD_ULOGIC (or one-dimensional arrays thereof) to a BOOLEAN value. For scalar types: '1'/'H'→TRUE, '0'/'L'→FALSE, others→error. For arrays: nonzero→TRUE.
-- Test Focus: Semantic correctness of condition_operator ?? on the three logic types bit/std_logic/bit_vector — verifying the implicit boolean conversion semantic rules of ?? for different logic types (scalar bit to boolean, vector reduction nonzero to boolean)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_sem_co_types is
  port (
    ba_i  : in  bit;
    sa_i  : in  std_logic;
    bva_i : in  bit_vector(3 downto 0);
    bo_o  : out bit;
    so_o  : out bit;
    bvo_o : out bit
  );
end entity ent_sem_co_types;

architecture rtl of ent_sem_co_types is
begin
  bo_o  <= '1' when ?? ba_i  else '0';
  so_o  <= '1' when ?? sa_i  else '0';
  bvo_o <= '1' when ?? bva_i else '0';
end architecture rtl;
