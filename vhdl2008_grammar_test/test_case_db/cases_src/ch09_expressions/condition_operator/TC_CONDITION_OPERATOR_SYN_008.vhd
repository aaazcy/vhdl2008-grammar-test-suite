-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? used in the condition of an assert statement — a std_logic signal converted to boolean with ?? as the assert condition, verifying the application of condition_operator in an assertion context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_co_assert is
  port (
    valid_i : in  std_logic;
    data_i  : in  integer
  );
end entity ent_co_assert;

architecture rtl of ent_co_assert is
begin
  process(valid_i, data_i)
  begin
    assert ?? valid_i
      report "Data invalid"
      severity warning;
  end process;
end architecture rtl;
