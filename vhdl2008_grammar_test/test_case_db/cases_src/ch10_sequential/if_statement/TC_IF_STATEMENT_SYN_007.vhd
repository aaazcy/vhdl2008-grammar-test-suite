-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: If-statement with compound boolean condition combining and, or, not operators across three boolean inputs — condition `(a and not b) or (c and b)` selects output value based on truth-table logic; exercises if_statement where the condition expression is a non-trivial logical formula with parentheses grouping, relational operators absent, pure boolean algebraic expression gating a mux-style assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_bool_expr_ent is port(
  a, b, c : in  boolean;
  result  : out integer range 0 to 3
); end entity;
architecture bh of if_bool_expr_ent is
begin
  process(a, b, c) begin
    if (a and not b) or (c and b) then
      result <= 1;
    elsif a and b and c then
      result <= 2;
    elsif not a and not b and not c then
      result <= 3;
    else
      result <= 0;
    end if;
  end process;
end architecture bh;
