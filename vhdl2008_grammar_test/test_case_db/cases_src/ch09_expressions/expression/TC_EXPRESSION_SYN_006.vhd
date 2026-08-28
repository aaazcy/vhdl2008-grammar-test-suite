-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: expression in a case statement: a logical_expression containing xor as the condition part of the case select expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_case_ent is
  port(sel : in bit_vector(1 downto 0); match : out boolean);
end entity;
architecture rtl of expr_case_ent is
  signal a, b : bit;
begin
  a <= sel(0); b <= sel(1);
  process(a, b)
  begin
    case (a xor b) is
      when '0' => match <= false;
      when '1' => match <= true;
      when others => match <= false;
    end case;
  end process;
end architecture rtl;
