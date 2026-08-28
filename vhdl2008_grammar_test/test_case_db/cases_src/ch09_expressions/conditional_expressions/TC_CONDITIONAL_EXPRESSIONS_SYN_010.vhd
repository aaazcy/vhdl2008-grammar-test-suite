-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional expression containing aggregate values: y <= (x"00") when lo else (x"FF") when hi else (x"AA"); each branch returns an array aggregate value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ce_aggregate_val is
  port (
    lo, hi : in  boolean;
    byte   : out bit_vector(7 downto 0)
  );
end entity ce_aggregate_val;

architecture agg_ce of ce_aggregate_val is
begin
  byte <= x"00" when lo else
          x"FF" when hi else
          x"AA";
end architecture agg_ce;
