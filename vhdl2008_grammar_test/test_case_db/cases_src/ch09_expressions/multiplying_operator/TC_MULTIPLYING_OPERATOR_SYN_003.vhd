-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: the division operator / used to compute an average — two unsigned numbers summed and then divided by 2, verifying the mixed use of / in the multiplying_operator chain of a term with + at a different precedence level
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_div_avg is
  port (
    val_a   : in  unsigned(7 downto 0);
    val_b   : in  unsigned(7 downto 0);
    avg_o   : out unsigned(7 downto 0)
  );
end entity ent_div_avg;

architecture rtl of ent_div_avg is
begin
  avg_o <= (val_a + val_b) / 2;
end architecture rtl;
