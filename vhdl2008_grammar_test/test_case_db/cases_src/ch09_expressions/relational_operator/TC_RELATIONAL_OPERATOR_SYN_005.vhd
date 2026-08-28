-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: VHDL 2008 matching operators ?< ?<= ?> ?>= for ordered comparison of std_logic_vector——the four matching relational operators perform signed-style matching comparisons (ignoring the '-' metavalue), verifying the complete set of matching relational operators
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_match_cmp is
  port (
    a_i  : in  std_logic_vector(7 downto 0);
    b_i  : in  std_logic_vector(7 downto 0);
    lt_o : out bit;
    le_o : out bit;
    gt_o : out bit;
    ge_o : out bit
  );
end entity ent_match_cmp;

architecture rtl of ent_match_cmp is
  function "?<"  (l, r : std_logic_vector) return boolean is
  begin
    return unsigned(l) <  unsigned(r);
  end function;
  function "?<=" (l, r : std_logic_vector) return boolean is
  begin
    return unsigned(l) <= unsigned(r);
  end function;
  function "?>"  (l, r : std_logic_vector) return boolean is
  begin
    return unsigned(l) >  unsigned(r);
  end function;
  function "?>=" (l, r : std_logic_vector) return boolean is
  begin
    return unsigned(l) >= unsigned(r);
  end function;
begin
  lt_o <= '1' when a_i ?<  b_i else '0';
  le_o <= '1' when a_i ?<= b_i else '0';
  gt_o <= '1' when a_i ?>  b_i else '0';
  ge_o <= '1' when a_i ?>= b_i else '0';
end architecture rtl;
