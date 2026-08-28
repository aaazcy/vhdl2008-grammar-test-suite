-- =============================================================
-- Case ID: TC_SIGN_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Minus sign - used in a process to compute a signed difference — - is used to adjust the signed representation of the difference of two unsigned values, verifying the practical design use of - in sequential logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sign_signed_diff is
  port (
    clk  : in  bit;
    a_i  : in  signed(7 downto 0);
    b_i  : in  signed(7 downto 0);
    neg_o: out signed(7 downto 0)
  );
end entity ent_sign_signed_diff;

architecture rtl of ent_sign_signed_diff is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      neg_o <= -a_i + b_i;
    end if;
  end process;
end architecture rtl;
