-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: complex nesting in an if statement: and/or/nor logical_expressions mixed in an if condition, with parentheses ensuring precedence
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_complex_ent is
  port(a, b, c, d, e, f : in boolean; result : out boolean);
end entity;
architecture rtl of logexpr_complex_ent is
begin
  process(a, b, c, d, e, f)
  begin
    if (a and b) or (c nor d) then
      result <= e xnor f;
    else
      result <= false;
    end if;
  end process;
end architecture rtl;
