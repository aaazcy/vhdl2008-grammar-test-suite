-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: Three when branches: a priority encoder judged by three conditional branches in sequence, verifying the complete priority semantics of a three-condition chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_three is
  port (
    val : in  integer;
    y   : out bit_vector(1 downto 0)
  );
end entity ent_ce_three;

architecture three_when of ent_ce_three is
begin
  y <= "11" when val > 200 else
       "10" when val > 100 else
       "01" when val > 0   else
       "00";
end architecture three_when;
